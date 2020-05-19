package ru.kpfu.itits.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.kpfu.itits.demo.dto.SignUpDto;
import ru.kpfu.itits.demo.service.SignUpService;

@Controller
public class SignInUpController {
    @Autowired
    SignUpService signUpService;
    @GetMapping("/signIn")
    String getSignInPage(){
        return "sign_in";
    }

    @GetMapping("/signUp")
    String getSignUpPage(){
            return "sign_up";


    }
    @PostMapping("/signUp")
    String postSignUp(Model model, SignUpDto signUpDto){
         signUpService.signUp(signUpDto);

        return "redirect:/signIn";
    }
}
