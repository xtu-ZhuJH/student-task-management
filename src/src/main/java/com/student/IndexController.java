package com.student;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // 必须加这个注解
public class IndexController {

    @GetMapping("/") // 必须加这个注解，路径是/
    public String index() {
        return "系统启动成功！";
    }
}