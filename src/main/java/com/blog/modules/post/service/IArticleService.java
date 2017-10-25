package com.blog.modules.post.service;

import com.blog.common.bean.Page;
import com.blog.modules.post.bean.ArticleBean;

public interface IArticleService {

	public Page<ArticleBean> findPage(Page<ArticleBean> page,ArticleBean record);
}
