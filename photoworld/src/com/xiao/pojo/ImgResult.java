package com.xiao.pojo;

import java.util.Map;

/**
 * 图片上传建议返回格式 ，当然可以不这么定义
 * { 
 * code": 0 , 
 * msg": "" , 
 * data": { "
 * src":"http://cdn.layui.com/123.jpg" } }
 * 
 * @author liuxuquan
 * @des 根据需要返回的数据格式产生的pojo
 *
 */
public class ImgResult {
	
	//0 表示成功 1表示失败
	private Integer code;
	//信息
	private String msg;
	//url
	private Map<String, String> data;
	
	private Integer totalCount=0;
	private Integer successCount=0;
	private Integer failCount=0;
	
	public ImgResult() {
	}

	public ImgResult(Integer code, String msg, Map<String, String> data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, String> getData() {
		return data;
	}

	public void setData(Map<String, String> data) {
		this.data = data;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getSuccessCount() {
		return successCount;
	}

	public void setSuccessCount(Integer successCount) {
		this.successCount = successCount;
	}

	public Integer getFailCount() {
		return failCount;
	}

	public void setFailCount(Integer failCount) {
		this.failCount = failCount;
	}

}
