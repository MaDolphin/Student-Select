package com.demo.service;

import com.demo.entity.Intention;
import com.demo.entity.Student;
import com.demo.entity.Teacher;

import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface StudentService {
    public Student isExist(String userName, String password);
    public int editPassword(Student student);
    public List<Intention> findIntention(String studentId);
    public void addIntention(Intention intention);
    public void updateIntention(Intention intention);
    public Intention findIntentionByStudentId(String studentId);
    public Student findStudentByStudentId(String studentId);
    public void updateStudent(Student student);


}
