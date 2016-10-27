package com.demo.controller;

import com.demo.entity.Student;
import com.demo.entity.Teacher;
import com.demo.service.StudentService;
import com.demo.service.TeacherService;
import com.demo.util.Md5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;

    @RequestMapping("/teacherInfo")
    public String teacherInfo(HttpSession session,String majorId) {
        List<Teacher> teacherList = teacherService.teacherInfoByMajorId(majorId);
        session.setAttribute("teacherList",teacherList);
        return "/backstage/AddSubstation";
    }

    @RequestMapping("/editPasswordView")
    public String editPasswordView() {
        return "/backstage/EditPassword";
    }

    @RequestMapping("/editPassword")
    public String editPassword(Student student,String newPassword) {
        newPassword = Md5.Md5(newPassword);
        student.setStudentPwd(newPassword);
        studentService.editPassword(student);
        return "/backstage/main";
    }
}
