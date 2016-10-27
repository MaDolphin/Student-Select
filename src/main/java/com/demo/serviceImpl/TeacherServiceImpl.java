package com.demo.serviceImpl;

import com.demo.dao.TeacherMapper;
import com.demo.entity.Teacher;
import com.demo.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Resource
    private TeacherMapper teacherDao;

    public Teacher isExist(String userName, String password){
        return teacherDao.isExist(userName,password);
    }

    public List<Teacher> teacherInfoByMajorId(String majorId){
        return teacherDao.teacherInfoByMajorId(majorId);
    }
}
