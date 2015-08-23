package org.nojo.security;

import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {
	
	public static CustomUser getUser(){
		SecurityContext context =  SecurityContextHolder.getContext();
		Authentication auth  = context.getAuthentication();
		return (CustomUser)auth.getPrincipal();
	}
	
	public static boolean hasAuthority(Authority authority){
		SecurityContext context =  SecurityContextHolder.getContext();
		Collection<? extends GrantedAuthority> auth  = context.getAuthentication().getAuthorities();
		if(auth == null){
			return false;
		}
		return auth.contains(new SimpleGrantedAuthority(authority.toString()));
	}
	
}
