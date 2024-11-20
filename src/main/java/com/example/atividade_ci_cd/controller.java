package com.example.atividade_ci_cd;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controller {


    @GetMapping("/get")
    public String get(){
        return "Hello world!";
    }
}
