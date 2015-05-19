/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.model;

/**
 *
 * @author Bryan
 */
public class ChapterBean {
    
    public int intChapterId;
    public String strDescription;
    public int intCourseId;

    @Override
    public String toString() {
        return "ChapterBean{" + "intChapterId=" + intChapterId + ", strDescription=" + strDescription + ", intCourseId=" + intCourseId + '}';
    }

    public int getIntChapterId() {
        return intChapterId;
    }

    public void setIntChapterId(int intChapterId) {
        this.intChapterId = intChapterId;
    }

    public String getStrDescription() {
        return strDescription;
    }

    public void setStrDescription(String strDescription) {
        this.strDescription = strDescription;
    }

    public int getIntCourseId() {
        return intCourseId;
    }

    public void setIntCourseId(int intCourseId) {
        this.intCourseId = intCourseId;
    }    
    
}
