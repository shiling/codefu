package ttt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.util.json.JSONObject;

import db.TTTBotManager;
import db.UserManager;

import models.TTTBot;
import models.User;

/**
 * Servlet implementation class SaveBotServlet
 */
public class GetBotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBotServlet() {
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
		String email = request.getParameter("email");
	
		TTTBotManager tttBotMgr = new TTTBotManager();
		
		try{
			
			TTTBot bot = tttBotMgr.GetBot(email);
			
			//send ok response
			response.setStatus(HttpServletResponse.SC_OK);
			
			//send code as json
			response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        JSONObject obj = new JSONObject();
	        obj.put("code", bot.getCode());
	        out.print(obj);
			
		}catch(Exception e){
			
			//send error response
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			
		}
		
	}

}
