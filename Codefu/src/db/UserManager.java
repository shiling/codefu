package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.User;

public class UserManager {

	private Connection conn;
	
	public UserManager(){
		conn = DBConnection.GetConnection();
	}
	
	public void CreateUserIfNotExist(User newUser) throws SQLException{
		
		//get user from database
		User user = GetUser(newUser.getEmail());
		
		if(user==null){	//first time user, create
			
			String query = "INSERT INTO users (email, name) VALUES (?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, newUser.getEmail());
			ps.setString(2, newUser.getName());
			ps.execute();
			
		}
				
	}
	
	public User GetUser(String email) throws SQLException{
	
		String query = "SELECT * FROM users WHERE email = ?";
		
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);
		ResultSet results = ps.executeQuery();
		
		User user = null;
		if(results.next()){
			user = new User();
			user.setName(results.getString("name"));
			user.setEmail(email);
		}
		return user;
		
	}
	
}
