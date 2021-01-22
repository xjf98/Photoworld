package com.xiao.test;

import org.junit.Test;

import com.xiao.utils.RedisUtil;

import redis.clients.jedis.Jedis;

public class RedisTest {

	@Test
	public void test1() {
		Jedis jedis = RedisUtil.getJedis();
		jedis.set("key2","aaa");
		
		System.out.println(jedis.get("key2"));
		
	    RedisUtil.returnResource(jedis);
	}
}
