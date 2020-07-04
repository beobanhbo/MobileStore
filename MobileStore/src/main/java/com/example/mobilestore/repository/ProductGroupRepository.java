package com.example.mobilestore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.Product;
import com.example.mobilestore.entities.ProductGroup;

public interface ProductGroupRepository  extends JpaRepository<ProductGroup, Integer> {
	public ProductGroup findById(int id);
}

