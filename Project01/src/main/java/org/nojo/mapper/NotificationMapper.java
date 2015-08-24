package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.NotificationVO;

public interface NotificationMapper {
	
	@Select("select * from tbl_notification "
			+ "where clz_domain = #{domain} "
			+ "and noti_receiver_id = #{id} "
			+ "order by noti_regdate desc "
			+ "limit 0,10")
	public List<NotificationVO> getNotifications(@Param("domain") String domain, @Param("id") String id);
	
	@Select("select * from tbl_notification "
			+ "where clz_domain = #{domain} "
			+ "and noti_receiver_id = #{id} "
			+ "and noti_no = #{notiNo} ")
	public List<NotificationVO> getNotification(@Param("domain") String domain, @Param("id") String id, @Param("notiNo") int notiNo);
	
	@Update("update tbl_notification set noti_read_gb=1 where noti_no = #{notiNo}")
	public void updateReadState(int notiNo);
	
	@SelectKey(before=false, keyProperty="noti_no", statement="select last_insert_id()", resultType=Integer.class)
	@Insert("insert into tbl_notification("
			+ "	noti_service_name, "
			+ "	noti_service_link, "
			+ "	noti_sender_id, "
			+ "	noti_receiver_id, "
			+ "	noti_summation, "
			+ " clz_domain ) "
			+ "values("
			+ "	#{noti_service_name}, "
			+ "	#{noti_service_link}, "
			+ "	#{noti_sender_id}, "
			+ "	#{noti_receiver_id}, "
			+ "	#{noti_summation}, "
			+ "	#{clz_domain}"
			+ ")")
	public void insert(NotificationVO vo);
	
}
