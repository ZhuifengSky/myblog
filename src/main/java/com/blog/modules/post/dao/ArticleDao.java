package com.blog.modules.post.dao;

import java.util.List;

import com.blog.modules.post.bean.ArticleBean;
import com.blog.modules.post.model.Article;

public interface ArticleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);
    
    List<ArticleBean> findList(ArticleBean record);
}