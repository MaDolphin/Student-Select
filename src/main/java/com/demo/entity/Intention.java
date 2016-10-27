package com.demo.entity;

public class Intention {
    private Integer id;

    private String studentId;

    private String firstIntention;

    private String secondIntention;

    private String thirdIntention;

    private Integer firstOpttype;

    private Integer secondOpttype;

    private Integer thirdOpttype;

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