package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;

import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {

        this.productRepository = productRepository;
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product handleSaveProduct(Product product) {
        Product pd = this.productRepository.save(product);
        System.out.println(pd);
        return pd;
    }

    public void deleteAProduct(long id) {
        this.productRepository.deleteById(id);
    }

    // public Factory getFactoryByName(String name) {
    // return this.productRepository.findByName(name);
    // }
}