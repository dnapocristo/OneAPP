package entities;

public class User 
{

	private  String email;
	private 	 String nickname;
	private  String password;
	private 	 String nome;
	private	 String cognome;
	private 	 int    eta;
	private 	 String sesso;
	public User(String email, String nickname, String password, String nome, String cognome, int eta, String sesso) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.eta = eta;
		this.sesso = sesso;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public String getSesso() {
		return sesso;
	}
	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	
		
		
		
		
	
		
}

	

