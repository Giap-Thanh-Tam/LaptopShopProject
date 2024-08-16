package vn.hoidanit.laptopshop.controller.clients;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class HomePageController {
    private final ProductService productService;

    // private final RegisterDTO registerDTO;

    public HomePageController(ProductService productService) {
        this.productService = productService;
        // this.registerDTO = registerDTO;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products1", products);
        return "client/homepage/show";
    }

    @GetMapping("/register") // GET
    public String getRegisterPage(Model model) {
        RegisterDTO register = new RegisterDTO();
        model.addAttribute("registerUser", register);
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(Model model,
            @ModelAttribute("registerUser") RegisterDTO register) {

        // validate
        // List<FieldError> errors = newUserBindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(error.getField() + " - " + error.getDefaultMessage());
        // }
        // if (newUserBindingResult.hasErrors()) {
        // return "admin/user/update";
        // }

        // User currentUser = this.userService.getUserById(user.getId());
        // if (currentUser != null) {
        // currentUser.setAddress(user.getAddress());
        // currentUser.setFullName(user.getFullName());
        // currentUser.setPhone(user.getPhone());
        // this.userService.handleSaveUser(currentUser);
        // }
        return "client/auth/register";
    }

}
