package com.demo.service;

import com.demo.entity.Intention;
import com.demo.entity.Teacher;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface TeacherService {
    public Teacher isExist(String userName, String password);
    public List<Teacher> teacherInfoByMajorId(String majorId);
    public ArrayList<Intention> queryIntentionByTeacher(String teacherId);
    public void acceptStudent(int intentionId,int intentionOrder,String teacherId);
    public void refuseStudent(int intentionId,int intentionOrder,String teacherId);
    public Teacher queryTeacherByTeacherId(String teacherId);
    public void updateTeacher(Teacher teacher);
    public List<Teacher> exportVoluntaryInfoByCollegeName(String collegeName);
    public List<Teacher> exportVoluntaryInfo();

}
