package com.unlogged.gctest.controller;

import com.unlogged.gctest.service.MemoryService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/memory")
public class MemoryController {
    private final MemoryService memoryService;

    public MemoryController(MemoryService memoryService) {
        this.memoryService = memoryService;
    }

    @PostMapping("/load/{mb}")
    public String generateLoad(@PathVariable int mb) {
        memoryService.generateLoad(mb);
        return "Generated " + mb + "MB load";
    }
}