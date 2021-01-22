package com.xiao.dao;

import java.util.List;

import com.xiao.pojo.Photo;
import com.xiao.pojo.UserPhoto;

public interface PicMapper {

	public void insertpic(Photo photo);
	
	public List<UserPhoto> findNewPic();

	public List<UserPhoto> findNaturePic();
	
	public List<UserPhoto> findArtPic();

	public List<UserPhoto> findCityPic();
	
	public List<UserPhoto> findTourismPic();
	
	public List<UserPhoto> findFoodPic();

	public void addCount(String pid);

	public int selectCount(String pid);

	public UserPhoto selectPic(String pid);

	public List<Photo> findPicByUid(String uid);

	public void deletePic(String pid);

	public void updatePic(String pid);
}
