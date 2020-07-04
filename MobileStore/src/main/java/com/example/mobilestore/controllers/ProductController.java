package com.example.mobilestore.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.mobilestore.entities.Product;
import com.example.mobilestore.exceptions.ResourceNotFoundException;
import com.example.mobilestore.repository.ProductRepository;


@RestController
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductRepository productRepository;
	
	@GetMapping("/getlist")
	public List<Product> getAllProduct(){
		return productRepository.findAll();
	}
	@GetMapping("/getproductbyname")
	public List<Product> getProductByName(@RequestBody Product products){
		List<Product> product=productRepository.findByname(products.getName());
		return product;
		
	}
	//get product by product id
	@GetMapping("/getproductbyid/{id}")
	public ResponseEntity<Product> getProductByProductId(@PathVariable(value = "id") int productid) throws ResourceNotFoundException{
		Product product=productRepository.findById(productid).orElseThrow(()->new ResourceNotFoundException("Product not found on id: "+productid));
		return ResponseEntity.ok(product);	
	}
	
	//add new product
	@PutMapping("/addproduct")
	public Product addproduct(@RequestBody Product product)
	{
		return productRepository.save(product);
	}
	// delete product
	@DeleteMapping("/product/{id}")
	public Map<String, Boolean> delete(@PathVariable(value = "id") int productid) throws 
	Exception {
	
	Product product = productRepository.findById(productid) .orElseThrow(() -> new ResourceNotFoundException("Product not found on: " + productid));
	productRepository.delete(product);
	Map<String, Boolean> response = new HashMap<>();
	response.put("deleted", Boolean.TRUE);
	return response;
	} 
	
}
