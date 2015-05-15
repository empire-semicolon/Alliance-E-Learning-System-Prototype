/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.model;

import java.sql.Timestamp;

/**
 *
 * @author Bryan
 */
public class CourseBean {
    
    public int intCourseId;
    public String strDescription;
    public Timestamp tsDateCreated;
    public Timestamp tsLastEdited;
    public int intCategoryId;

    public int getIntCourseId() {
        return intCourseId;
    }

    public void setIntCourseId(int intCourseId) {
        this.intCourseId = intCourseId;
    }

    public String getStrDescription() {
        return strDescription;
    }

    public void setStrDescription(String strDescription) {
        this.strDescription = strDescription;
    }

    public Timestamp getTsDateCreated() {
        return tsDateCreated;
    }

    public void setTsDateCreated(Timestamp tsDateCreated) {
        this.tsDateCreated = tsDateCreated;
    }

    public Timestamp getTsLastEdited() {
        return tsLastEdited;
    }

    public void setTsLastEdited(Timestamp tsLastEdited) {
        this.tsLastEdited = tsLastEdited;
    }

    public int getIntCategoryId() {
        return intCategoryId;
    }

    public void setIntCategoryId(int intCategoryId) {
        this.intCategoryId = intCategoryId;
    }
        
   
}
