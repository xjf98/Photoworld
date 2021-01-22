package com.xiao.controller;

/**
 * 文化艺术分类模块
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/art")
public class ArtcategoryController {

	@RequestMapping("/backindex")
	public String backIndex() {
		return "redirect:/index.jsp";
	}
}
