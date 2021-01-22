package com.xiao.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.dao.ReplyMapper;
import com.xiao.pojo.Reply;

@Service("replyService")
@Transactional
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public void saveReply(Reply reply) {
		replyMapper.saveReply(reply);
	}
}
