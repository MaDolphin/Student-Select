package com.demo.controller;

import com.demo.entity.Student;
import com.demo.entity.Teacher;
import com.demo.service.ManagerService;
import com.demo.service.StudentService;
import com.demo.service.TeacherService;
import com.demo.util.Md5;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;
    @Resource
    private ManagerService managerService;

    @RequestMapping("/login")
    public String login() {
        return "/backstage/Login";
    }

    @RequestMapping("/main")
    public String main(String userName, String password, String identity, HttpSession session) {
//        System.out.println("---------"+userName+"   "+password+"   "+identity+"--------");
        password = Md5.Md5(password);
        if (identity.equals("manager1")) {
            if (managerService.isExist(userName, password, 0) != 0) {
                session.setAttribute("role", "manager1");
                return "/backstage/main";
            }
        } else if (identity.equals("student")) {
            if (studentService.isExist(userName, password) != null) {
                Student student = studentService.isExist(userName, password);
                session.setAttribute("role", "student");
                session.setAttribute("student", student);
                return "/backstage/main";
            }
        } else if (identity.equals("teacher")) {
            if (teacherService.isExist(userName, password) != null) {
                Teacher teacher = teacherService.isExist(userName, password);
                session.setAttribute("role", "teacher");
                session.setAttribute("teacher", teacher);
                return "/backstage/main";
            }
        } else if (identity.equals("manager2")) {
            if (managerService.isExist(userName, password, 1) != 0) {
                session.setAttribute("role", "manager2");
                return "/backstage/main";
            }
        }
        return "/backstage/Login";
    }

    @RequestMapping("/left")
    public String left() {
        return "/common/left";
    }

    @RequestMapping("/right")
    public String right() {
        return "/common/right";
    }

    @RequestMapping("/top")
    public String top() {
        return "/common/top";
    }

    @RequestMapping("/backMain")
    public String backMain() {
        return "/backstage/main";
    }
}
