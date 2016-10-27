package com.demo.serviceImpl;

import com.demo.dao.TeacherMapper;
import com.demo.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Resource
    private TeacherMapper teacherDao;

    public int isExist(String userName,String password){
        return teacherDao.isExist(userName,password);
    }
}
