package com.demo.service;

import com.demo.entity.Teacher;

import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface TeacherService {
    public Teacher isExist(String userName, String password);
    public List<Teacher> teacherInfoByMajorId(String majorId);
}
