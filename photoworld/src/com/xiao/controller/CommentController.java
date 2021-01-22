package com.xiao.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiao.pojo.Comment;
import com.xiao.pojo.UserComment;
import com.xiao.service.CommentService;

/**
 * 评论
 * @author asus
 *
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource(name="commentService")
	private CommentService commentService;
	
	/**
	 * 增加评论
	 * @return
	 */
	@RequestMapping("/addcomment")
	public String addComment(Comment comment,HttpServletRequest request) {
		String content = request.getParameter("content");
		comment.setContent(content);
		comment.setComment_id(UUID.randomUUID().toString());
		comment.setC_time(new Date().toString());
		commentService.addComment(comment);
		return "redirect:/pic/picdetailUI.action?pid="+request.getParameter("pid")+"";
	}
	
	/**
	 * 展示所有评论
	 */
	@RequestMapping("/showcomments")
	public void showComments(HttpServletRequest request) {
		String pid = request.getParameter("pid");
		List<UserComment> clist = commentService.findAllCommentByPid(pid);
		
	}
	
	
}
