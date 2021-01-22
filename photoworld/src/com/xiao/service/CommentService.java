package com.xiao.service;

import java.util.List;

import com.xiao.pojo.Comment;
import com.xiao.pojo.UserComment;

public interface CommentService {

	void addComment(Comment comment);


	List<UserComment> findAllCommentByPid(String pid);

	
	
}
