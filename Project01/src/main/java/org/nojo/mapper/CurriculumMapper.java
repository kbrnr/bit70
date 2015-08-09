package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.nojo.domain.CurriculumVO;

public interface CurriculumMapper {

  @Select("SELECT d.curri_name, d.curri_no, d.curri_pno, d.curri_depth "
          +"FROM "
          +"( "
          +"SELECT dept_connect_by_parent() AS id "
          +"FROM ( "
          +"SELECT @start_with := 0, "
          +"@id := @start_with "
          +") vars, tbl_curriculum "
          +"WHERE @id is not null "
          +") func "
          +"Join tbl_curriculum d "
          +"ON func.id = d.curri_no ")
  public List<CurriculumVO> list(String domain);


  public void add(@Param("vo") CurriculumVO vo, @Param("domain") String domain);
}
