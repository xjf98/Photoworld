package com.xiao.controller;

/**
 * 旅游地理模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tourism")
public class TourismcategoryController {

	@RequestMapping("/backindex")
	public String backIndex() {
		return "redirect:/index.jsp";
	}
}