package com.example.sweater.controller;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    /** Shows the list of registered users
     *
     * @param model The Model object is a Map that is used to pass information between the controller and the view.
     * @return A String.
     */
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users", userRepo.findAll());
       return "userList";
    }
    /**
     * This function is used to display the user edit form
     *
     * @param user The user to be edited.
     * @param model The Model object is a Map that is used to pass information to the view.
     * @return The userEdit.ftlh page.
     */
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
    @PostMapping
    private String userSave(
            @RequestParam String username,
            @RequestParam("userId") User user,
            @RequestParam Map<String, String> form
    ){
        user.setUsername(username);
        user.getRoles().clear();
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        form.keySet().forEach(i -> {
            if (roles.contains(i)){
                user.getRoles().add(Role.valueOf(i));
            }
        });
        userRepo.save(user);
        return "redirect:/user";
    }
}
