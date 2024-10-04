package vn.hoidanit.laptopshop.controller.clients;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.OrderService;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;

    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 15);
        Page<Product> prs = this.productService.getAllProduct(pageable);
        List<Product> products = prs.getContent();
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
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO, BindingResult bindingResult) {

        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        String hashPassword = this.passwordEncoder.encode(registerDTO.getPassword());
        registerDTO.setPassword(hashPassword);

        User user = this.userService.registerGTOtoUser(registerDTO);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login") // GET
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny") // GET
    public String getAccessDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history") // GET
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long userId = (Long) session.getAttribute("id");
        currentUser.setId(userId);

        List<Order> order = this.orderService.getOrderByUser(currentUser);
        model.addAttribute("orders", order);

        return "client/cart/order-history";
    }

}
