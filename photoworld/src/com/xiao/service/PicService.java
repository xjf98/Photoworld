package com.xiao.service;

import java.util.List;

import com.xiao.pojo.Photo;
import com.xiao.pojo.UserPhoto;

public interface PicService {

	public void insertPic(Photo photo);

	public List<UserPhoto> findNewPic();

	public List<UserPhoto> findNaturePic();

	public List<UserPhoto> findCityPic();

	List<UserPhoto> findTourismPic();

	List<UserPhoto> findFoodPic();

	List<UserPhoto> findArtPic();

	public void addCount(String pid);

	public int selectCount(String pid);

	public UserPhoto selectPic(String pid);

	public List<Photo> findPicByUid(String uid);

	public void deletePic(String pid);
}
