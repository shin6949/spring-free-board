package me.cocoblue.springfreeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class MainController {
    public String getMain() {
        return "main";
    }
}
