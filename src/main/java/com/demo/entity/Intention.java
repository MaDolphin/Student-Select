package com.demo.entity;

import java.util.List;

public class Intention {
    private Integer id;

    private String studentId;

    private String firstIntention;

    private String secondIntention;

    private String thirdIntention;

    private Integer firstOpttype;

    private Integer secondOpttype;

    private Integer thirdOpttype;
    
    private Student student;

    private Major major;

    private List<Teacher> teacher;

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public List<Teacher> getTeacher() {
        return teacher;
    }

    public void setTeacher(List<Teacher> teacher) {
        this.teacher = teacher;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getFirstIntention() {
        return firstIntention;
    }

    public void setFirstIntention(String firstIntention) {
        this.firstIntention = firstIntention == null ? null : firstIntention.trim();
    }

    public String getSecondIntention() {
        return secondIntention;
    }

    public void setSecondIntention(String secondIntention) {
        this.secondIntention = secondIntention == null ? null : secondIntention.trim();
    }

    public String getThirdIntention() {
        return thirdIntention;
    }

    public void setThirdIntention(String thirdIntention) {
        this.thirdIntention = thirdIntention == null ? null : thirdIntention.trim();
    }

    public Integer getFirstOpttype() {
        return firstOpttype;
    }

    public void setFirstOpttype(Integer firstOpttype) {
        this.firstOpttype = firstOpttype;
    }

    public Integer getSecondOpttype() {
        return secondOpttype;
    }

    public void setSecondOpttype(Integer secondOpttype) {
        this.secondOpttype = secondOpttype;
    }

    public Integer getThirdOpttype() {
        return thirdOpttype;
    }

    public void setThirdOpttype(Integer thirdOpttype) {
        this.thirdOpttype = thirdOpttype;
    }
}