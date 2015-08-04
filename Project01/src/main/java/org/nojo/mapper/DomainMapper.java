package org.nojo.mapper;

import java.util.Set;

import org.apache.ibatis.annotations.Select;

public interface DomainMapper {
  
  @Select("select distinct(clz_domain) from tbl_class")
  public Set<String> getAllDomain();
}
