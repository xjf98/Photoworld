package com.xiao.controller;

import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiao.pojo.Reply;
import com.xiao.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping("/uploadreply")
	public String uploadReply(Reply reply) {
		reply.setRid(UUID.randomUUID().toString());
		reply.setR_time(new Date().toString());
		replyService.saveReply(reply);
		return null;
	}
}
