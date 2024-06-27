package com.digiTech.app.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.digiTech.app.models.Lesson;
import com.digiTech.app.service.LessonService;

@RestController
@RequestMapping("api/lesson")
@CrossOrigin(origins = "http://localhost:4200")
public class LessonController {

    @Autowired
    LessonService lessonSvc;

    @GetMapping("/all")
    public ResponseEntity<Lesson> getLessonByStudentId(@RequestParam int studentId) {
        try {
            Optional<Lesson> lessonOptional = lessonSvc.getLessonByStudentId(studentId);
            if (lessonOptional.isPresent()) {
                Lesson lesson = lessonOptional.get();
                return ResponseEntity.ok(lesson);
            } else {
                return ResponseEntity.noContent().build();
            }
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/details/{lessonId}")
    public ResponseEntity<Lesson> getLesson(@PathVariable String lessonId) {
        Lesson lesson = lessonSvc.getLesson(lessonId);
        if (lesson != null) {
            return ResponseEntity.ok(lesson); 
        } else {
            return ResponseEntity.notFound().build(); 
        }
    }

    @PostMapping("/add")
    public ResponseEntity<Boolean> insertLesson(@RequestBody Lesson lesson) {
        boolean isInserted = lessonSvc.insertLesson(lesson);
        if (isInserted) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false);  
        }
    }

    @PutMapping("/update/{lessonId}")
    public ResponseEntity<Boolean> updateLesson(@RequestBody Lesson lesson, @PathVariable String lessonId) {
        boolean isUpdated = lessonSvc.updateLesson(lesson, lessonId);
        if (isUpdated) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false); 
        }
    }

    @DeleteMapping("/delete/{lessonId}")
    public ResponseEntity<Boolean> deleteLesson(@PathVariable String lessonId) {
        boolean isDeleted = lessonSvc.deleteLesson(lessonId);
        if (isDeleted) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false); 
        }
    }
    
}
