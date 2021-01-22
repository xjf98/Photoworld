package com.xiao.utils;

import java.util.HashSet;
import java.util.Set;

import redis.clients.jedis.Jedis;

public class FollowUtil {

	 private static final String FOLLOWING = "FOLLOWING_";
     private static final String FANS = "FANS_";
     private static final String COMMON_KEY = "COMMON_FOLLOWING";

     // 关注或者取消关注
     public static int addOrRelease(String userId, String followingId) {
         if (userId == null || followingId == null) {
             return -1;
         }
         int isFollow = 0; // 0 = 取消关注 1 = 关注
         Jedis jedis = RedisUtil.getJedis();
         String followingKey = FOLLOWING + userId;
         String fansKey = FANS + followingId;
         if (jedis.zrank(followingKey, followingId) == null) { // 说明userId没有关注过followingId
             jedis.zadd(followingKey, System.currentTimeMillis(), followingId);
             jedis.zadd(fansKey, System.currentTimeMillis(), userId);
             isFollow = 1;
         } else { // 取消关注
             jedis.zrem(followingKey, followingId);
             jedis.zrem(fansKey, fansKey);
         }
         return isFollow;
     }


      // 验证两个用户之间的关系 
      // 0=没关系  1=自己 2=userId关注了otherUserId 3= otherUserId是userId的粉丝 4=互相关注
     public int checkRelations(String userId, String otherUserId) {

         if (userId == null || otherUserId == null) {
             return 0;
         }

         if (userId.equals(otherUserId)) {
             return 1;
         }
         Jedis jedis = RedisUtil.getJedis();
         String followingKey = FOLLOWING + userId;
         int relation = 0;
         if (jedis.zrank(followingKey, otherUserId) != null) { // userId是否关注otherUserId
             relation = 2;
         }
         String fansKey = FANS + userId;
         if (jedis.zrank(fansKey, userId) != null) {// userId粉丝列表中是否有otherUserId
             relation = 3;
         }
         if ((jedis.zrank(followingKey, otherUserId) != null) 
                 && jedis.zrank(fansKey, userId) != null) {
             relation = 4;
         }
         return relation;
     }

     // 获取用户所有关注的人的id
     public static Set<String> findFollwings(String userId) {
         return findSet(FOLLOWING + userId);
     }

     // 获取用户所有的粉丝
     public static Set<String> findFans(String userId) {
         return findSet(FANS + userId);
     }

     // 获取两个共同关注的人
     public static Set<String> findCommonFollowing(String userId, String otherUserId) {
         if (userId == null || otherUserId == null) {
             return new HashSet<>();
         }
         Jedis jedis = RedisUtil.getJedis();
         String commonKey = COMMON_KEY + userId + "_" + otherUserId;
         // 取交集
         jedis.zinterstore(commonKey + userId + "_" + otherUserId, FOLLOWING + userId, FOLLOWING + otherUserId); 
         Set<String> result = jedis.zrange(commonKey, 0, -1);
         jedis.del(commonKey);
         return result;
     }

     // 根据key获取set
     private static Set<String> findSet(String key) {
         if (key == null) {
             return new HashSet<>();
         }
         Jedis jedis = RedisUtil.getJedis();
         Set<String> result = jedis.zrevrange(key, 0, -1); // 按照score从大到小排序
         return result;
     }
	
}
