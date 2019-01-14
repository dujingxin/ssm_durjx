package com.china.post.dao;

import java.util.List;
import java.util.Map;

import com.china.post.pojo.UserLoginInfo;

public interface UserLoginInfoMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(UserLoginInfo record);

    int insertSelective(UserLoginInfo record);

    UserLoginInfo selectByPrimaryKey(Integer userid);

    UserLoginInfo checkUserLogin(String name, String passWord);

    int updateByPrimaryKeySelective(UserLoginInfo record);

    int updateByPrimaryKey(UserLoginInfo record);

    List<UserLoginInfo> getUserList();

    Long getTotal(Map<String, Object> map);
}
