package com.digiTech.app.service;

import java.util.Optional;

import com.digiTech.app.repository.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.digiTech.app.models.Lesson;

@Service
public class LessonService {

    @Autowired
    LessonRepository lessonRepo;
    
    public Optional<Lesson> getLessonByStudentId(int studentId) {
        return lessonRepo.getLessonByStudentId(studentId);
    }

    public Lesson getLesson(String lessonId) {
        return lessonRepo.getLesson(lessonId);
    }

    public Boolean insertLesson(Lesson lesson) {
        Integer studentId = lesson.getStudentId();
        String subject = lesson.getSubject();
         // Create LessonId
        String lessonId = String.format("%s-%s", studentId, subject);
        lesson.setLessonId(lessonId);
        return lessonRepo.insertLesson(lesson);
    }

    public Boolean updateLesson(Lesson lesson, String lessonId) {
        return lessonRepo.updateLesson(lesson, lessonId);
    }

    public Boolean deleteLesson(String lessonId) {
        return lessonRepo.deleteLesson(lessonId);
    }
}
