package com.blog.modules.post.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.common.bean.Page;
import com.blog.modules.post.bean.ArticleBean;
import com.blog.modules.post.dao.ArticleDao;
import com.blog.modules.post.service.IArticleService;

@Service
public class ArticleServiceImpl implements IArticleService{

	@Autowired
	private ArticleDao articleDao;

	@Override
	public Page<ArticleBean> findPage(Page<ArticleBean> page, ArticleBean record) {
		record.setPage(page);
		List<ArticleBean> list = articleDao.findList(record);
		page.setList(list);
		return page;
	}
	
}
