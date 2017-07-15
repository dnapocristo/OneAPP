package SourceSense.ProvaSpring.jsp;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import db.DAO;
import entities.Personaggio;

@Controller
public class ControllerMostri 
{

	
	@Autowired
	DAO dao;
	
	@RequestMapping("/listaMostri")
	public String listaEroiJson(Map<String, Object> model) 
	{
		ArrayList<Personaggio> mostri = dao.load("mostri");
		String stampa = "[";
		for(Personaggio r: mostri)
			stampa += r.toJson() +",";
		stampa = stampa.substring(0, stampa.length()-1);
		
		stampa += "]";

			model.put("dato", stampa);
			System.out.println("Sono nel metodo listaMostriJson, stampa: " + stampa);

			return "json";		
	
	}
	
	@RequestMapping(value="/listaMostri",method=RequestMethod.GET)
	public String Eroi(HttpSession session)
	{
		
		return "listaMostri";
	
	}
	
	
	
}
