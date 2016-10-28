package com.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.demo.entity.Student;
import com.demo.entity.Teacher;
import com.demo.service.StudentService;
import com.demo.service.TeacherService;
import com.demo.util.Md5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
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

    List<Teacher> teacherList;
    @RequestMapping("/teacherInfo")
    public String teacherInfo(HttpSession session,String majorId) {
        teacherList = teacherService.teacherInfoByMajorId(majorId);
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
        return "redirect:/student/editSuccess";
    }

    @RequestMapping("/editSuccess")
    public String editSuccess() {
        return "/common/right";
    }

    @RequestMapping("/fillTeacher")
    public String fillTeacher (HttpSession session){

        String tempStr[] = null;
//        List<Teacher> teacherList =  session.getAttribute("teacherList");

            List<String> optionTeacher = new ArrayList<String>();

            for(int i=0;i<teacherList.size();i++){

                if(!optionTeacher.contains(teacherList.get(i).getTeacherName())){

                    optionTeacher.add(teacherList.get(i).getTeacherName());
                }
            }

            tempStr= new String[optionTeacher.size()+1];

            tempStr[0] = "{teacher:'--请选择--'}";

            for(int i=1;i<optionTeacher.size()+1;i++){

                tempStr[i] = "{teacher:'"+optionTeacher.get(i-1)+"'}";
            }



        JSONArray jsonObjectFromArray = JSONArray.fromObject(tempStr);

        HttpServletResponse response = ServletActionContext.getResponse();

        writeJSONArrayToResponse(response,jsonObjectFromArray);

        return "redirect:/student/editSuccess";
    }
}
