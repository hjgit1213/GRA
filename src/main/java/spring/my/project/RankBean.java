package spring.my.project;

import org.springframework.stereotype.Repository;

@Repository
public class RankBean {
	
	private String id;
	private String passwd;
	private String name;
	private String mail;
	
	public String getId() {
		return id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
