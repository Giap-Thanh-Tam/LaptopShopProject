package vn.hoidanit.laptopshop.controller.clients;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;

    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("id1", id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (Long) session.getAttribute("id");
        User currentUser = new User();
        currentUser.setId(userId);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetail = cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetail) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetail);
        model.addAttribute("totalPrices", totalPrice);

        return "client/cart/show";
    }

}
