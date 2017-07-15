package SourceSense.ProvaSpring.jsp;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import db.DAO;
@Controller
public class ControllerLogin
{


		@Autowired
		private DAO dao;
		
		@RequestMapping(value="/",method = RequestMethod.GET)
		public String showHome()
		{
			return "home";
		}
		
		@RequestMapping(value="/login",method = RequestMethod.GET)
		public String showLoginForm()
		{
			return "login";
		}
		
		
//		@RequestMapping(value="/login/{email}/{password}", method =RequestMethod.POST)
//		public String verifyLogin(@RequestParam String email , @RequestParam String password) throws SQLException
//		
//		{
//			
//			String message = dao.loggato(email, password);
//			
//					if(message.equals("ONEPUUUUUUUUUUUUNNNNNCHHHHHHHHH"))
//						return "home";
//					else
//						return "login";
//			
//			
//		}
//		
//		
		
		@RequestMapping(value="/logout",method=RequestMethod.POST)
		public String logout(HttpSession session)
		{
			session.removeAttribute("email");
			return "login";
		
		}

		@RequestMapping(value="/registrato",method=RequestMethod.POST)
		public String Registrazione(HttpSession session)
		{
		
			
			 dao.registrazione((String)session.getAttribute("email"),(String)session.getAttribute("nickname"),
					 (String)session.getAttribute("password"),(String)session.getAttribute("nome"),(String)session.getAttribute("cognome"),
					 (String)session.getAttribute("eta"),(String)session.getAttribute("sesso")
					);
			
			return "home";
		
			
		}

		@RequestMapping(value="/formRegistrazione",method=RequestMethod.GET)
		public String formRegistrazione(HttpSession session)
		{
			return "formRegistrazione";
		}
		
		@RequestMapping(value="/registrami",method=RequestMethod.POST)
		public String registrami(HttpServletRequest session)
		{
			String email = (String) session.getParameter("email");
			String nickname = (String) session.getParameter("nickname");
			String password = (String) session.getParameter("password");
			String nome = (String) session.getParameter("nome");
			String cognome = (String) session.getParameter("cognome");
			String eta = (String) session.getParameter("eta");
			String sesso = (String) session.getParameter("sesso");
			dao.registrazione(email, nickname, password, nome, cognome, eta, sesso);
			return "home";
		}
		
		
}


	
	
	
	
	
	

