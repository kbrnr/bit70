package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.SeatVO;
import org.nojo.mapper.SeatMapper;
import org.springframework.stereotype.Service;

@Service
public class SeatServiceImpl implements SeatService {

	@Inject
	SeatMapper mapper;

	@Override
	public List<SeatVO> listMember(String clz_domain, String key) throws Exception {
		return mapper.listMember(clz_domain, key);
	}

	@Override
	public void addSeat(List<SeatVO> list, String domain) {
		for (SeatVO vo : list) {
			mapper.updateSeat(vo, domain);
		}
	}

}
