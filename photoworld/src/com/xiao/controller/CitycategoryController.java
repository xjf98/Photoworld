package com.xiao.controller;

/**
 * 城市风光模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/city")
public class CitycategoryController {

	@RequestMapping("/backindex")
	public String backIndex() {
		return "redirect:/index.jsp";
	}
}
