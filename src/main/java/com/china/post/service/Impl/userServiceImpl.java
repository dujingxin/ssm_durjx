package com.china.post.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.china.post.dao.UserMapper;
import com.china.post.pojo.user;
import com.china.post.service.IUserService;

@Service("userService")
public class userServiceImpl implements IUserService {
    @Resource
    private UserMapper userDao;

    @Override
    public user getUserById(int userId) {
        // TODO Auto-generated method stub
        return userDao.selectByPrimaryKey(userId);
    }

}
