package com.demo.entity;

public class Teacher {
    private String teacherId;

    private String teacherName;

    private String teacherPwd;

    private String majorId;

    private Integer teacherSurplus;

    private String teacherIntroduction;

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public String getTeacherPwd() {
        return teacherPwd;
    }

    public void setTeacherPwd(String teacherPwd) {
        this.teacherPwd = teacherPwd == null ? null : teacherPwd.trim();
    }

    public String getMajorId() {
        return majorId;
    }

    public void setMajorId(String majorId) {
        this.majorId = majorId == null ? null : majorId.trim();
    }

    public Integer getTeacherSurplus() {
        return teacherSurplus;
    }

    public void setTeacherSurplus(Integer teacherSurplus) {
        this.teacherSurplus = teacherSurplus;
    }

    public String getTeacherIntroduction() {
        return teacherIntroduction;
    }

    public void setTeacherIntroduction(String teacherIntroduction) {
        this.teacherIntroduction = teacherIntroduction == null ? null : teacherIntroduction.trim();
    }
}