package com.blog.modules.category.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.modules.category.model.Category;
import com.blog.modules.category.service.ICategoryService;


@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Resource
	private ICategoryService categoryServiceImpl;
	
	@RequestMapping("/findList")
	@ResponseBody
    public String findList(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		List<Category> categories = categoryServiceImpl.findList();
        model.addAttribute("categories", categories);
        return JSONArray.fromObject(categories).toString();
		 
    }
	
	@RequestMapping("/getCategorys")
    public String getCategorys(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		List<Category> categories = categoryServiceImpl.findList();
		model.addAttribute("categories", categories);
        return "index";		 
    }
}
