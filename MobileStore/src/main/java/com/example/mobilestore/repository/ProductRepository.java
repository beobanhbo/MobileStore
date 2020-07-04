package com.example.mobilestore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.Product;

public interface ProductRepository  extends JpaRepository<Product, Integer> {
	public List<Product> findByname(String name);
}
