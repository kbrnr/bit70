package org.nojo.service;

import java.util.List;

import org.nojo.domain.SeatVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface SeatService {
	public List<SeatVO> listMember(String clz_domain)throws Exception;
	
	public void addSeat(List<SeatVO> list, String domain);

}
