package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import entities.*;
import interfaces.*;

/**
 * Data Access Object wich implements the methods of IDAO, it handles of the persistance:
 * load, save and update elements of the database.
 * HACK: the projects methods
 * @author Naga01
 */
public class DAO implements IDAO 
{
	private Database db;
	
	private final static String[] TABLES = new String[] {"eroi","mostri","user"};
	
	/**
	 * constructor
	 * @param
	 */
	public DAO(Database db)
	{
		this.db = db;
	}
	
	private String table(String type)
	{		
		return
				(
					type.equals("eroe")
					||
					type.equals("eroi")
					?
					TABLES[0]
					:
					""
				)
				+
				(
					type.equals("mostro")
					||
					type.equals("mostri")
					?
					TABLES[1]
					:
					""
				)
				+
				(
						type.equals("user")
						?
						TABLES[2]
						:
						""
				);
	}
	
	public ArrayList<Personaggio> load(String type)
	{
		String table = table(type);
		ArrayList<Personaggio> rtn = new ArrayList<Personaggio>();
		ArrayList<HashMap<String,String>> data = new ArrayList<HashMap<String,String>>();
		
		if(table!="")
		{
			switch(type)
			{
				case "eroi":
					data = db.read(db.loadQuery("eroi"));
				break;
				case "mostri":
					data = db.read(db.loadQuery("mostri"));
				break;
			}
			rtn = personaggi(table,data);
		}
		
		return rtn;
	}
	
	private ArrayList<Personaggio> personaggi(String table, ArrayList<HashMap<String,String>> data)
	{
		ArrayList<Personaggio> rtn = new ArrayList<Personaggio>();
		
		if(table!="" && data.size()>0)
			switch(table)
			{
				case "eroi":
					for(HashMap<String,String> eroe:data)
						rtn.add(new Eroe(eroe));
				break;
				case "mostri":
					for(HashMap<String,String> mostro:data)
						rtn.add(new Mostro(mostro));
				break;
			}
		
		return rtn;
	}
	
	/**
	 * checks out that the inserted email and password are correct and returns the level of the user
	 * @param
	 * @return boolean result
	 */
	public int lvl(String email, String password)
	{
		String[] data = new String[]
				{
						email,
						password
				};
		return 1;
	}

	@Override
	public Personaggio load(String type, int id) {
		Personaggio p = db.loadPersonaggi("eroe", id);
		return p;
	}

	
	
	public boolean loggato (String email, String password) throws SQLException
	{
		String[] MAIL = {email};
		String[] PASSWORD = {password};

		int ePosta = db.readInt(db.loadQuery("cerca_email"),MAIL);
		int codice = db.readInt(db.loadQuery("cerca_password"),PASSWORD);
		System.out.println(ePosta+""+codice);
		
		if (codice == ePosta && ePosta != -1 && codice != -1)
			return true;
		else
			return false;
	}
	
	public boolean  registrazione(String email,String nickname,String password,String nome,String cognome,String eta,String sesso)
	{
		String[] dati = {email};
		ArrayList<HashMap<String,String>> rs = db.executeQuery("cerca_email", dati);
		if(rs.size() == 0)
		{
			String[] dati_2 = {email, nickname, password, nome, cognome, eta, sesso};
			db.executeUpdate("crea_user", dati_2); 
			return true;
		}
	   else
	   {
		   return false;
		  
		   
	   }
		
		
		
		
		
	}
	
	
}
