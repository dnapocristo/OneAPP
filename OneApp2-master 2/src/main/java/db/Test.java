package db;

import java.sql.SQLException;
import java.util.ArrayList;
import entities.*;

public class Test 
{
	public static void main(String[] args) throws SQLException
	{
		DAO d = new DAO(new Database());
		
//		Personaggio p = d.load("eroi", 2);
//		System.out.println(d.loggato("babbano", "saraceno"));
		ArrayList<Personaggio> eroi = d.load("eroi");
		String stampa = "[";
		for(Personaggio r: eroi)
			stampa += r.toJson() +",";
		stampa = stampa.substring(0, stampa.length()-1);
			
		stampa += "]";
		
		System.out.println(stampa);
		
		
		
	}
}