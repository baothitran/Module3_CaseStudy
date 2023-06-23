package com.cg.case_m3.DAO;

import com.cg.case_m3.context.DBContext;
import com.cg.case_m3.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User checkUser(String user_email, String user_pass) {
        try {
            String query = "select * from user where user_email = ? and user_pass = ?;";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, user_email);
            ps.setString(2, user_pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                return user;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateUser(int user_id, String user_name, String user_pass) {
        String sql = "update user set user_name =? , user_pass = ? where user_id = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ps.setInt(3, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User checkAcc(String user_email) {
        try {
            String query = "select * from user where user_email = ?;";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, user_email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user_email, String user_pass) {
        try {
            String query = "insert into `user` (user_name, user_email, user_pass, is_admin) values(?,?,?,?);";
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, user_email);
            ps.setString(3, user_pass);
            ps.setString(4, "0");
            ps.executeUpdate();
        } catch (Exception e) {
        }
        ;
    }

    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from user;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteUser(int userId) {
        String sql = "DELETE FROM user WHERE `user_id` = ?;";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }


    public void setAdmin(int user_id, String isAdmin) {
        String sql = "update user set is_admin= ? where user_id = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(2, user_id);
            ps.setString(1, isAdmin.toUpperCase());
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

}
