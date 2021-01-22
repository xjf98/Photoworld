package com.xiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.dao.UserMapper;
import com.xiao.pojo.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 注册用户
	 */
	@Override
	public void addUserByUnAndPs(User user) {
		userMapper.addUserByUnAndPs(user);
	}
	
	/**
	 * 检查用户名和密码并登录
	 */
	@Override
	public User checkUserAndLogin(User user) {
		User checkedUser = userMapper.checkUserAndLogin(user);
		return checkedUser;
	}

	/**
	 * 前台ajax验证用户名是否被使用
	 */
	@Override
	public User checkUsername(String username) {
		return userMapper.checkUsername(username);
	}

	/**
	 * 更新用户信息
	 */
	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	/**
	 * 根据uid查询用户信息
	 */
	@Override
	public User findUserByUid(Integer uid) {
		
		return userMapper.findUserByUid(uid);
	}

	@Override
	public void updateUsernameAndTag(User user) {
		userMapper.updateUsernameandtag(user);
	}

	/**
	 * 热门摄影师
	 */
	@Override
	public List<User> findHotUsers() {
	
		return userMapper.findHotUsers();
	}

}
