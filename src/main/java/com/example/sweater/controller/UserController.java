package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")

public class UserController {
    @Autowired
    private UserService userService;

    /** Shows the list of registered users
     *
     * @param model The Model object is a Map that is used to pass information between the controller and the view.
     * @return A String.
     */
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users", userService.findAll());
       return "userList";
    }
    /**
     * This function is used to display the user edit form
     *
     * @param user The user to be edited.
     * @param model The Model object is a Map that is used to pass information to the view.
     * @return The userEdit.ftlh page.
     */
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    private String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    /**
     * It saves the user to the database.
     *
     * @param username The username of the user.
     * @param user The user object that is being saved.
     * @param form A map of the form data.
     * @return The user is being returned.
     */
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    private String userSave(
            @RequestParam String username,
            @RequestParam("userId") User user,
            @RequestParam Map<String, String> form
    ){
        userService.saveUser(user, username, form);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user){ 
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String email
    ){
        userService.updateProfile(user, password, email);
        return "redirect:/user/profile";
    }
}
