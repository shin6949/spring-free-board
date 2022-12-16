package me.cocoblue.springfreeboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import me.cocoblue.springfreeboard.dto.ArticleDTO;
import me.cocoblue.springfreeboard.dto.CustomUserDetails;
import me.cocoblue.springfreeboard.mapper.ArticleMapper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;

@Log4j2
@Controller
@RequestMapping("/article")
@RequiredArgsConstructor
public class ArticleController {
    private final ArticleMapper articleMapper;


    @GetMapping("/write")
    public String getWrite() {
        return "/article/write";
    }

    @PostMapping("/write")
    public String postWrite(ArticleDTO articleDTO, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
        articleDTO.setAuthorId(customUserDetails.getUserInternalId());
        articleDTO.setCreatedAt(LocalDateTime.now());

        log.info(articleMapper.insertArticle(articleDTO));

        return "redirect:/";
    }
}
