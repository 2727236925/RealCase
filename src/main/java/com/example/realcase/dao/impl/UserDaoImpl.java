package com.example.realcase.dao.impl;

import com.example.realcase.dao.UserDao;
import com.example.realcase.domain.ManageUser;
import com.example.realcase.domain.User;
import com.example.realcase.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements UserDao {

    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<User> findAll() {
            String sql = "select * from user";
            List<User> users=template.query(sql,new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    public ManageUser findUserByUsernameAndPassword(String username,String password){
        try{
            String sql = "select * from manageuser where username = ? and password = ?";
            ManageUser manageuser = template.queryForObject(sql, new BeanPropertyRowMapper<ManageUser>(ManageUser.class), username, password);
            return manageuser;
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void add(User user){
        String sql="insert into user values(?,?,?,?,?,?,?)";
        template.update(sql,user.getId(),user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQQ(),user.getEmail());
    }

    public void delete(int id){
        String sql="delete from user where id = ?";
        template.update(sql,id);
    }

    @Override
    public User findById(int id) {
        String sql="select * from user where id = ?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),id);
    }

    @Override
    public void update(User user) {
        String sql="update user set name = ?, gender = ?, age = ?, address = ?,QQ = ?,email = ? where id = ?";
        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQQ(),user.getEmail(),user.getId());
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        String sql="select count(*) from user where 1 = 1";
        StringBuilder sb=new StringBuilder(sql);

        Set<String> keySet=condition.keySet();//遍历Map
        List<Object> prams=new ArrayList<Object>();

        for (String key:keySet){
            if("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }

            String value=condition.get(key)[0];
            if (value!=null && !"".equals(value)){
                sb.append(" and "+key+" like ? ");
                prams.add("%"+value+"%");
            }
        }

        sql=sb.toString();
        return template.queryForObject(sql, Integer.class,prams.toArray());
    }

    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql="select * from user where 1 = 1";
        StringBuilder sb=new StringBuilder(sql);

        Set<String> keySet=condition.keySet();//遍历Map
        List<Object> prams=new ArrayList<Object>();

        for (String key:keySet){
            if("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }

            String value=condition.get(key)[0];
            if (value!=null && !"".equals(value)){
                sb.append(" and "+key+" like ? ");
                prams.add("%"+value+"%");
            }
        }
        sb.append(" limit ?,? ");
        prams.add(start);
        prams.add(rows);

        sql=sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<User>(User.class),prams.toArray());
    }


}
