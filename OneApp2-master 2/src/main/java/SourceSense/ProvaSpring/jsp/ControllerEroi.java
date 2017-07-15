package SourceSense.ProvaSpring.jsp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import db.DAO;
import entities.*;

@Controller
public class ControllerEroi {

	@Autowired
	DAO dao;

	
	@RequestMapping(value="/listaEroi",method = RequestMethod.POST)
	public String listaEroiJson(Map<String, Object> model) 
	{
		ArrayList<Personaggio> eroi = dao.load("eroi");
		String stampa = "[";
		for(Personaggio r: eroi)
			stampa += r.toJson() +",";
		stampa = stampa.substring(0, stampa.length()-1);
		
		stampa += "]";

			model.put("dato", stampa);
			System.out.println("Sono nel metodo listaEroiJson, stampa: " + stampa);

			return "json";		
	
	}
	
	@RequestMapping(value="/listaEroi",method=RequestMethod.GET)
	public String Eroi(HttpSession session)
	{
		
		return "listaEroi";
	
	}

	
	
	
	}