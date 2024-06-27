package com.digiTech.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digiTech.app.models.Holiday;
import com.digiTech.app.service.CalendarService;

@RestController
@RequestMapping("api/calendar")
@CrossOrigin(origins = "http://localhost:4200")
public class CalendarController {

    @Autowired
    CalendarService calendarSvc;
    
    @GetMapping("/all-holidays")
    public ResponseEntity<List<Holiday>> getAllHolidays() {
        List<Holiday> holidays = calendarSvc.getAllHolidays();
        return ResponseEntity.ok(holidays);
    }
    
}



