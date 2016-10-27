package com.demo.entity;

public class Manager {
    private String managerName;

    private String managerPwd;

    private Integer managerRole;

    private String collegeName;

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName == null ? null : managerName.trim();
    }

    public String getManagerPwd() {
        return managerPwd;
    }

    public void setManagerPwd(String managerPwd) {
        this.managerPwd = managerPwd == null ? null : managerPwd.trim();
    }

    public Integer getManagerRole() {
        return managerRole;
    }

    public void setManagerRole(Integer managerRole) {
        this.managerRole = managerRole;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName == null ? null : collegeName.trim();
    }
}