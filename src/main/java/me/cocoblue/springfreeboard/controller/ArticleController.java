package me.cocoblue.springfreeboard.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/article")
public class ArticleController {
    @GetMapping("/write")
    public String getWrite() {
        return "/article/write";
    }
}
