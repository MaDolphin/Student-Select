package com.demo.controller;

import com.demo.dao.TeacherMapper;
import com.demo.entity.Intention;
import com.demo.entity.Manager;
import com.demo.service.ManagerService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.demo.entity.Student;
import com.demo.entity.Teacher;
import com.demo.service.StudentService;
import com.demo.service.TeacherService;
import com.demo.util.Md5;
import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @Resource
    private ManagerService managerService;


    @RequestMapping("/teacherInfo")
    public String teacherInfo(HttpSession session,String majorId) {
        List<Teacher> teacherList = teacherService.teacherInfoByMajorId(majorId);
        session.setAttribute("teacherList",teacherList);
        return "/backstage/ShowTeacherInfoByMajor";
    }

    @RequestMapping("/editPasswordView")
    public String editPasswordView() {
        return "/backstage/EditPassword";
    }

    @RequestMapping("/editPassword")
    @ResultMap("BaseResultMap")
    public String editPassword(String id,String newPassword,String role) {
        newPassword = Md5.Md5(newPassword);
        if(role.equals("student")){
            Student student = studentService.findStudentByStudentId(id);
            student.setStudentPwd(newPassword);
            studentService.updateStudent(student);
        }else if(role.equals("teacher")){
            Teacher teacher = teacherService.findTeacherByTeacherId(id);
            teacher.setTeacherPwd(newPassword);
            teacherService.updateTeacher(teacher);
        }else {
            Manager manager = managerService.findManagerByManagerId(id);
            manager.setManagerPwd(newPassword);
            managerService.updateManager(manager);
        }

        return "redirect:/student/editSuccess";
    }

    @RequestMapping("/editSuccess")
    public String editSuccess() {
        return "/common/right";
    }

    @RequestMapping("/fillTeacher")
    public String fillTeacher (HttpSession session,String majorId,String studentId){
        List<Intention> intentionList = studentService.findIntention(studentId);
        List<Teacher> teacherList = teacherService.teacherInfoByMajorId(majorId);
        int flag = 0;
        session.setAttribute("teacherList",teacherList);
        if(intentionList.size()!=0){
            flag = 1;
            session.setAttribute("intentionList",intentionList);
        }
        session.setAttribute("flag",flag);
        return "/backstage/VoluntaryReport";
    }

    @RequestMapping("/voluntaryReport")
    public String voluntaryReport(String studentId,String first_intention,String second_intention,String third_intention,int flag,String majorId) {

        if(flag == 0){
            Intention intention = new Intention();
            intention.setStudentId(studentId);
            intention.setFirstIntention(first_intention);
            intention.setSecondIntention(second_intention);
            intention.setThirdIntention(third_intention);
            intention.setFirstOpttype(0);
            intention.setSecondOpttype(0);
            intention.setThirdOpttype(0);
            studentService.addIntention(intention);
        }else if(flag == 1){
            Intention intention = studentService.findIntentionByStudentId(studentId);
            intention.setFirstIntention(first_intention);
            intention.setSecondIntention(second_intention);
            intention.setThirdIntention(third_intention);
            studentService.updateIntention(intention);
        }
        return "redirect:/student/fillTeacher?studentId="+studentId+"&majorId="+majorId;
    }
}
