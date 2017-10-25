package com.blog.modules.sitecolumn.service;

import java.util.List;

import com.blog.modules.sitecolumn.model.SiteColumn;

public interface ISiteColumnService {
   
	public List<SiteColumn> findList(SiteColumn record);
}
