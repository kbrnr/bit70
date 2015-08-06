package org.nojo.service;

import java.util.List;

import org.nojo.domain.SeatVO;

public interface SeatService {
	public List<SeatVO> listMember(String clz_domain)throws Exception;

}
