package org.nojo.filter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nojo.mapper.SecurityMapper;
import org.nojo.security.CustomUser;
import org.nojo.security.SecurityUtil;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SecurityInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private SecurityMapper securityMapper;

	@Override
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		Map<String, String> pathVariables = (Map<String, String>) req.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		if (pathVariables == null)
			return true;
		String domain = pathVariables.get("domain");
		if (domain == null)
			return true;
		boolean flag = securityMapper.isExistDomain(domain);
		if (!flag){
			res.sendError(HttpServletResponse.SC_NOT_FOUND, "존재하지 않는 도메인 입니다");
			return false;
		}
		
		SecurityContext context =  SecurityContextHolder.getContext();
		Authentication auth  = context.getAuthentication();
		String authority = securityMapper.getClassAuthority(domain, SecurityUtil.getUser().getId());
		if(authority == null){
			res.sendError(HttpServletResponse.SC_NOT_FOUND, "권한이 없습니다.");
			return false;
		}
		context.setAuthentication(new UsernamePasswordAuthenticationToken(
			auth.getPrincipal(), 
			auth.getCredentials(),
			getGrantedAuthorities(auth.getAuthorities(), authority)
		));
		return flag;
	}

	private List<GrantedAuthority> getGrantedAuthorities(Collection<? extends GrantedAuthority> collection, String authority) {
		List<GrantedAuthority> after = new ArrayList<GrantedAuthority>();
		for (GrantedAuthority auth : collection) {
			String authName = auth.toString();
			System.out.println(authName);
			if(!authName.startsWith("ROLE_CLASS_"))
				after.add(auth);
		}
		switch (authority) {
		case "member_teacher":
			after.add(new SimpleGrantedAuthority("ROLE_CLASS_TEACHER"));
			break;
		case "member_clz_president":
			after.add(new SimpleGrantedAuthority("ROLE_CLASS_PRESIDENT"));
			break;
		case "member_student":
			after.add(new SimpleGrantedAuthority("ROLE_CLASS_STUDENT"));
			break;
		}
		return after;
	}

}
