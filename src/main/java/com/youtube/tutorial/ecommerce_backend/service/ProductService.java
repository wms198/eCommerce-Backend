package com.youtube.tutorial.ecommerce_backend.service;
import com.youtube.tutorial.ecommerce_backend.model.dao.ProductDAO;
import com.youtube.tutorial.ecommerce_backend.model.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private ProductDAO productDAO;

    public ProductService(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    public List<Product> getProducts() {
        return productDAO.findAll();
    }
}
