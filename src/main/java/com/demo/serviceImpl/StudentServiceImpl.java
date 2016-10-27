package com.demo.serviceImpl;

import com.demo.dao.StudentMapper;
import com.demo.entity.Student;
import com.demo.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService{
    @Resource
    private StudentMapper studentDao;

    public Student isExist(String userName, String password){
        return studentDao.isExist(userName,password);
    }

    public int editPassword(Student student){
        return studentDao.editPassword(student);
    }
}
