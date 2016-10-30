package com.demo.service;

import com.demo.entity.*;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface ManagerService {
    public Manager isExist(String userName, String password, int role);
    public boolean studentFileToDB(MultipartFile file);
    public boolean teacherFileToDB(MultipartFile file);
    public boolean majorFileToDB(MultipartFile file);
    public boolean checkExcelSheet(Workbook wb,String sheetName);
    public void studentIntoDB(List<Student> studentList);
    public void teacherIntoDB(List<Teacher> teacherList);
    public void majorIntoDB(List<Major> majorList);
    public List<Intention> findIntentionByCollegeName(String collegeName);
    public List<Student> findSwapStudentByCollegeName(String collegeName);
    public Sysfunction checkAuthority(String type);
    public void updateSysFunction(Sysfunction sysfunction);
    public Major selectByPrimaryKey(String majorId);
    public List<Student> findAllStudent();
    public List<Teacher> findAllTeacher();
    public List<Manager> findAllManger2();
    public List<Major> findAllMajor();
    public void resetStudentPassword(String studentId);
    public void resetTeacherPassword(String teacherId);
    public void resetManager2Password(String managerName);
}
