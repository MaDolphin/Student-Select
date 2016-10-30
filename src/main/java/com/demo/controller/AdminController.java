package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.ManagerService;
import com.demo.service.StudentService;
import com.demo.service.TeacherService;
import com.demo.util.ExportUtil;
import com.demo.util.Md5;
import org.apache.http.HttpResponse;
import org.springframework.batch.core.step.tasklet.SystemCommandException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private ManagerService managerService;
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;

    @RequestMapping("/batchImport")
    public String batchImport() {
        return "/backstage/BatchImport";
    }

    @RequestMapping("/batchImportMethod")
    public String batchImportMethod(MultipartFile upload1, MultipartFile upload2, MultipartFile upload3, MultipartFile upload4,Model model) {
        if (upload1.getSize() != 0) {
            boolean flag1 = false;
            try {
                if (managerService.studentFileToDB(upload1))
                    flag1 = true;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (upload2.getSize() != 0) {
            boolean flag2 = false;
            try {
                if (managerService.teacherFileToDB(upload2))
                    flag2 = true;
                else flag2 = false;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (upload3.getSize() != 0) {
            boolean flag3 = false;
            try {
                if (managerService.majorFileToDB(upload3))
                    flag3 = true;
                else flag3 = false;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (upload4.getSize() != 0) {
            boolean flag4 = false;
            try {
                if (managerService.managerFileToDB(upload4))
                    flag4 = true;
                else flag4 = false;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/admin/batchImport";
    }

    @RequestMapping("/volunteerRecognitionView")
    public String volunteerRecognitionView(String collegeName, HttpSession session) {
        List<Intention> intentionList = managerService.findIntentionByCollegeName(collegeName);
        session.setAttribute("intentionList", intentionList);
        return "/backstage/ShowIntentionByCollege";
    }

    @RequestMapping("/volunteerRecognition")
    public String volunteerRecognition(String studentId, HttpSession session, String selectTeacher, String collegeName) {
        Student student = studentService.findStudentByStudentId(studentId);
        student.setTeacherId(selectTeacher);
        studentService.updateStudent(student);
        if (!selectTeacher.equals("0") && selectTeacher != null && !selectTeacher.equals("")) {
            Teacher teacher = teacherService.queryTeacherByTeacherId(selectTeacher);
            teacher.setCollageSurplus(teacher.getCollageSurplus() - 1);
            teacherService.updateTeacher(teacher);
        }
        try {
            collegeName = URLEncoder.encode(collegeName, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/voluntarySwapView?collegeName=" + collegeName;
    }

    @RequestMapping("/voluntarySwapView")
    public String voluntarySwapView(String collegeName, HttpSession session) {
        List<Student> studentList = managerService.findSwapStudentByCollegeName(collegeName);
        session.setAttribute("studentList", studentList);
        return "/backstage/ShowVoluntarySwap";
    }

    @RequestMapping("/systemFunction")
    public String systemFunction(HttpSession session) {
        Sysfunction studentFunction = managerService.checkAuthority("student");
        Sysfunction teacherFunction = managerService.checkAuthority("teacher");
        Sysfunction manager2Function = managerService.checkAuthority("manager2");
        session.setAttribute("studentFunction", studentFunction);
        session.setAttribute("teacherFunction", teacherFunction);
        session.setAttribute("manager2Function", manager2Function);
        return "/backstage/SystenFunction";
    }

    @RequestMapping("/systemFunctionEdit")
    public String systemFunctionEdit(int function, String type) {
        Sysfunction systemFunction = managerService.checkAuthority(type);
        systemFunction.setStatus(function);
        managerService.updateSysFunction(systemFunction);
        return "redirect:/admin/systemFunction";
    }

    @RequestMapping("/exportVoluntaryInfo")
    public String exportVoluntaryInfo(String collegeName, HttpServletResponse response, String optype) {
        // dataset
        List<List<String>> dataset = new ArrayList<List<String>>();
        List<Teacher> teacherList = null;
        if(optype.equals("manager2")){
            teacherList = teacherService.exportVoluntaryInfoByCollegeName(collegeName);
        }else if(optype.equals("manager1")){
            teacherList = teacherService.exportVoluntaryInfo();
        }

        // 表头信息
        List<String> excelHeaderForBaseInfo = new ArrayList<String>();
        excelHeaderForBaseInfo.add("导师编号");
        excelHeaderForBaseInfo.add("导师姓名");
        excelHeaderForBaseInfo.add("专业编号");
        excelHeaderForBaseInfo.add("专业名称");
        excelHeaderForBaseInfo.add("学生编号");
        excelHeaderForBaseInfo.add("学生名称");
        excelHeaderForBaseInfo.add("所属学院");

        //导出内容到excel
        for (int i=0;i<teacherList.size();i++) {
            for(int j=0;j<teacherList.get(i).getStudent().size();j++){
                List<String> rowList = new ArrayList<String>();
                rowList.add(teacherList.get(i).getTeacherId());
                rowList.add(teacherList.get(i).getTeacherName());
                rowList.add(teacherList.get(i).getMajor().getMajorId());
                rowList.add(teacherList.get(i).getMajor().getMajorName());
                rowList.add(teacherList.get(i).getStudent().get(j).getStudentId());
                rowList.add(teacherList.get(i).getStudent().get(j).getStudentName());
                rowList.add(teacherList.get(i).getMajor().getCollegeName());
                //把每一个导师的学生都放到dataset里面
                dataset.add(rowList);
            }
        }
        ExportUtil exportUtil = new ExportUtil();

        String exportExcelName =  "志愿信息表";

        try {
            exportExcelName = URLEncoder.encode(exportExcelName, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/attachment");

        response.setHeader("Content-disposition","attachment;filename="+exportExcelName+".xls");

        try {
            ServletOutputStream out = response.getOutputStream();
            exportUtil.exportExcelForHealthInfo("志愿信息表",excelHeaderForBaseInfo,dataset,out);
            out.close();
            //System.out.println("excel export success");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/backstage/main";
    }

    @RequestMapping("/editMajorInfo")
    public String editMajorInfo(String majorId,HttpSession session) {
        Major major = managerService.selectByPrimaryKey(majorId);
        session.setAttribute("major",major);
        return "/backstage/EditMajorInfo";
    }

    @RequestMapping("/editMajor")
    public String editMajorInfo(String majorId,String majorName,String collegeName,HttpSession session) {
        Major major = new Major();
        major.setMajorId(majorId);
        major.setMajorName(majorName);
        major.setCollegeName(collegeName);
        managerService.updateMajor(major);
        return "redirect:/admin/editMajorInfo?majorId="+majorId;
    }

    @RequestMapping("/findAllStudent")
    public String findAllStudent(Model model) {
        List<Student> studentList = managerService.findAllStudent();
        model.addAttribute("studentList",studentList);
        return "/backstage/ShowAllStudentByManager";
    }

    @RequestMapping("/findAllTeacher")
    public String findAllTeacher(Model model) {
        List<Teacher> teacherList = managerService.findAllTeacher();
        model.addAttribute("teacherList",teacherList);
        return "/backstage/ShowAllTeacherByManager";
    }

    @RequestMapping("/findAllManager2")
    public String findAllManager2(Model model) {
        List<Manager> managerList = managerService.findAllManger2();
        model.addAttribute("managerList",managerList);
        return "/backstage/ShowAllManager2ByManager";
    }

    @RequestMapping("/findAllMajor")
    public String findAllMajor(Model model) {
        List<Major> majorList = managerService.findAllMajor();
        model.addAttribute("majorList",majorList);
        return "/backstage/ShowAllMajorByManager";
    }

    @RequestMapping("/resetStudentPassword")
    public String resetStudentPassword(String studentId,Model model) {
        managerService.resetStudentPassword(studentId);
        return "redirect:/admin/findAllStudent";
    }

    @RequestMapping("/resetTeacherPassword")
    public String resetTeacherPassword(String teacherId,Model model) {
        managerService.resetTeacherPassword(teacherId);
        return "redirect:/admin/findAllTeacher";
    }

    @RequestMapping("/resetManager2Password")
    public String resetManager2Password(String managerName,Model model) {
        managerService.resetManager2Password(managerName);
        return "redirect:/admin/findAllManager2";
    }

    @RequestMapping("/findStudentByManager2")
    public String findAllStudentByIntention(String collegeName,Model model) {
        List<Student> studentList = managerService.findAllStudentByIntention(collegeName);
        model.addAttribute("studentList",studentList);
        return "/backstage/ShowStudentByManager2";
    }

    @RequestMapping("/findTeacherByManager2")
    public String findAllTeacherByIntention(String collegeName,Model model) {
        List<Teacher> teacherList = managerService.findAllTeacherByIntention(collegeName);
        model.addAttribute("teacherList",teacherList);
        return "/backstage/ShowTeacherByManager2";
    }
}
