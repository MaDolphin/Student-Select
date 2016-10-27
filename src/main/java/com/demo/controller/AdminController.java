package com.demo.controller;

import com.demo.service.ManagerService;
import com.demo.util.Md5;
import org.springframework.batch.core.step.tasklet.SystemCommandException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

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
        try {
            if(upload1.getSize() != 0)
                managerService.studentFileToDB(upload1);
            if(upload2.getSize() != 0)
                managerService.teacherFileToDB(upload2);
            if(upload3.getSize() != 0)
                managerService.majorFileToDB(upload3);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/batchImport";
    }
}
