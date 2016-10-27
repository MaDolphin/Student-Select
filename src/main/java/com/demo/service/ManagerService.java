package com.demo.service;

import com.demo.entity.Major;
import com.demo.entity.Student;
import com.demo.entity.Teacher;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */

public interface ManagerService {
    public int isExist(String userName,String password,int role);
    public boolean uploadFileToDB(MultipartFile file);
    public boolean checkExcelSheet(Workbook wb,int sheetNum);
    public void studentIntoDB(List<Student> studentList);
    public void teacherIntoDB(List<Teacher> teacherList);
    public void majorIntoDB(List<Major> majorList);
}
