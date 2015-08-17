package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;
import org.nojo.domain.SeatVO;


public interface SeatMapper {
	/*@Select("select m.mem_name, s.mem_id, s.seat_x, s.seat_y from tbl_member m, tbl_seat s where m.mem_id = s.mem_id and s.clz_domain = #{clz_domain}")*/
	public List<SeatVO> listMember( @Param("clz_domain") String clz_domain, @Param("key") String key)throws Exception;

	public void addSeat(@Param("list") List<SeatVO> list, @Param("domain") String domain);
	
	@Update("update tbl_seat set seat_x= #{vo.seat_x}, seat_y= #{vo.seat_y} where mem_id= #{vo.mem_id} and clz_domain= #{domain}")
	public void updateSeat(@Param("vo") SeatVO vo, @Param("domain") String domain);
	
	@Select("select mem_photo from tbl_member where mem_id=#{userId}")
	public Object photo(String userId);
	
}
