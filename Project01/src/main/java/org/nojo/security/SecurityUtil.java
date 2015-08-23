package org.nojo.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {
	
	public static CustomUser getUser(){
		SecurityContext context =  SecurityContextHolder.getContext();
		Authentication auth  = context.getAuthentication();
		return (CustomUser)auth.getPrincipal();
	}
}
