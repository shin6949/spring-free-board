package me.cocoblue.springfreeboard.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProfileMapper {
    int countByNickname(@Param("nickname") String nickname);
}
