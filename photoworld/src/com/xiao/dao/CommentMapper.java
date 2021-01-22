package com.xiao.dao;

import java.util.List;

import com.xiao.pojo.Comment;
import com.xiao.pojo.UserComment;
import com.xiao.pojo.UserReply;

public interface CommentMapper {

	public void addComment(Comment comment);

	public List<UserComment> findAllCommentByPid(String pid);

	public List<UserReply> findAllReplyByComment_id(String comment_id);
}
