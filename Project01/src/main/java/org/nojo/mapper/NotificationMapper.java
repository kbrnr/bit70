package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.NotificationVO;

public interface NotificationMapper {
	
	@Select("select * from tbl_notification "
			+ "where clz_domain = #{domain} "
			+ "and noti_receiver_id = #{id} "
			+ "and noti_read_gb = 0 "
			+ "order by noti_regdate")
	public List<NotificationVO> getNotifications(@Param("domain") String domain, @Param("id") String id);
	
	@Select("select * from tbl_notification "
			+ "where clz_domain = #{domain} "
			+ "and noti_receiver_id = #{id} "
			+ "and noti_no = #{notiNo} ")
	public List<NotificationVO> getNotification(@Param("domain") String domain, @Param("id") String id, @Param("notiNo") int notiNo);
	
	@Update("update tbl_notification set noti_read_gb = 1 where noti_no = #{notiNo}")
	public void updateReadState(int notiNo);
	
	@Update("update tbl_notification set screen_gb = 2 where noti_no = #{notiNo}")
	public void setInside(int notiNo);
	
	@Update("update tbl_notification set screen_gb = 0 where noti_no = #{notiNo}")
	public void setAside(int notiNo);
	
	@Insert("insert into tbl_notification("
			+ "	noti_service_name, "
			+ "	noti_service_link, "
			+ "	noti_sender_id, "
			+ "	noti_receiver_id, "
			+ "	noti_summation, "
			+ " clz_domain, "
			+ " screen_gb) "
			+ "values("
			+ "	#{noti_service_name}, "
			+ "	#{noti_service_link}, "
			+ "	#{noti_sender_id}, "
			+ "	#{noti_receiver_id}, "
			+ "	#{noti_summation}, "
			+ "	#{clz_domain}, "
			+ " #{screen_gb})"
			)
	public void insert(NotificationVO vo);
	
	@Delete("delete from tbl_notification where noti_no = #{notiNo}")
	public void removeNotification(int notiNo);
	
}
