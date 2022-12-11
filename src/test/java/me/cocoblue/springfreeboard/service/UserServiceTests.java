package me.cocoblue.springfreeboard.service;

import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Log4j2
class UserServiceTests {
    @Autowired
    private UserService userService;

    @Test
    void insertTest() {
        final User user = User.builder()
                .username("TEST1234")
                .name("홍길동")
                .email("1234@naver.co.kr")
                .password("123456677")
                .build();

        userService.insertUserAndReturnInternalId(user);
        log.info("internalId at user: " + user.getInternalId());
    }
}
