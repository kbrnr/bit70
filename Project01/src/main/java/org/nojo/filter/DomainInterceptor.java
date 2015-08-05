package org.nojo.filter;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nojo.mapper.DomainMapper;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class DomainInterceptor extends HandlerInterceptorAdapter {

	@Inject
	private DomainMapper domainMapper;

	@Override
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		Map<String, String> pathVariables = (Map<String, String>) req.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		if (pathVariables == null)
			return true;
		String domain = pathVariables.get("domain");
		if (domain == null)
			return true;
		boolean existence = domainMapper.getAllDomain().contains(domain);
		if (!existence)
			res.sendError(HttpServletResponse.SC_NOT_FOUND, "존재하지 않는 도메인 입니다");
		return existence;
	}
}
