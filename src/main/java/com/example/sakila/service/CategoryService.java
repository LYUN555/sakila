package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Category;

@Service
@Transactional
public class CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;
	
	public List<Category> getCategoryList(){
		return categoryMapper.selectCategoryList();
	}

	public int addCategory(String name) {
		return categoryMapper.insertCategory(name);
		
	}
	
}
