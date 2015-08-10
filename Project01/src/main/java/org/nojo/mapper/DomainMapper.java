package org.nojo.mapper;

import org.apache.ibatis.annotations.Select;

public interface DomainMapper {
  
  //도메인체크
  @Select("select count(clz_domain) from tbl_class where clz_domain=#{domain}")  //1이면 사용불가능 0이면 사용가능
  public boolean isExistDomain(String domain);
  
}
