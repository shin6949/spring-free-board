package me.cocoblue.springfreeboard.mapper;

import me.cocoblue.springfreeboard.dto.ProfileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProfileMapper {
    int countByNickname(@Param("nickname") String nickname);
    long insertProfile(ProfileDTO profileDTO);
    ProfileDTO getProfileByUserId(@Param("userId") long userId);
}
