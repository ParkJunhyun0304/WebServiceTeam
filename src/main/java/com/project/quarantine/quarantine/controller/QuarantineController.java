package com.project.quarantine.quarantine.controller;

import com.project.quarantine.file.service.FileService;
import com.project.quarantine.quarantine.service.QuarantineService;
import com.project.quarantine.quarantine.vo.QuarantineVO;
import com.project.quarantine.symptom.service.SymptomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
public class QuarantineController {

    @Autowired
    QuarantineService quarantineService;
    @Autowired
    SymptomService symptomService;
    @Autowired
    FileService fileService;

    @RequestMapping("/add")
    public String add(Model model) {
        return "add";
    }

    @GetMapping("/list")
    public String listAll(
            @RequestParam(value = "nameSearch", required = false, defaultValue = "") String nameSearch,
            @RequestParam(value = "searchType", required = false, defaultValue = "") String codeSearch,
            @RequestParam(value = "categoryType", required = false, defaultValue = "") String depSearch,
            Model model) {

        model.addAttribute("currentUsers", quarantineService.filterQuarantine(nameSearch,codeSearch,depSearch));
        model.addAttribute("data", quarantineService.filterQuarantine(nameSearch,codeSearch,depSearch));
        return "list";
    }

    @RequestMapping(value = "/addPassenger", method = RequestMethod.POST)
    public String addPassenger(HttpServletRequest request, Model model) {
        model.addAttribute("currentUsers", quarantineService.addQuarantine(request));
        return "redirect:/list";
    }

    @GetMapping("/detail")
    public String detail() {
        return "detail";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        model.addAttribute("post", quarantineService.getQuarantine(id));
        model.addAttribute("symptom", symptomService.getSymptom(id));
        return "edit"; // edit.jsp 페이지로 이동
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
