package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;

import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    // private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
        // this.passwordEncoder = passwordEncoder;
    }

    // Homepage
    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsers();
        System.out.println(arrUsers);

        model.addAttribute("abc", "test");
        model.addAttribute("hoidanit", "from controller with model");
        return "hello";
    }

    // Table User
    @RequestMapping("/admin/user")
    public String getTableUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    // User Detail
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        // System.out.println("id: " + id);
        User user = this.userService.getUserById(id);
        model.addAttribute("id1", id);
        model.addAttribute("user", user);
        System.out.println("user: " + user);
        System.out.println("id" + id);
        return "admin/user/detail";
    }

    // Input to Create User
    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Save User
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user, BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        // String hashPassword = this.passwordEncoder.encode(user.getPassword());

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        user.setAvatar(avatar);
        // user.setPassword(hashPassword);
        user.setPassword(user.getPassword());
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));

        // save
        // System.out.printksln("run here " + user);
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Update User
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // Save update User
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Show delete user
    @GetMapping("/admin/user/delete/{id}")
    public String deleteUpdateUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User user = new User();
        user.setId(id);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    // Confirm delete user
    @PostMapping("/admin/user/delete")
    public String postDeleteUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteAUser(user.getId());
        return "redirect:/admin/user";
    }

}
