package com.example.mobilestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.ProductImage;


public interface ProductImageRepository  extends JpaRepository<ProductImage, Integer> {
}
