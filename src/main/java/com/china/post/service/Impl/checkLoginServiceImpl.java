/**
 * 中国邮政新一代寄递平台 <br/>
 * <br/>
 * 子系统名: <br/>
 * 模 块 名: <br/>
 * 文件名称: checkLoginServiceImpl.java <br/>
 * 创建日期: 2018年12月28日下午4:34:53 <br/>
 * 创 建 人: dujingxin <br/>
 * 版权所有: 2018 中国邮政集团公司 保留所有权利 <br/>
 */

package com.china.post.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.china.post.dao.UserLoginInfoMapper;
import com.china.post.pojo.UserLoginInfo;
import com.china.post.service.ICheckLoginService;

/**
 * 名称：类的中文名称 <br>
 * 功能：对类的功能进行说明 <br/>
 * <br/>
 * 
 * @since JDK 1.7
 * @see
 * @author dujingxin
 */
@Service
public class checkLoginServiceImpl implements ICheckLoginService {

    @Resource
    private UserLoginInfoMapper userLoginInfoMapper;

    /*
     * 
     * 检测登录
     */
    @Override
    public UserLoginInfo checkLoginUser(String name, String passWord) {
        System.out.println("Service-" + name + ":" + passWord);
        return userLoginInfoMapper.checkUserLogin(name, passWord);
    }

    @Override
    public List<UserLoginInfo> getUserList() {
        return userLoginInfoMapper.getUserList();
    }

    /*
     * 查询记录总数
     */
    @Override
    public Long getTotal(Map<String, Object> map) {
        return userLoginInfoMapper.getTotal(map);
    }

    @Override
    public int save(UserLoginInfo userLoginInfo) {
        return userLoginInfoMapper.insert(userLoginInfo);
    }

    @Override
    public int updateUser(UserLoginInfo userLoginInfo) {
        return userLoginInfoMapper.updateByPrimaryKeySelective(userLoginInfo);
    }

    @Override
    public int deleteUser(int indexId) {
        return userLoginInfoMapper.deleteByPrimaryKey(indexId);
    }
}
