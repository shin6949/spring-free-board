package me.cocoblue.springfreeboard.mapper;

import me.cocoblue.springfreeboard.dto.ArticleDTO;
import me.cocoblue.springfreeboard.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArticleMapper {
    int insertArticle(ArticleDTO articleDTO);
    List<ArticleDTO> findAllOrderByCreatedAt();
}
