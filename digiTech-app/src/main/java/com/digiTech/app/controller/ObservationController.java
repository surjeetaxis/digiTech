package com.digiTech.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.digiTech.app.models.Observation;
import com.digiTech.app.service.ObservationService;

@RestController
@RequestMapping("api/observation")
@CrossOrigin(origins = "http://localhost:4200")
public class ObservationController {
    
    @Autowired
    ObservationService observationSvc;

    @GetMapping("/all")
    public ResponseEntity<List<Observation>> getObservationsByStudentId(@RequestParam int studentId) {
        List<Observation> observations = observationSvc.getObservationsByStudentId(studentId);
        return ResponseEntity.ok(observations);
    }

    @GetMapping("/details/{observationId}")
    public ResponseEntity<Observation> getObservation(@PathVariable String observationId) {
        Observation observation = observationSvc.getObservation(observationId);
        if (observation != null) {
            return ResponseEntity.ok(observation); 
        } else {
            return ResponseEntity.notFound().build(); 
        }
    }

    @GetMapping("/count/{tutorId}")
    public ResponseEntity<Integer> getObservationCountByTutor(@PathVariable int tutorId) {
        Integer count = observationSvc.getObservationCountByTutor(tutorId);
        if (count != null) {
            return ResponseEntity.ok(count); 
        } else {
            return ResponseEntity.notFound().build(); 
        }
    }

    @PostMapping("/add")
    public ResponseEntity<Boolean> insertObservation(@RequestBody Observation observation) {
        boolean isInserted = observationSvc.insertObservation(observation);
        if (isInserted) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false);  
        }
    }

    @PutMapping("/update/{observationId}")
    public ResponseEntity<Boolean> updateObservation(@RequestBody Observation observation, @PathVariable String observationId) {
        boolean isUpdated = observationSvc.updateObservation(observation, observationId);
        if (isUpdated) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false); 
        }
    }

    @DeleteMapping("/delete/{observationId}")
    public ResponseEntity<Boolean> deleteObservation(@PathVariable String observationId) {
        boolean isDeleted = observationSvc.deleteObservation(observationId);
        if (isDeleted) {
            return ResponseEntity.ok(true);  
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false); 
        }
    }
    
}
