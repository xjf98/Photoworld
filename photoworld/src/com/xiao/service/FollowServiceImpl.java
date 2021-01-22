package com.xiao.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.dao.UserMapper;
import com.xiao.pojo.User;
import com.xiao.utils.FollowUtil;

@Service("followService")
@Transactional
public class FollowServiceImpl implements FollowService {

	@Autowired
	private UserMapper userMapper;
	/**
	 * 关注取关
	 */
	@Override
	public int addFans(String userId, String followId) {
		int addOrRelease = FollowUtil.addOrRelease(userId, followId);
		
		return addOrRelease;
	}

	/**
	 * 加载粉丝
	 */
	@Override
	public List<User> loadFans(String uid) {
		Set<String> findFans = FollowUtil.findFans(uid);
		List<User> ulist = new ArrayList<User>();
		for (String string : findFans) {
			User user = userMapper.findUserByUid(Integer.parseInt(string));
			ulist.add(user);
		}
		return ulist;
	}
	
	

}
