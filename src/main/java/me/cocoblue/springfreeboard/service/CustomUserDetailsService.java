package me.cocoblue.springfreeboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.UserContext;
import me.cocoblue.springfreeboard.dto.UserDTO;
import me.cocoblue.springfreeboard.mapper.UserMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
    private final UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // DB에서 Account 객체 조회
        final UserDTO userDTO = userMapper.findByUsername(username);

        if (userDTO == null) {
            throw new UsernameNotFoundException("UsernameNotFoundException");
        }

        // 권한 정보 등록
        List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority(userDTO.getRole()));

        // AccountContext 생성자로 UserDetails 타입 생성
        return new UserContext(userDTO, roles);
    }
}