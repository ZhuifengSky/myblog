package com.blog.modules.sitecolumn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.common.bean.Page;
import com.blog.modules.post.bean.ArticleBean;
import com.blog.modules.post.service.IArticleService;
import com.blog.modules.sitecolumn.model.SiteColumn;
import com.blog.modules.sitecolumn.service.ISiteColumnService;


@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private ISiteColumnService siteColumnServiceImpl;
	@Autowired
	private IArticleService articleServiceImpl;
	
	/**
	 * 获取网站栏目
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/getColumns")
	@ResponseBody
    public String getCategorys(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		List<SiteColumn> columns = siteColumnServiceImpl.findList(null);
		return JSONArray.fromObject(columns).toString();	 
    }
	
	
	@RequestMapping("/getArticles")
    public String getArticles(HttpServletRequest request,HttpServletResponse response,ArticleBean article,ModelMap model) {
		Page<ArticleBean> page = articleServiceImpl.findPage(new Page<ArticleBean>(request, response),article);
		model.addAttribute("page", page);
        return "index";		 
    }
}
