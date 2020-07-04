package com.example.mobilestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.GroupVariant;

public interface ProductVariantRepository  extends JpaRepository<GroupVariant, Integer> {
	public GroupVariant findById(int id);
}

