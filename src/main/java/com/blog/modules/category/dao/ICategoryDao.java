package com.blog.modules.category.dao;

import java.util.List;

import com.blog.modules.category.model.Category;

public interface ICategoryDao {

	public List<Category> findList();
}
