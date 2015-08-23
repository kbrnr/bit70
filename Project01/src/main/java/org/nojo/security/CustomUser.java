package org.nojo.security;

import java.util.Collection;
import java.util.Date;

import org.nojo.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {
	
	private static final long serialVersionUID = 7189696952953597117L;

	private String id;
	private String name;
	private String email;
	private String tel;
	private Date regDate;
	private Date loginDate;
	private byte[] photo;
	
	public CustomUser(MemberVO vo, Collection<? extends GrantedAuthority> authorities) {
		super(vo.getMem_id(), vo.getMem_pw(), authorities);
		this.id = vo.getMem_id();
		this.name = vo.getMem_name();
		this.email = vo.getMem_email();
		this.tel = vo.getMem_tel();
		this.regDate = vo.getMem_reg_date();
		this.loginDate = vo.getMem_login_date();
		this.photo = vo.getMem_photo();
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getTel() {
		return tel;
	}

	public Date getRegDate() {
		return regDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public byte[] getPhoto() {
		return photo;
	}

	@Override
	public String toString() {
		return "CustomUser [id=" + id + ", name=" + name + ", email=" + email + ", tel=" + tel + ", regDate=" + regDate + ", loginDate=" + loginDate
				+ "]";
	}

}
