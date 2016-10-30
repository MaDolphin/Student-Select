package com.demo.controller;

import com.demo.entity.Manager;
import com.demo.entity.Student;
import com.demo.entity.Sysfunction;
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

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("role");
        session.removeAttribute("manager1");
        session.removeAttribute("manager2");
        session.removeAttribute("teacher");
        session.removeAttribute("student");
        session.removeAttribute("id");
        return "redirect:/index/login";
    }

    @RequestMapping("/main")
    public String main(String userName, String password, String identity, HttpSession session) {
        password = Md5.Md5(password);
        if (identity.equals("manager1")) {
            if (managerService.isExist(userName, password, 0) != null) {
                Manager manager1 = managerService.isExist(userName, password,0);
                session.removeAttribute("role");
                session.removeAttribute("manager1");
                session.removeAttribute("manager2");
                session.removeAttribute("teacher");
                session.removeAttribute("student");
                session.removeAttribute("id");
                session.setAttribute("role", "manager1");
                session.setAttribute("manager1", manager1);
                session.setAttribute("id", manager1.getManagerName());
                return "/backstage/main";
            }
        } else if (identity.equals("student")) {
            if (studentService.isExist(userName, password) != null) {
                Student student = studentService.isExist(userName, password);
                Sysfunction sysfunction = managerService.checkAuthority("student");
                session.removeAttribute("role");
                session.removeAttribute("manager1");
                session.removeAttribute("manager2");
                session.removeAttribute("teacher");
                session.removeAttribute("student");
                session.removeAttribute("id");
                session.setAttribute("sysfunction",sysfunction.getStatus());
                session.setAttribute("role", "student");
                session.setAttribute("student", student);
                session.setAttribute("id", student.getStudentId());
                return "/backstage/main";
            }
        } else if (identity.equals("teacher")) {
            if (teacherService.isExist(userName, password) != null) {
                Teacher teacher = teacherService.isExist(userName, password);
                Sysfunction sysfunction = managerService.checkAuthority("teacher");
                session.removeAttribute("role");
                session.removeAttribute("manager1");
                session.removeAttribute("manager2");
                session.removeAttribute("teacher");
                session.removeAttribute("student");
                session.removeAttribute("id");
                session.setAttribute("sysfunction",sysfunction.getStatus());
                session.setAttribute("role", "teacher");
                session.setAttribute("teacher", teacher);
                session.setAttribute("id", teacher.getTeacherId());
                return "/backstage/main";
            }
        } else if (identity.equals("manager2")) {
            if (managerService.isExist(userName, password, 1) != null) {
                Manager manager2 = managerService.isExist(userName, password,1);
                Sysfunction sysfunction = managerService.checkAuthority("manager2");
                session.removeAttribute("role");
                session.removeAttribute("manager1");
                session.removeAttribute("manager2");
                session.removeAttribute("teacher");
                session.removeAttribute("student");
                session.removeAttribute("id");
                session.setAttribute("sysfunction",sysfunction.getStatus());
                session.setAttribute("role", "manager2");
                session.setAttribute("manager2", manager2);
                session.setAttribute("id", manager2.getManagerName());
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
