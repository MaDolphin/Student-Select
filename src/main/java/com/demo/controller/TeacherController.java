package com.demo.controller;

import com.demo.entity.Intention;
import com.demo.entity.Teacher;
import com.demo.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;

    @RequestMapping("/showIntentionByTeacher")
    public String showIntentionByTeacher(String teacherId,Model model){
        ArrayList<Intention> intentionList = teacherService.queryIntentionByTeacher(teacherId);
        model.addAttribute("intentionList",intentionList);
        return "/backstage/ShowIntentionByTeacher";
    }

    @RequestMapping("/acceptStudent")
    public String acceptStudent(int intentionId, int intentionOrder, String teacherId,HttpSession session,Model model){
        teacherService.acceptStudent(intentionId,intentionOrder,teacherId);
        Teacher teacher = teacherService.queryTeacherByTeacherId(teacherId);
        session.setAttribute("teacher", teacher);
        return "redirect:/teacher/showIntentionByTeacher?teacherId="+teacherId;
    }

    @RequestMapping("/refuseStudent")
    public String refuseStudent(int intentionId,int intentionOrder,String teacherId,HttpSession session,Model model){
        teacherService.refuseStudent(intentionId,intentionOrder,teacherId);
        Teacher teacher = teacherService.queryTeacherByTeacherId(teacherId);
        session.setAttribute("teacher", teacher);
        return "redirect:/teacher/showIntentionByTeacher?teacherId="+teacherId;
    }
}
