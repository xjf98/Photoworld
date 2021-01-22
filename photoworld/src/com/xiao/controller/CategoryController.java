package com.xiao.controller;

/**
 * 分类跳转模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@RequestMapping("/natureUI")
	public String natureUI() {
		return "nature";
	}
	
	@RequestMapping("/artUI")
	public String artUI() {
		return "art";
	}
	
	@RequestMapping("/cityUI")
	public String cityUI() {
		return "city";
	}
	
	@RequestMapping("/tourismUI")
	public String tourismUI() {
		return "tourism";
	}
	
	@RequestMapping("/foodUI")
	public String foodUI() {
		return "food";
	}
}
