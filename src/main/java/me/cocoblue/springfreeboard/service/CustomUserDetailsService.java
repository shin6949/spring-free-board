package me.cocoblue.springfreeboard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.CustomUserDetails;
import me.cocoblue.springfreeboard.dto.ProfileDTO;
import me.cocoblue.springfreeboard.dto.User;
import me.cocoblue.springfreeboard.mapper.ProfileMapper;
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
    private final ProfileMapper profileMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // DB에서 Account 객체 조회
        final User user = userMapper.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("UsernameNotFoundException");
        }

        // 권한 정보 등록
        List<GrantedAuthority> roles = new ArrayList<>(List.of(new SimpleGrantedAuthority(user.getRole())));
        final ProfileDTO profileDTO = profileMapper.getProfileByUserId(user.getInternalId());

        // AccountContext 생성자로 UserDetails 타입 생성
        return new CustomUserDetails(user, profileDTO, roles);
    }
}