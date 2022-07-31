package com.example.realcase.dao;

import com.example.realcase.domain.ManageUser;
import com.example.realcase.domain.User;

import java.util.List;
import java.util.Map;

/**
 *用户操作的dao
 */
public interface UserDao {

    List<User> findAll();

    ManageUser findUserByUsernameAndPassword(String username, String password);

    void add(User user);

    void delete(int id);

    User findById(int id);

    void update(User user);
    /**
     * 查询总记录数
     * @return
     */
    int findTotalCount(Map<String, String[]> condition);
    /**
     * 分页查询每页记录
     * @return
     */
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
