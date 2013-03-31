package ttt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.TTTBotManager;
import db.UserManager;

import models.TTTBot;
import models.User;

/**
 * Servlet implementation class SaveBotServlet
 */
public class SaveBotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveBotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//get params
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String participate = request.getParameter("participate");
		
		//create user
		User user = new User();
		user.setName(username);
		user.setEmail(email);
		
		//create bot
		TTTBot bot = new TTTBot();
		bot.setUserEmail(email);
		bot.setCode(code);
		if(participate!=null && participate.equals("true")){
			bot.setParticipating(true);
		}else{
			bot.setParticipating(false);
		}
		
		//create user if not exists and save bot
		UserManager userMgr = new UserManager();
		TTTBotManager tttBotMgr = new TTTBotManager();
		
		try{
			
			userMgr.CreateUserIfNotExist(user);
			tttBotMgr.SaveBot(bot);
			
			//send ok response
			response.setStatus(HttpServletResponse.SC_OK);
			
		}catch(Exception e){
			
			//send error response
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			
		}
		
	}

}
