package me.cocoblue.springfreeboard.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.ServletRegistration;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    private final int MAX_SIZE = 10 * 1024 * 1024; //10MB

    // Static 파일들(css, js, images) 등의 URI와 위치를 정의
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(20);
    }

    @Bean
    public MultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(MAX_SIZE);
        multipartResolver.setMaxUploadSizePerFile(MAX_SIZE);
        multipartResolver.setMaxInMemorySize(0);
        return multipartResolver;
    }
}