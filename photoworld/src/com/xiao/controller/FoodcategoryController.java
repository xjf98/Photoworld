package com.xiao.controller;

/**
 * 美味食物模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/food")
public class FoodcategoryController {

	@RequestMapping("/backindex")
	public String backIndex() {
		return "redirect:/index.jsp";
	}
}