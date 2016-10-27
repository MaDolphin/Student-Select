package com.demo.controller;

import com.demo.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/admin")
public class ManagerController {
    @Resource
    private ManagerService managerService;

    @RequestMapping("/")
    public String test(Model model){

        return "*/*";
    }
}
