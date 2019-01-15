/**
 * 中国邮政新一代寄递平台 <br/>
 * <br/>
 * 子系统名: <br/>
 * 模 块 名: <br/>
 * 文件名称: ICheckLoginService.java <br/>
 * 创建日期: 2018年12月28日下午4:30:46 <br/>
 * 创 建 人: dujingxin <br/>
 * 版权所有: 2018 中国邮政集团公司 保留所有权利 <br/>
 */

package com.china.post.service;

import java.util.List;
import java.util.Map;

import com.china.post.pojo.UserLoginInfo;

public interface ICheckLoginService {

    public UserLoginInfo checkLoginUser(String name, String passWord);


    public List<UserLoginInfo> getUserList();


    public Long getTotal(Map<String, Object> map);

    public int save(UserLoginInfo userLoginInfo);
}
