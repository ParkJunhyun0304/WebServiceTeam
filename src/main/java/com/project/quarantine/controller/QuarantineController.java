package com.project.quarantine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class QuarantineController {

    @RequestMapping("/")
    public String home(Model model) {
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        return "add";
    }

    @GetMapping("/list")
    public String listAll(Model model) {
        return "list";
    }

    @GetMapping("/detail")
    public String detail() {
        return "detail";
    }

    @GetMapping("/edit")
    public String edit() {
        return "edit";
    }

    @PostMapping("/updatePassenger")
    public String update() {
        return "redirect:/detail/";
    }

    @GetMapping("/delete")
    public String delete() {
        return "redirect:/list";
    }

}
