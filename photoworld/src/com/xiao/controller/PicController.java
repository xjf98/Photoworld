package com.xiao.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.xiao.pojo.Photo;
import com.xiao.pojo.UserComment;
import com.xiao.pojo.UserPhoto;
import com.xiao.service.CommentService;
import com.xiao.service.PicService;

@Controller
@RequestMapping("/pic")
public class PicController {

	@Resource(name="picService")
	private PicService picService;
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	/**
	 * 首页最新
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/newpic")
	public void newPic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findNewPic();
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 自然风光
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/naturepic")
	public void naturePic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findNaturePic();
		
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 城市风光
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/citypic")
	public void cityPic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findCityPic();
		
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 文化艺术
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/artpic")
	public void ArtPic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findArtPic();
		
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 美味食物
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/foodpic")
	public void FoodPic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findFoodPic();
		
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 旅游地理
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/tourismpic")
	public void tourismPic(HttpServletResponse response) throws IOException {
		List<UserPhoto> pics = picService.findTourismPic();
		
		if(pics!=null) {
		String jsonString = JSON.toJSONString(pics);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(jsonString);
		}
	}
	
	/**
	 * 点赞
	 * @throws IOException 
	 */
	@RequestMapping("/addcount")
	public void addCount(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("pid");
		picService.addCount(pid);
		int count = picService.selectCount(pid);
		response.getWriter().print(count);
	}
	
	/**
	 * 图片详情
	 * @return
	 */
	@RequestMapping("/picdetailUI")
	public String picDetailUI(HttpServletRequest request,Model model) {
		String pid = request.getParameter("pid");
		UserPhoto userPhoto = picService.selectPic(pid);
		List<UserComment> ucList = commentService.findAllCommentByPid(pid);
		model.addAttribute("usercomment",ucList);
		model.addAttribute("userphoto",userPhoto);
		return "detail";
	}
	
	/**
	 * 删除图片
	 */
	@RequestMapping("/deletepic")
	public void deletePic(HttpServletRequest request) {
		String pid = request.getParameter("pid");
		
		picService.deletePic(pid);
	}
}
