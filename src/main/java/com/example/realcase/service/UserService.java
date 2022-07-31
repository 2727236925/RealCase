package com.example.realcase.service;

import com.example.realcase.domain.ManageUser;
import com.example.realcase.domain.PageBean;
import com.example.realcase.domain.User;

import java.util.List;
import java.util.Map;

/**
*用户管理的业务接口
 */
public interface UserService {

    /**
    * 查询所有用户信息
    * @return
     */
    List<User> findAll();
    /**
     * 登录信息验证
     * @return
     */
    ManageUser login(ManageUser manageuser);
    /**
     * 添加用户信息
     * @return
     */
    void addUser(User user);
    /**
     * 根据id删除用户信息
     * @return
     */
    void deleteUser(String id);
    /**
     * 根据id查询用户信息
     * @return
     */
    User findUserById(String id);
    /**
     * 修改用户信息
     * @return
     */
    void updateUser(User user);
    /**
     * 批量删除用户信息
     * @return
     */
    void delSelectedUser(String[] ids);
    /**
     * 分页条件查询
     * @return
     */
    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
