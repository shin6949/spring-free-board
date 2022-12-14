package me.cocoblue.springfreeboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.User;
import me.cocoblue.springfreeboard.dto.UserRole;
import me.cocoblue.springfreeboard.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class UserService {
    private final UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public boolean isUsernameExists(String username) {
        final int result = userMapper.countByUsername(username);
        return result == 0;
    }

    public boolean isEmailExists(String email) {
        final int result = userMapper.countByEmail(email);
        return result == 0;
    }

    public long insertUserAndReturnInternalId(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(UserRole.USER.name());
        userMapper.insertUser(user);

        return user.getInternalId();
    }
}
