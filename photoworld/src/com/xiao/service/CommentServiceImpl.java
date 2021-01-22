package com.xiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.dao.CommentMapper;
import com.xiao.pojo.Comment;
import com.xiao.pojo.UserComment;
import com.xiao.pojo.UserReply;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	/**
	 * 增加评论
	 */
	@Override
	public void addComment(Comment comment) {
		commentMapper.addComment(comment);
	}

	/**
	 * 展示所有评论
	 */
	@Override
	public List<UserComment> findAllCommentByPid(String pid) {
		
		 List<UserComment> ucList = commentMapper.findAllCommentByPid(pid);
		 
		 for (UserComment userComment : ucList) {
			 
			 List<UserReply> rlist = commentMapper.findAllReplyByComment_id(userComment.getComment_id());
			 userComment.setRlist(rlist);
			 for (UserReply userReply : rlist) {
				
			}
		}
		
		 return ucList;
	}

	
	
}
