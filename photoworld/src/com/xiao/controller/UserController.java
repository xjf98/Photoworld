package com.xiao.controller;
import java.io.File;
/**
 * 用户模块
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.xiao.pojo.ImgResult;
import com.xiao.pojo.Photo;
import com.xiao.pojo.User;
import com.xiao.service.PicService;
import com.xiao.service.UserService;
import com.xiao.utils.FollowUtil;
import com.xiao.utils.MD5Utils;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="picService")
	private PicService picService;
	
	
	
	/**
	 * 跳转用户注册界面
	 * @return
	 */
	@RequestMapping("/registUI")
	public String registUI() {
		return "regist";
	}
	
	/**
	 * 跳转用户登录界面
	 * @return
	 */
	@RequestMapping("/loginUI")
	public String loginUI() {
		return "login";
	}
	
	/**
	 * 用户注册模块
	 * @param user
	 * @return
	 */
	@RequestMapping("/regist")
	public String regist(User user) {
		user.setPassword(MD5Utils.md5(user.getPassword()));
		user.setUserphoto("/pic/nologin.jpg");
		userService.addUserByUnAndPs(user);
		return "login";
	}
	
	/**
	 * 用户登录模块
	 */
	@RequestMapping("/login")
	public String Login(User user,HttpSession session) {
		user.setPassword(MD5Utils.md5(user.getPassword()));
		session.setMaxInactiveInterval(3600);
		User checkedUser = userService.checkUserAndLogin(user);
		if(checkedUser != null) {
			session.setAttribute("user",checkedUser);
		
			return "redirect:/index.jsp";
		}
		return "login";
	}
	
	@RequestMapping("/checkUser")
	public String checkUsername(HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		User user = userService.checkUsername(username);
		if(user != null) {
			writer.print(0);
			writer.close();
			return "regist";
		}
		writer.print(1);
		writer.close();
		return "regist";
	}
	
	/**
	 * 跳转用户中心
	 * @return
	 */
	@RequestMapping("/usercenter")
	public String userCenterUI(){
		return "user";		
	}
	
	/**
	 * 跳转弹出上传作品
	 * @return
	 */
	@RequestMapping("/tanform")
	public String tanForm() {
		return "tanform";
		
	}
	
	/**
	 * 跳转弹出修改头像
	 * @return
	 */
	@RequestMapping("/picform")
	public String picForm() {
		return "picForm";
	}
	
	@RequestMapping("/showpic")
	public String showPic(Photo photo) {
		return "forward:usercenter.action";
	}
	
	/**
	 * 上传作品
	 * @param pictureFile
	 * @param photo
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 
	@RequestMapping("/uploadworks")
	public String uploadWorks(@RequestParam MultipartFile pictureFile,Photo photo,Model model) throws IllegalStateException, IOException {
		
		String fileStr = pictureFile.getOriginalFilename();
		System.out.println(fileStr);

		String newFileName = UUID.randomUUID().toString()+fileStr.substring(fileStr.lastIndexOf("."));
		photo.setPid(UUID.randomUUID().toString());
		
		pictureFile.transferTo(new File("E:\\image\\"+newFileName));
		photo.setP_address("/pic/"+newFileName);
		photo.setP_time(new Date().toString());
		
		picService.insertPic(photo);
		return "forward:showpic.action";
	}*/
	
	@RequestMapping("/upload")
	public void uplpad(@RequestParam MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws IOException {
		String desFilePath = "";
		String oriName = "";
		ImgResult result = new ImgResult();
		Map<String, String> dataMap = new HashMap<>();
		ImgResult imgResult = new ImgResult();
		try {
			// 1.获取原文件名
			oriName = file.getOriginalFilename();
			// 2.获取原文件图片后缀，以最后的.作为截取(.jpg)
			String extName = oriName.substring(oriName.lastIndexOf("."));
			// 3.生成自定义的新文件名，这里以UUID.jpg|png|xxx作为格式（可选操作，也可以不自定义新文件名）
			String uuid = UUID.randomUUID().toString();
			String newName = uuid + extName;
			// 4.获取要保存的路径文件夹
			String realPath = request.getRealPath("/images/");
			// 5.保存图片
			file.transferTo(new File("E:\\image\\"+newName));
			// 6.返回保存结果信息
			result.setCode(0);
			dataMap = new HashMap<>();
			dataMap.put("src","/pic/"+newName);
			result.setData(dataMap);
			result.setMsg(oriName + "上传成功！");
			String jsonString = JSON.toJSONString(result);
			response.getWriter().println(jsonString);
		} catch (IllegalStateException e) {
			imgResult.setCode(1);
			System.out.println(desFilePath + "图片保存失败");
			String jsonString = JSON.toJSONString(imgResult);
			response.getWriter().println(jsonString);
			
		} catch (IOException e) {
			imgResult.setCode(1);
			System.out.println(desFilePath + "图片保存失败--IO异常");
			String jsonString = JSON.toJSONString(imgResult);
			response.getWriter().println(jsonString);
		}
	}

	
	
	@RequestMapping("/saveGoods")
	@ResponseBody
	private String saveImgInfo(String imgUrls,Photo photo){
	    
		photo.setPid(UUID.randomUUID().toString());
		String imgurl = imgUrls.substring(0,imgUrls.length()-1);
		photo.setP_address(imgurl);
		photo.setP_time(new Date().toString());
		
		picService.insertPic(photo);
		
		//String[] urls = imgUrls.split(",");
//		for (int i = 0; i < urls.length; i++) {
//			System.out.println("图片名称："+urls[i]);
//		}
		return "1";
	}


	
	/**
	 * 用戶修改头像
	 * @param pictureFile
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/updateUserpic")
	public String updateUserPic(@RequestParam MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String sUid = request.getParameter("uid");
		int uid = Integer.parseInt(sUid);
		
		String fileStr = pictureFile.getOriginalFilename();
		
		String newFileName = UUID.randomUUID().toString()+fileStr.substring(fileStr.lastIndexOf("."));
		
		pictureFile.transferTo(new File("E:\\image\\"+newFileName));
		
		User user = userService.findUserByUid(uid);
		
		user.setUserphoto("/pic/"+newFileName);
		userService.updateUser(user);
		request.getSession().setAttribute("user",user);
		return "forward:usercenter.action";
	}
	
	/**
	 * 寻找属于个人的图片
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/findpicbyUser")
	public void findPicByUser(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String uid = request.getParameter("uid");	
		List<Photo> plist = picService.findPicByUid(uid);
		response.setContentType("application/json;utf-8");
		response.setCharacterEncoding("UTF-8");
		String jsonString = JSON.toJSONString(plist);
		response.getWriter().println(jsonString);
	}
	
	/**
	 * 更新用户个人信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateuser")
	public String updateUser(User user,Model model) {
		userService.updateUsernameAndTag(user);
		User newUser = userService.findUserByUid(user.getUid());
		model.addAttribute("user",newUser);
		return "user";
	}
	
	/**
	 * 用戶退出登录
	 */
	@RequestMapping("/exituser")
	public String exitUser(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "redirect:/index.jsp";	
		
	}
	
	/**
	 * 访问他人用户中心
	 */
	@RequestMapping("/tousercent")
	public String toUsercent(HttpServletRequest request,Model model) {
		String uid = request.getParameter("uid");
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
		String auid = String.valueOf(user.getUid());
		FollowUtil util = new FollowUtil();
		int checkRelations = util.checkRelations(auid, uid);
		model.addAttribute("relation",checkRelations);
		}
		else if(user == null){
		model.addAttribute("relation",null);
		}
		User auser = userService.findUserByUid(Integer.parseInt(uid));
		
		model.addAttribute("auser",auser);
		return "usercent";
	}
	
	
	@RequestMapping("/findhotuser")
	public void findHotuser(HttpServletResponse response) throws IOException {
		List<User> ulist = userService.findHotUsers();
		if(ulist!=null) {
			String jsonString = JSON.toJSONString(ulist);
			response.setContentType("application/json;utf-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().println(jsonString);
			}
	}
	
}
