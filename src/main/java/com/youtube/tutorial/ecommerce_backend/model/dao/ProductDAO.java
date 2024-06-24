package com.youtube.tutorial.ecommerce_backend.model.dao;

import com.youtube.tutorial.ecommerce_backend.model.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.ListCrudRepository;

public interface ProductDAO extends ListCrudRepository<Product, Long> {

}
