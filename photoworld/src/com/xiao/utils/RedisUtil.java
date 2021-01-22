package com.xiao.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public  class RedisUtil {
	 //Redis服务器IP
    private static String ADDR = "192.168.149.128";
    //Redis的端口号
    private static int PORT = 6379;
    //访问密码
    private static String AUTH = "";
    //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
    private static int MAX_IDLE = 200;
    private static int TIMEOUT = 10000;
    //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
    private static boolean TEST_ON_BORROW = true;
    private static JedisPool jedisPool = null;

    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxIdle(MAX_IDLE);
            config.setTestOnBorrow(TEST_ON_BORROW);
            jedisPool = new JedisPool("192.168.149.128",6379);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public synchronized static Jedis getJedis() {
        try {
            if (jedisPool != null) {
                Jedis resource = jedisPool.getResource();
                return resource;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @SuppressWarnings("deprecation")
    public static void returnResource(final Jedis jedis) {
        if (jedis != null) {
            jedisPool.returnResource(jedis);
        }
    }
	
}
