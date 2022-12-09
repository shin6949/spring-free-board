package me.cocoblue.springfreeboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.mapper.ProfileMapper;
import me.cocoblue.springfreeboard.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Log4j2
public class UserController {
    private final UserMapper userMapper;
    private final ProfileMapper profileMapper;

    @GetMapping("/register")
    public String getRegister() {
        return "user/register";
    }

    @PostMapping("/username_check")
    @ResponseBody
    public boolean getUsernameExists(@RequestParam(name = "username") String username) {
        final int result = userMapper.countByUsername(username);
        return result == 0;
    }

    @PostMapping("/email_check")
    @ResponseBody
    public boolean getEmailExists(@RequestParam(name = "email") String email) {
        final int result = userMapper.countByEmail(email);
        return result == 0;
    }

    @PostMapping("/nickname_check")
    @ResponseBody
    public boolean getNicknameExists(@RequestParam(name = "nickname") String nickname) {
        final int result = profileMapper.countByNickname(nickname);
        return result == 0;
    }
}
