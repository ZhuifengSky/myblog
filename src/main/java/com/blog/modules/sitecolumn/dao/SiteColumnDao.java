package com.blog.modules.sitecolumn.dao;

import java.util.List;

import com.blog.modules.sitecolumn.model.SiteColumn;

public interface SiteColumnDao {
    int deleteByPrimaryKey(Integer id);

    int insert(SiteColumn record);

    int insertSelective(SiteColumn record);

    SiteColumn selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteColumn record);

    int updateByPrimaryKey(SiteColumn record);
    
    List<SiteColumn> findList(SiteColumn record);
}