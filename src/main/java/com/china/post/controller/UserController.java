package com.china.post.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.china.post.Util.PageBean;
import com.china.post.Util.ResponseUtil;
import com.china.post.pojo.UserLoginInfo;
import com.china.post.service.ICheckLoginService;
import com.china.post.service.IUserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService        userService;
    @Autowired
    private ICheckLoginService  checkLoginService;

    private static final Logger log = Logger.getLogger(UserController.class);// 日志文件


    @RequestMapping("/showUser")
    public String toIndex() {
        /*
         * int userId = Integer.parseInt(request.getParameter("id")); user user =
         * userService.getUserById(userId); model.addAttribute("user", user);
         */
        return "showUser";
    }

    @RequestMapping("/Login")
    public String userLogin() {
        return "login";
    }

    @RequestMapping("/userMangement")
    public String userMangement() {
        return "UserManagement";
    }

    @RequestMapping("/userList")
    // @ResponseBody
    public String getUserList(@RequestParam(value = "page", required = false) String page,
        @RequestParam(value = "rows", required = false) String rows, HttpServletResponse response,
        Model model) throws Exception {

        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<UserLoginInfo> userLoginInfoList = checkLoginService.getUserList();
        Long total = checkLoginService.getTotal(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(userLoginInfoList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.Write(response, result);
        return null;
    }

    @RequestMapping("/Login1")
    public String checkUserLogin(@RequestParam("login") String name,
        @RequestParam("password") String passWord, Model model) {
        System.out.println(name + ":" + passWord);
        UserLoginInfo user = checkLoginService.checkLoginUser(name, passWord);
        if (name == null || "".equals(name)) { // 没有输入姓名
            model.addAttribute("msg1", "请输入姓名");
        }
        else if (user == null || "".trim().equals(user)) { // 输入姓名但是姓名错误
            model.addAttribute("msg1", "账户不存在，请先注册");
            return "login";
        }
        else if (user != null & (passWord == null || "".equals(passWord))) { // 姓名正确，但没有输入密码
            model.addAttribute("msg2", "请输入密码");
        }
        else if (user != null & !(user.getPassword().equals(passWord))) { // 姓名正确，输入密码，但是密码错误
            model.addAttribute("msg2", "密码错误");
        }
        else if (user != null & user.getPassword().equals(passWord)) { // 姓名密码均正确
            return "showUser";
        }
        return "showUser";
    }

    /**
     * 
     * @Title: saveAction
     *
     * @Description: 保存数据
     *
     * @param UserLoginInfo 登录用户 @param response @param @return 参数
     *
     * 创建日期: 2019年1月15日下午3:47:32 <br/>
     *
     * 创 建 人: dujingxin <br/> @throws
     */
    @RequestMapping("/save")
    public String saveAction(UserLoginInfo userLoginInfo, HttpServletResponse response,
        @RequestParam(value = "userid") int id) {

        int resultTotal = 0;
        // id为0，则进行保存操作,id不为0，则为更新操作
        if (id == 0) {
            // 新增
            resultTotal = checkLoginService.save(userLoginInfo);
        }
        else {
            // 更新
            userLoginInfo.setUserid(id);
            resultTotal = checkLoginService.updateUser(userLoginInfo);
        }

        JSONObject jsonObject = new JSONObject();
        if (resultTotal > 0) {
            jsonObject.put("success", "true");
        }
        else {
            jsonObject.put("errorMsg", "添加失败");
        }
        ResponseUtil.Write(response, jsonObject);
        return null;
    }

    @RequestMapping("/deleteUser")
    public String deleteAction(UserLoginInfo userLoginInfo, HttpServletResponse response,
        @RequestParam(value = "userid") String indexArr) {
        String[] ids = indexArr.split(",");
        int resultTotal = 0;
        for (String id : ids) {
            resultTotal = checkLoginService.deleteUser(Integer.parseInt(id));
        }

        JSONObject jsonObject = new JSONObject();
        if (resultTotal > 0) {
            jsonObject.put("success", "true");
        }
        else {
            jsonObject.put("errorMsg", "添加失败");
        }
        ResponseUtil.Write(response, jsonObject);
        return null;
    }
}
