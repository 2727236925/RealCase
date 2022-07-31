package com.example.realcase.service.impl;

import com.example.realcase.dao.UserDao;
import com.example.realcase.dao.impl.UserDaoImpl;
import com.example.realcase.domain.ManageUser;
import com.example.realcase.domain.PageBean;
import com.example.realcase.domain.User;
import com.example.realcase.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao dao =new UserDaoImpl();
    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public ManageUser login(ManageUser manageuser){
        return dao.findUserByUsernameAndPassword(manageuser.getUsername(),manageuser.getPassword());
    }

    @Override
    public void addUser(User user){
        dao.add(user);
    }

    @Override
    public void deleteUser(String id) {
        dao.delete(Integer.parseInt(id));
    }

    public User findUserById(String id){
        return dao.findById(Integer.parseInt(id));
    }

    @Override
    public void updateUser(User user) {
        dao.update(user);
    }

    @Override
    public void delSelectedUser(String[] ids) {
        if(ids!=null&&ids.length>0) {
            for (String id : ids) {
                dao.delete(Integer.parseInt(id));
            }
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {

        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);

//        if(currentPage<=0){
//            currentPage=1;
//        }
        PageBean<User> pb=new PageBean<User>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        int totalCount=dao.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        int start=(currentPage-1)*rows;
        List<User> list=dao.findByPage(start,rows,condition);
        pb.setList(list);

        int totalPage=(totalCount % rows) ==0 ? totalCount/rows : totalCount/rows+1;
        pb.setTotalPage(totalPage);
        return pb;
    }


}
