package me.cocoblue.springfreeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class MainController {
    @GetMapping("/main")
    public String getMain() {
        return "main";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }
}
