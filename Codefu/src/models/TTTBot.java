package models;

public class TTTBot {
	
	private int botID;
	private String userEmail;
	private String aiName;
	private String code;
	private boolean isParticipating;
	
	public int getBotID() {
		return botID;
	}
	public void setBotID(int botID) {
		this.botID = botID;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getAiName() {
		return aiName;
	}
	public void setAiName(String aiName) {
		this.aiName = aiName;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public boolean isParticipating() {
		return isParticipating;
	}
	public void setParticipating(boolean isParticipating) {
		this.isParticipating = isParticipating;
	}
	
}
