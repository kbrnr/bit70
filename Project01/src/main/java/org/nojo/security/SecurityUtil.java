package org.nojo.security;

import java.util.Collection;

import org.nojo.domain.MemberVO;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;

public class SecurityUtil {

	public static CustomUser getUser() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();
		return (CustomUser) auth.getPrincipal();
	}

	public static boolean hasAuthority(Authority authority) {
		SecurityContext context = SecurityContextHolder.getContext();
		Collection<? extends GrantedAuthority> auth = context.getAuthentication().getAuthorities();
		if (auth == null) {
			return false;
		}
		return auth.contains(new SimpleGrantedAuthority(authority.toString()));
	}

	public static void modifyPrincipal(MemberVO vo) {
		SecurityContext context = SecurityContextHolder.getContext();
		CustomUser cu = (CustomUser) context.getAuthentication().getPrincipal();
		
		String tel = vo.getMem_tel();
		String email = vo.getMem_email();
		byte[] photo = vo.getMem_photo();

		if (StringUtils.hasText(tel)) {
			cu.setTel(tel);
		}
		if(StringUtils.hasText(email)){
			cu.setEmail(email);
		}
		if(photo != null){
			cu.setPhoto(photo);
		}
	}

}