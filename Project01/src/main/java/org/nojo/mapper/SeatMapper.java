package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.nojo.domain.SeatVO;

public interface SeatMapper {
	@Select("select m.mem_name, s.seat_x, s.seat_y from tbl_member m, tbl_seat s where m.mem_id = s.mem_id and s.clz_domain = #{clz_domain}")
	public List<SeatVO> listMember(String clz_domain)throws Exception;
		
}
