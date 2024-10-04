package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // Homepage
    @GetMapping("/admin/product")
    public String getProductPage(Model model,
            @RequestParam("page") int page) {
        Pageable pageable = PageRequest.of(page - 1, 2);

        Page<Product> products = this.productService.getAllProduct(pageable);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products1", listProducts);
        return "admin/product/show";
    }

    // Input to Create Product
    @GetMapping("/admin/product/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // Save Product
    @PostMapping(value = "/admin/product/create")
    public String getCreateUserPage(Model model,
            @ModelAttribute("newProduct") @Valid Product product, BindingResult newProductBindingResult,
            @RequestParam("imageNameFile") MultipartFile file) {

        // validate
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // TODO: process POST request
        String productCurrent = this.uploadService.handleSaveUploadFile(file, "product");

        product.setImage(productCurrent);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    // Show Detail of Product
    @GetMapping("/admin/product/{id}") // GET
    public String getDetailProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("id1", id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    // Update User
    @RequestMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    // Save Update User
    @PostMapping("/admin/product/update")
    public String postUpdateUser(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("imageNameFile") MultipartFile file

    ) {

        // validate
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product currentProduct = this.productService.getProductById(product.getId());
        if (currentProduct != null) {

            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }

            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());

            this.productService.handleSaveProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    // Show Delete Product
    @GetMapping("/admin/product/delete/{id}")
    public String deleteUpdateUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Product product = new Product();
        product.setId(id);
        model.addAttribute("newProduct", product);
        return "admin/product/delete";
    }

    // Confirm Delete Product
    @PostMapping("/admin/product/delete")
    public String postDeleteUpdateUser(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteAProduct(product.getId());
        return "redirect:/admin/product";
    }

}