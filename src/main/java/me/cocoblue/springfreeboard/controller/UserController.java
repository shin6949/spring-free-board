package me.cocoblue.springfreeboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.User;
import me.cocoblue.springfreeboard.dto.UserDTO;
import me.cocoblue.springfreeboard.service.ProfileService;
import me.cocoblue.springfreeboard.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Log4j2
public class UserController {
    private final UserService userService;
    private final ProfileService profileService;

    @GetMapping("/register")
    public String getRegister() {
        return "user/register";
    }

    @PostMapping("/register")
    public String postRegister(UserDTO userDTO, Model model) {
        try {
            long insertedInternalId = userService.insertUserAndReturnInternalId(userDTO.toUser());
            profileService.insertProfile(insertedInternalId, userDTO.getNickname());

            model.addAttribute("message", "회원가입에 성공하였습니다. 입력하신 정보로 로그인해주세요.");
            model.addAttribute("url", "/login");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "회원가입에 실패하였습니다. 입력하신 정보를 다시 확인해주세요.");
            model.addAttribute("url", "/user/register");
        }

        return "user/register_result";
    }

    @PostMapping("/username_check")
    @ResponseBody
    public boolean getUsernameExists(@RequestParam(name = "username") String username) {
        return userService.isUsernameExists(username);
    }

    @PostMapping("/email_check")
    @ResponseBody
    public boolean getEmailExists(@RequestParam(name = "email") String email) {
        return userService.isEmailExists(email);
    }

    @PostMapping("/nickname_check")
    @ResponseBody
    public boolean getNicknameExists(@RequestParam(name = "nickname") String nickname) {
        return profileService.isNicknameExists(nickname);
    }
}
