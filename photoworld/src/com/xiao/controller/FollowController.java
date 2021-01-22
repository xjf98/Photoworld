package com.xiao.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.xiao.pojo.User;
import com.xiao.service.FollowService;

@Controller
@RequestMapping("/follow")
public class FollowController {

	@Resource(name="followService")
	private FollowService followService;
	
	/**
	 * 关注取关
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addfans")
	public void addFans(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String uid = request.getParameter("uid");
		String followid = request.getParameter("followid");
		
		int addFans = followService.addFans(uid,followid);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(addFans);
		
	}
	
	@RequestMapping("/loadfans")
	public void loadFans(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String uid = request.getParameter("uid");
		List<User> ulist = followService.loadFans(uid);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		String jsonString = JSON.toJSONString(ulist);
		response.getWriter().println(jsonString);
	}
}
