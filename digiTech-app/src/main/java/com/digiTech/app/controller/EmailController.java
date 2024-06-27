package com.digiTech.app.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.digiTech.app.models.EmailData;
import com.digiTech.app.service.EmailService;

@RestController
@RequestMapping("api/email")
@CrossOrigin(origins = "http://localhost:4200")
public class EmailController {
    
    @Autowired
    EmailService emailSvc;

    @PostMapping("/contact-admin")
    public ResponseEntity<Boolean> sendEmailToAdmin(@RequestBody EmailData emailData) throws IOException {
        emailSvc.sendEmailToAdmin(emailData.getName(), emailData.getUserEmail(), emailData.getSubject(), emailData.getMessage());
        return null;
    }
    
}