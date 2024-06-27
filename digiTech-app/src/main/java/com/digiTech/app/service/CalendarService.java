package com.digiTech.app.service;

import java.util.List;

import com.digiTech.app.repository.CalendarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.digiTech.app.models.Holiday;

@Service
public class CalendarService {

    @Autowired
    CalendarRepository calendarRepo;

    public List<Holiday> getAllHolidays() {
        return calendarRepo.getAllHolidays();
    }
      
}
