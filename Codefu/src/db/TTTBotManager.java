package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.TTTBot;

public class TTTBotManager {

	private Connection conn;
	
	public TTTBotManager(){
		conn = DBConnection.GetConnection();
	}
	
	public void SaveBot(TTTBot newBot) throws SQLException{
		
		//get bot from database
		TTTBot bot = GetBot(newBot.getUserEmail());
		
		if(bot==null){	//very first bot, create
			
			String query = "INSERT INTO ttt_bots (user_email, code, is_participating) VALUES (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, newBot.getUserEmail());
			ps.setString(2, newBot.getCode());
			ps.setBoolean(3, newBot.isParticipating());
			ps.execute();
			
		}else{	//update bot
			
			String query = "UPDATE ttt_bots SET code=?, is_participating=? WHERE user_email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, newBot.getCode());
			ps.setBoolean(2, newBot.isParticipating());
			ps.setString(3, newBot.getUserEmail());
			ps.executeUpdate();
			
		}
				
	}
	
	public TTTBot GetBot(String email) throws SQLException{
	
		String query = "SELECT * FROM ttt_bots WHERE user_email = ?";
		
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);
		ResultSet results = ps.executeQuery();
		
		TTTBot bot = null;
		if(results.next()){
			bot = new TTTBot();
			bot.setBotID(results.getInt("bot_id"));
			bot.setUserEmail(results.getString("user_email"));
			bot.setCode(results.getString("code"));
			bot.setParticipating(results.getBoolean("is_participating"));
		}
		return bot;
		
	}
	
}
