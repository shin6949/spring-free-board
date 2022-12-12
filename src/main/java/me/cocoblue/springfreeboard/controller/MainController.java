package me.cocoblue.springfreeboard.controller;

import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.CustomUserDetails;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j2
@Controller
@RequestMapping("")
public class MainController {
    @GetMapping({"/main", "/success", "/"})
    public String getMain(@AuthenticationPrincipal CustomUserDetails customUserDetails) {
        log.info("CURRENT USER: " + customUserDetails.getProfileDTO());

        return "main";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model, @RequestParam(name = "fail", required = false) boolean isFail) {
        model.addAttribute("fail", isFail);

        return "login";
    }
}
