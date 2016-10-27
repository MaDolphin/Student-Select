package com.demo.service;

import com.demo.entity.Student;
import com.demo.entity.Teacher;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface StudentService {
    public Student isExist(String userName, String password);
    public int editPassword(Student student);

}
