package com.demo.entity;

import java.util.List;

public class Teacher {
    private String teacherId;

    private String teacherName;

    private String teacherPwd;

    private String majorId;

    private Integer teacherSurplus;

    private Integer collageSurplus;

    private String teacherIntroduction;

    private Major major;

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
    }

    private List<Student> student;

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

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

    public Integer getCollageSurplus() {
        return collageSurplus;
    }

    public void setCollageSurplus(Integer collageSurplus) {
        this.collageSurplus = collageSurplus;
    }

    public String getTeacherIntroduction() {
        return teacherIntroduction;
    }

    public void setTeacherIntroduction(String teacherIntroduction) {
        this.teacherIntroduction = teacherIntroduction == null ? null : teacherIntroduction.trim();
    }
}