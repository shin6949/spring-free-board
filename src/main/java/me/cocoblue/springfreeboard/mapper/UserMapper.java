package me.cocoblue.springfreeboard.mapper;

import me.cocoblue.springfreeboard.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserDTO findByUsername(String username);
}
