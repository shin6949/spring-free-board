package me.cocoblue.springfreeboard.controller;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@Log4j2
class UserControllerTests {
    @Autowired
    private UserController userController;
    private MockMvc mockMvc;

    @BeforeEach
    public void init() {
        mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
    }

    @Test
    public void registerTest() throws Exception {
        MultiValueMap<String, String> data = new LinkedMultiValueMap<>();
        data.add("name", "홍길동");
        data.add("username", "test1234");
        data.add("password", "test1234");
        data.add("passwordRe", "test1234");
        data.add("email", "test1234@naver.co.kr");
        data.add("nickname", "나는홍길동");

        mockMvc.perform(post("/user/register").params(data)).andExpect(status().isOk()).andDo(print());
    }
}
