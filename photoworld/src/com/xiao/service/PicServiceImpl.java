package com.xiao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.dao.PicMapper;
import com.xiao.dao.UserMapper;
import com.xiao.pojo.Photo;
import com.xiao.pojo.UserPhoto;

@Service("picService")
@Transactional
public class PicServiceImpl implements PicService {

	@Autowired
	private PicMapper picMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 上传作品
	 */
	@Override
	public void insertPic(Photo photo) {
		picMapper.insertpic(photo);
	}

	/**
	 * 查找最新的几张图片
	 */
	@Override
	public List<UserPhoto> findNewPic() {
		return picMapper.findNewPic();	
	}

	/**
	 * 自然风光图片
	 */
	@Override
	public List<UserPhoto> findNaturePic() {
		return picMapper.findNaturePic();	
	}

	/**
	 * 城市风光图片
	 */
	@Override
	public List<UserPhoto> findCityPic() {
		return picMapper.findCityPic();	
	}
	
	/**
	 * 旅游地理图片
	 */
	@Override
	public List<UserPhoto> findTourismPic() {
		return picMapper.findTourismPic();	
	}
	
	/**
	 * 美味食物图片
	 */
	@Override
	public List<UserPhoto> findFoodPic() {
		return picMapper.findFoodPic();	
	}
	
	/**
	 * 文化艺术图片
	 */
	@Override
	public List<UserPhoto> findArtPic() {
		return picMapper.findArtPic();	
	}

	/**
	 * 点赞
	 */
	@Override
	public void addCount(String pid) {
		picMapper.addCount(pid);
	}

	@Override
	public int selectCount(String pid) {
		// TODO Auto-generated method stub
		return picMapper.selectCount(pid);
	}

	/**
	 * 作品詳情
	 */
	@Override
	public UserPhoto selectPic(String pid) {
		return picMapper.selectPic(pid);
	}

	/**
	 * 根据用户查询作品
	 */
	@Override
	public List<Photo> findPicByUid(String uid) {
		return picMapper.findPicByUid(uid);
	}

	/**
	 * 删除图片
	 */
	@Override
	public void deletePic(String pid) {
		picMapper.deletePic(pid);
		
	}

	
}
