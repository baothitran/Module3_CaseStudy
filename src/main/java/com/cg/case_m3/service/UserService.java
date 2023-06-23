package com.cg.case_m3.service;

import com.cg.case_m3.context.DBContext;
import com.cg.case_m3.model.User;

import javax.servlet.ServletException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService extends DBContext implements IUserService{
    public boolean checkExistUser(String signupEmail){
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `casestudy_module3`.`user` WHERE user_email = ?;");
            preparedStatement.setString(1, signupEmail);
            ResultSet rs = preparedStatement.executeQuery();
            User user = new User();
            while (rs.next()) {
                int idUser = rs.getInt("user_id");
                String userName = rs.getString("user_name");
                String email = rs.getString("user_email");
                String userPass = rs.getString("user_pass");
                boolean isAdmin = rs.getBoolean("is_admin");
                 user = new User(idUser,userName,email,userPass,isAdmin);

            }
            if(user == null){
                return true;
            }
            return false;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public void create(User user) {
        try {
           Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `casestudy_module3`.`user` (`user_name`, `user_email`, `user_pass`, `is_admin`) VALUES (?, ?, ?, ?);");
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserEmail());
            preparedStatement.setString(3, user.getUserPass());
            preparedStatement.setBoolean(4,false);
            preparedStatement.executeUpdate();
            System.out.println("Function create: "+ preparedStatement);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public User checkUser(String userEmail, String password) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM `casestudy_module3`.`user` WHERE user_email = ? AND user_pass = ?;");
            preparedStatement.setString(1,userEmail);
            preparedStatement.setString(2,password);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("Function checkUser: " + preparedStatement);
            while (rs.next()) {
                int idUser = rs.getInt("user_id");
                String userName = rs.getString("user_name");
                String email = rs.getString("user_email");
                String userPass = rs.getString("user_pass");
                boolean isAdmin = rs.getBoolean("is_admin");
                User user = new User(idUser,userName,email,userPass,isAdmin);
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}