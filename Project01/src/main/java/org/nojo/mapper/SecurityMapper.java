package org.nojo.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface SecurityMapper {
  
  //도메인체크
  @Select("select count(clz_domain) from tbl_class where clz_domain=#{domain}")  //1이면 사용불가능 0이면 사용가능
  public boolean isExistDomain(String domain);
  
  //수업에대한 권한
  @Select("select course_gb from tbl_course where mem_id= #{id} and clz_domain= #{domain} and course_state= 2")
  public String getClassAuthority(@Param("domain") String domain, @Param("id") String id);
  
}
