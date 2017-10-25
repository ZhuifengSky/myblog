package com.blog.modules.category.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.modules.category.dao.ICategoryDao;
import com.blog.modules.category.model.Category;
import com.blog.modules.category.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService {

	@Autowired
	private ICategoryDao categoryDaoImpl;
	
	@Override
	public List<Category> findList() {
		return categoryDaoImpl.findList();
	}

}
