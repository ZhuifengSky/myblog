package com.blog.modules.sitecolumn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.modules.sitecolumn.dao.SiteColumnDao;
import com.blog.modules.sitecolumn.model.SiteColumn;
import com.blog.modules.sitecolumn.service.ISiteColumnService;

@Service
public class SiteColumnServiceImpl implements ISiteColumnService{

	@Autowired
	private SiteColumnDao siteColumnDao;
	
	@Override
	public List<SiteColumn> findList(SiteColumn record) {
		return siteColumnDao.findList(record);
	}

	
}
