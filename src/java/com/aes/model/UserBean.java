/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Bryan
 */
public class UserBean {
    
    public int intUserId;
    public String strUserName;
    public String strPassword;
    public String strFirstName;
    public String strMiddleName;
    public String strLastName;
    public Date dateBirthday;
    public String strPosition;
    public String strEmail;
    public Timestamp tsDateCreated;
    public int intRecordStatus;
    public int intUserTypeID;

    public int getIntUserId() {
        return intUserId;
    }

    public void setIntUserId(int intUserId) {
        this.intUserId = intUserId;
    }

    public String getStrUserName() {
        return strUserName;
    }

    public void setStrUserName(String strUserName) {
        this.strUserName = strUserName;
    }

    public String getStrPassword() {
        return strPassword;
    }

    public void setStrPassword(String strPassword) {
        this.strPassword = strPassword;
    }

    public String getStrFirstName() {
        return strFirstName;
    }

    public void setStrFirstName(String strFirstName) {
        this.strFirstName = strFirstName;
    }

    public String getStrMiddleName() {
        return strMiddleName;
    }

    public void setStrMiddleName(String strMiddleName) {
        this.strMiddleName = strMiddleName;
    }

    public String getStrLastName() {
        return strLastName;
    }

    public void setStrLastName(String strLastName) {
        this.strLastName = strLastName;
    }

    public Date getDateBirthday() {
        return dateBirthday;
    }

    public void setDateBirthday(Date dateBirthday) {
        this.dateBirthday = dateBirthday;
    }

    public String getStrPosition() {
        return strPosition;
    }

    public void setStrPosition(String strPosition) {
        this.strPosition = strPosition;
    }

    public String getStrEmail() {
        return strEmail;
    }

    public void setStrEmail(String strEmail) {
        this.strEmail = strEmail;
    }

    public Timestamp getTsDateCreated() {
        return tsDateCreated;
    }

    public void setTsDateCreated(Timestamp tsDateCreated) {
        this.tsDateCreated = tsDateCreated;
    }

    public int getIntRecordStatus() {
        return intRecordStatus;
    }

    public void setIntRecordStatus(int intRecordStatus) {
        this.intRecordStatus = intRecordStatus;
    }

    public int getIntUserTypeID() {
        return intUserTypeID;
    }

    public void setIntUserTypeID(int intUserTypeID) {
        this.intUserTypeID = intUserTypeID;
    }
    
    
    
    
    
    
}
