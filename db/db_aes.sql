SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`user_type` (
  `userTypeId` INT NOT NULL ,
  `userType` VARCHAR(45) NULL ,
  PRIMARY KEY (`userTypeId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`user_details` (
  `userId` INT NOT NULL ,
  `firstName` VARCHAR(45) NOT NULL ,
  `middleName` VARCHAR(45) NOT NULL ,
  `lastName` VARCHAR(45) NOT NULL ,
  `position` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `dateCreated` DATETIME NOT NULL ,
  `recordStatus` TINYINT(1) NOT NULL ,
  `userTypeId` INT NOT NULL ,
  `user_type_userTypeId` INT NOT NULL ,
  PRIMARY KEY (`userId`, `userTypeId`) ,
  INDEX `fk_user_details_user_type1_idx` (`user_type_userTypeId` ASC) ,
  CONSTRAINT `fk_user_details_user_type1`
    FOREIGN KEY (`user_type_userTypeId` )
    REFERENCES `mydb`.`user_type` (`userTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`credentials`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`credentials` (
  `userId` INT NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NULL ,
  `user_details_userId` INT NOT NULL ,
  `user_details_userTypeId` INT NOT NULL ,
  PRIMARY KEY (`userId`, `username`) ,
  UNIQUE INDEX `userName_UNIQUE` (`username` ASC) ,
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) ,
  INDEX `fk_credentials_user_details_idx` (`user_details_userId` ASC, `user_details_userTypeId` ASC) ,
  CONSTRAINT `fk_credentials_user_details`
    FOREIGN KEY (`user_details_userId` , `user_details_userTypeId` )
    REFERENCES `mydb`.`user_details` (`userId` , `userTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT ,
  `categoryName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`categoryId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`course` (
  `courseId` INT NOT NULL ,
  `name` VARCHAR(60) NOT NULL ,
  `description` LONGTEXT NULL ,
  `dateCreated` VARCHAR(45) NULL ,
  `lastEdited` VARCHAR(45) NULL ,
  `trainers` INT NULL ,
  `user_details_userId` INT NOT NULL ,
  `user_details_userTypeId` INT NOT NULL ,
  `category_categoryId` INT NOT NULL ,
  PRIMARY KEY (`courseId`) ,
  INDEX `fk_course_user_details1_idx` (`user_details_userId` ASC, `user_details_userTypeId` ASC) ,
  INDEX `fk_course_category1_idx` (`category_categoryId` ASC) ,
  CONSTRAINT `fk_course_user_details1`
    FOREIGN KEY (`user_details_userId` , `user_details_userTypeId` )
    REFERENCES `mydb`.`user_details` (`userId` , `userTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_category1`
    FOREIGN KEY (`category_categoryId` )
    REFERENCES `mydb`.`category` (`categoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`presentation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`presentation` (
  `presentationId` INT NOT NULL ,
  `chapterId` INT NOT NULL ,
  `fileName` VARCHAR(45) NULL ,
  `fileType` VARCHAR(45) NULL ,
  `fileSize` DOUBLE NULL ,
  `filePath` LONGTEXT NULL ,
  `description` LONGTEXT NULL ,
  `dateUploaded` VARCHAR(45) NULL ,
  `recordStatus` TINYINT(1) NULL ,
  PRIMARY KEY (`presentationId`, `chapterId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`chapter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`chapter` (
  `chapterId` INT NOT NULL ,
  `courseId` INT NOT NULL ,
  `description` LONGTEXT NULL ,
  `course_courseId` INT NOT NULL ,
  `presentation_presentationId` INT NOT NULL ,
  `presentation_chapterId` INT NOT NULL ,
  PRIMARY KEY (`chapterId`, `courseId`) ,
  INDEX `fk_chapter_course1_idx` (`course_courseId` ASC) ,
  INDEX `fk_chapter_presentation1_idx` (`presentation_presentationId` ASC, `presentation_chapterId` ASC) ,
  CONSTRAINT `fk_chapter_course1`
    FOREIGN KEY (`course_courseId` )
    REFERENCES `mydb`.`course` (`courseId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chapter_presentation1`
    FOREIGN KEY (`presentation_presentationId` , `presentation_chapterId` )
    REFERENCES `mydb`.`presentation` (`presentationId` , `chapterId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exam`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`exam` (
  `examId` INT NOT NULL ,
  `courseId` INT NOT NULL ,
  `dateCreated` VARCHAR(45) NULL ,
  `dateEdited` VARCHAR(45) NULL ,
  `questions` LONGTEXT NULL ,
  `timeLimit` INT NULL ,
  `course_courseId` INT NOT NULL ,
  PRIMARY KEY (`examId`, `courseId`) ,
  INDEX `fk_exam_course1_idx` (`course_courseId` ASC) ,
  CONSTRAINT `fk_exam_course1`
    FOREIGN KEY (`course_courseId` )
    REFERENCES `mydb`.`course` (`courseId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exam_scores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`exam_scores` (
  `examId` INT NOT NULL ,
  `userId` INT NOT NULL ,
  `score` FLOAT NULL ,
  `user_details_userId` INT NOT NULL ,
  `user_details_userTypeId` INT NOT NULL ,
  `exam_examId` INT NOT NULL ,
  `exam_courseId` INT NOT NULL ,
  PRIMARY KEY (`examId`, `userId`, `user_details_userId`, `user_details_userTypeId`) ,
  INDEX `fk_exam_scores_user_details1_idx` (`user_details_userId` ASC, `user_details_userTypeId` ASC) ,
  INDEX `fk_exam_scores_exam1_idx` (`exam_examId` ASC, `exam_courseId` ASC) ,
  CONSTRAINT `fk_exam_scores_user_details1`
    FOREIGN KEY (`user_details_userId` , `user_details_userTypeId` )
    REFERENCES `mydb`.`user_details` (`userId` , `userTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_scores_exam1`
    FOREIGN KEY (`exam_examId` , `exam_courseId` )
    REFERENCES `mydb`.`exam` (`examId` , `courseId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`courses_taken`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`courses_taken` (
  `courseId` INT NOT NULL ,
  `userId` INT NOT NULL ,
  `user_details_userId` INT NOT NULL ,
  `user_details_userTypeId` INT NOT NULL ,
  `course_courseId` INT NOT NULL ,
  PRIMARY KEY (`courseId`, `userId`) ,
  INDEX `fk_courses_taken_user_details1_idx` (`user_details_userId` ASC, `user_details_userTypeId` ASC) ,
  INDEX `fk_courses_taken_course1_idx` (`course_courseId` ASC) ,
  CONSTRAINT `fk_courses_taken_user_details1`
    FOREIGN KEY (`user_details_userId` , `user_details_userTypeId` )
    REFERENCES `mydb`.`user_details` (`userId` , `userTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_taken_course1`
    FOREIGN KEY (`course_courseId` )
    REFERENCES `mydb`.`course` (`courseId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
