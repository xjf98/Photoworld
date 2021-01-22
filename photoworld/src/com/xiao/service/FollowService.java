package com.xiao.service;

import java.util.List;

import com.xiao.pojo.User;

public interface FollowService {

	int addFans(String parseInt, String parseInt2);

	public List<User> loadFans(String uid);
}
