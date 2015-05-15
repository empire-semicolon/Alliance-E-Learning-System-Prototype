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
public class PresentationBean {
    
    public int intPresentationId;
    public String strFileName;
    public String strFileType;
    public String strFilePath;
    public double dblFileSize;
    public String strFileDescription;
    public Timestamp tsDateUploaded;
    public int intRecordStatus;
    public int intChapterId;

    public int getIntPresentationId() {
        return intPresentationId;
    }

    public void setIntPresentationId(int intPresentationId) {
        this.intPresentationId = intPresentationId;
    }

    public String getStrFileName() {
        return strFileName;
    }

    public void setStrFileName(String strFileName) {
        this.strFileName = strFileName;
    }

    public String getStrFileType() {
        return strFileType;
    }

    public void setStrFileType(String strFileType) {
        this.strFileType = strFileType;
    }

    public String getStrFilePath() {
        return strFilePath;
    }

    public void setStrFilePath(String strFilePath) {
        this.strFilePath = strFilePath;
    }

    public double getDblFileSize() {
        return dblFileSize;
    }

    public void setDblFileSize(double dblFileSize) {
        this.dblFileSize = dblFileSize;
    }

    public String getStrFileDescription() {
        return strFileDescription;
    }

    public void setStrFileDescription(String strFileDescription) {
        this.strFileDescription = strFileDescription;
    }

    public Timestamp getTsDateUploaded() {
        return tsDateUploaded;
    }

    public void setTsDateUploaded(Timestamp tsDateUploaded) {
        this.tsDateUploaded = tsDateUploaded;
    }

    public int getIntRecordStatus() {
        return intRecordStatus;
    }

    public void setIntRecordStatus(int intRecordStatus) {
        this.intRecordStatus = intRecordStatus;
    }

    public int getIntChapterId() {
        return intChapterId;
    }

    public void setIntChapterId(int intChapterId) {
        this.intChapterId = intChapterId;
    }
    
    
    
}
