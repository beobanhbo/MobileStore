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

import com.example.mobilestore.entities.GroupVariant;
import com.example.mobilestore.entities.Product;
import com.example.mobilestore.entities.ProductGroup;
import com.example.mobilestore.entities.ProductImage;
import com.example.mobilestore.exceptions.ResourceNotFoundException;
import com.example.mobilestore.repository.ProductGroupRepository;
import com.example.mobilestore.repository.ProductImageRepository;
import com.example.mobilestore.repository.ProductRepository;
import com.example.mobilestore.repository.ProductVariantRepository;


@RestController
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductImageRepository productImageRepository;
	@Autowired
	private ProductGroupRepository productGroupRepository;
	@Autowired
	private ProductVariantRepository productVariantRepository;
	@GetMapping("/getlist")
	public List<Product> getAllProduct(){
		return productRepository.findAll();
	}
	
	@PostMapping("/getproductbyname")
	public Product getProductByName(@RequestBody Product products){
//		
		Product product=productRepository.findByname(products.getName());
		ProductGroup productGroup= productGroupRepository.findById(product.getProduct_group_id());
		GroupVariant groupVariant=productVariantRepository.findById(productGroup.getId());
		product.setGroupname(productGroup.getName());
		product.setVariant(groupVariant.getVariantname());
		return product;
	} 
	//get product by product id
	@GetMapping("/getproductbyid/{id}")
	public ResponseEntity<Product> getProductByProductId(@PathVariable(value = "id") int productid) throws ResourceNotFoundException{
		Product product=productRepository.findById(productid).orElseThrow(()->new ResourceNotFoundException("Product not found on id: "+productid));
		return ResponseEntity.ok(product);	
	}
	
	//add new product
	@PostMapping("/addproduct")
	public ProductImage addproduct(@RequestBody Product product,ProductImage productImage)
	{
		productRepository.save(product);
		Product getproduct=productRepository.findByname(product.getName());
//		ProductImage productImage= new ProductImage();
		
		productImage.setProductID(getproduct.getProductID());
		productImage.setPath(product.getPath());
		return productImageRepository.save(productImage);
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
