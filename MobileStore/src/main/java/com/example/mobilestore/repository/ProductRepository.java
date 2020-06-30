package com.example.mobilestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.Product;

public interface ProductRepository  extends JpaRepository<Product, Integer> {

}
