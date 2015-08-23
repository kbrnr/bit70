package org.nojo.security;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.mapper.MemberMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private MemberMapper member;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		System.out.println("이름: " +  name);
		MemberVO user = member.findUserById(name);
		if (user == null) {
			throw new UsernameNotFoundException("USER NOT FOUND");
		}
		return new CustomUser(user, getGrantedAuthorities(user.getMem_gb()));
	}
	
	private List<GrantedAuthority> getGrantedAuthorities(String gb){
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		System.out.println(gb);
		switch (gb) {
		case "member_master":
			list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			break;
		case "member_teacher":
			list.add(new SimpleGrantedAuthority("ROLE_TEACHER"));
			break;
		case "member_student":
			list.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
			break;
		}
		return list;
	}

}

