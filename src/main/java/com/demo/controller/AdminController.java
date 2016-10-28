package com.demo.controller;

import com.demo.service.ManagerService;
import com.demo.util.Md5;
import org.springframework.batch.core.step.tasklet.SystemCommandException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private ManagerService managerService;

    @RequestMapping("/batchImport")
    public String batchImport(){
        return "/backstage/BatchImport";
    }

    @RequestMapping("/batchImportMethod")
    public String batchImportMethod(MultipartFile upload1,MultipartFile upload2,MultipartFile upload3, Model model){
        if(upload1.getSize() != 0){
            boolean flag1 = false;
            try{
                if(managerService.studentFileToDB(upload1))
                    flag1 = true;

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if(upload2.getSize() != 0){
            boolean flag2 = false;
            try{
                if(managerService.teacherFileToDB(upload1))
                    flag2 = true;
                else flag2 = false;

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if(upload3.getSize() != 0){
            boolean flag3 = false;
            try{
                if(managerService.majorFileToDB(upload1))
                    flag3 = true;
                else flag3 = false;

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return "redirect:/admin/batchImport";
    }
}
