package com.demo.serviceImpl;

import com.demo.dao.StudentMapper;
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
}
