package me.cocoblue.springfreeboard.service;

import lombok.RequiredArgsConstructor;
import me.cocoblue.springfreeboard.dto.ProfileDTO;
import me.cocoblue.springfreeboard.mapper.ProfileMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProfileService {
    private final ProfileMapper profileMapper;

    public boolean isNicknameExists(String nickname) {
        final int result = profileMapper.countByNickname(nickname);
        return result == 0;
    }

    public void insertProfile(long userId, String nickname) {
        ProfileDTO profileDTO = ProfileDTO.builder()
                .userId(userId)
                .nickname(nickname)
                .build();

        profileMapper.insertProfile(profileDTO);
    }
}
