package com.xiao.service;

import java.util.List;

import com.xiao.pojo.User;

public interface UserService {

	public void addUserByUnAndPs(User user);
	
	public User checkUserAndLogin(User user);

	public User checkUsername(String username);

	public void updateUser(User user);
	
	public void updateUsernameAndTag(User user);

	public User findUserByUid(Integer uid);

	public List<User> findHotUsers();
	
	
}
