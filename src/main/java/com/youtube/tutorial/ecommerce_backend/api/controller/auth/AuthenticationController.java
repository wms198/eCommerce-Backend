package com.youtube.tutorial.ecommerce_backend.api.controller.auth;


import com.youtube.tutorial.ecommerce_backend.api.model.LoginBody;
import com.youtube.tutorial.ecommerce_backend.api.model.LoginResponse;
import com.youtube.tutorial.ecommerce_backend.api.model.RegistrationBody;
import com.youtube.tutorial.ecommerce_backend.exception.UserAlreadyExistsException;
import com.youtube.tutorial.ecommerce_backend.model.LocalUser;
import com.youtube.tutorial.ecommerce_backend.service.UserService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthenticationController {


    private UserService userService;

    public AuthenticationController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public ResponseEntity registerUser(@Valid @RequestBody RegistrationBody registrationBody)  {
        //System.out.println(registrationBody.getUsername());
        try {
            userService.registerUser(registrationBody);
            return ResponseEntity.ok().build();
        } catch(UserAlreadyExistsException ex){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> loginUser(@Valid @RequestBody LoginBody loginBody) {
        String jwt = userService.loginUser(loginBody);
        if (jwt == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }else {
            LoginResponse response = new LoginResponse();
            response.setJwt(jwt);
            return ResponseEntity.ok(response);

        }
    }

    @GetMapping("/me")
    public LocalUser getLoggedInUserProfile(@AuthenticationPrincipal LocalUser user) {
        return user;
    }
}
