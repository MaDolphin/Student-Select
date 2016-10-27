package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2016/10/25.
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    @RequestMapping("/login")
    public String login(){
        return "/backstage/Login";
    }

    @RequestMapping("/main")
    public String main(){
        return "/backstage/main";
    }

    @RequestMapping("/left")
    public String left(){
        return "/common/left";
    }

    @RequestMapping("/right")
    public String right(){
        return "/common/right";
    }

    @RequestMapping("/top")
    public String top(){
        return "/common/top";
    }
}
