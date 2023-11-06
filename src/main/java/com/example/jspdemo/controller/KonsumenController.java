package com.example.jspdemo.controller;

import com.example.jspdemo.model.Konsumen;
import com.example.jspdemo.service.KonsumenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class KonsumenController {

    @Autowired
    KonsumenService konsumenService;

    @GetMapping("/viewKonsumenList")
    public String viewKonsumenList(@RequestParam(required = false, defaultValue = "") String keyword,
                                @ModelAttribute("message") String message, Model model) {
        model.addAttribute("konsumenList", konsumenService.getAllKonsumen(keyword));
        model.addAttribute("message", message);

        return "ViewKonsumenList";
    }

    @GetMapping("/addKonsumen")
    public String addKonsumen(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("konsumen", new Konsumen());
        model.addAttribute("message", message);

        return "AddKonsumen";
    }

    @PostMapping("/saveKonsumen")
    public String saveKonsumen(@Valid Konsumen konsumen, RedirectAttributes redirectAttributes) {
        if (konsumenService.saveOrUpdateKonsumen(konsumen)) {
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewKonsumenList";
        }

        redirectAttributes.addFlashAttribute("message", "Save Failure");
        return "redirect:/addKonsumen";
    }

    @GetMapping("/editKonsumen/{id}")
    public String editKonsumen(@PathVariable Long id, Model model) {
        model.addAttribute("konsumen", konsumenService.getKonsumenById(id));

        return "EditKonsumen";
    }

    @PostMapping("/editSaveKonsumen")
    public String editSaveKonsumen(@Valid Konsumen konsumen, RedirectAttributes redirectAttributes) {
        if (konsumenService.saveOrUpdateKonsumen(konsumen)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewKonsumenList";
        }

        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editKonsumen/" + konsumen.getId();
    }

    @GetMapping("/deleteKonsumen/{id}")
    public String deleteKonsumen(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (konsumenService.deleteKonsumen(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }

        return "redirect:/viewKonsumenList";
    }
}
