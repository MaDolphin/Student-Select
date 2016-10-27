package com.demo.controller;

import com.demo.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Resource
    private ManagerService managerService;

    @RequestMapping("/batchImport")
    public String batchImport(){
        return "/backstage/BatchImport";
    }

    @RequestMapping("/batchImportMethod")
    public String batchImportMethod(MultipartFile file, Model model){
        try {
            managerService.uploadFileToDB(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/backstage/main";
    }
}
