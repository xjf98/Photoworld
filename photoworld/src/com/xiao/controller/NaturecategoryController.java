package com.xiao.controller;
/**
 * 自然风光模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nature")
public class NaturecategoryController {

	@RequestMapping("/backindex")
	public String backIndex() {
		return "redirect:/index.jsp";
	}
}
