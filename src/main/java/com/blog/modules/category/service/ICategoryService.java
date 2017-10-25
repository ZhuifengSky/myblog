package com.blog.modules.category.service;

import java.util.List;

import com.blog.modules.category.model.Category;

public interface ICategoryService {

	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findList();
}
