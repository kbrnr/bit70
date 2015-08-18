package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.nojo.domain.AttachfileVO;
import org.nojo.domain.FilemanagerVO;

public interface AttachFileMapper {
	
	//파일 첨부
	
		@SelectKey(keyColumn="attachfile_no", keyProperty="attachfile_no", before=false, resultType = Integer.class, statement = { "select last_insert_id()" })
		@Insert("insert into tbl_attachfile(attachfile_size, attachfile_path, attachfile_name) values (#{attachfile_size}, #{attachfile_path}, #{attachfile_name})")
		public void addAttach(AttachfileVO vo) throws Exception;
		
		@SelectKey(keyColumn="attachfile_no", keyProperty="attachfile_no", before=false, resultType = Integer.class, statement = { "select last_insert_id()" })
		@Insert("insert into tbl_qfilemanager(question_no, attachfile_no , clz_domain) values (#{question_no}, #{attachfile_no} ,#{clz_domain})")
		public void addAttachBoard(FilemanagerVO vo) throws Exception;
		
		
		@Select("select question_no, attachfile_name, attachfile_path, clz_domain "
					+ "from tbl_qfilemanager a join tbl_attachfile b on a.attachfile_no = b.attachfile_no "
					+ "where question_no = #{no} and clz_domain = #{domain}")
		public List<String> getAttach(@Param("no" )Integer no, @Param("domain") String domain) throws Exception;
		
		@Delete("delete from tbl_attachfile where attachfile_no = #{attachfile_no}")
		public void deleteAttach(int attachfile_no) throws Exception;
		
		@Delete("delete from tbl_qfilemanager where question_no = #{question_no}")
		public void deleteQuestionAttachBoard(int question_no) throws Exception;

		@Delete("delete from tlb_afilemanager where answer_no = #{answer_no}")
		public void deleteAnswerAttachBoard(int answer_no) throws Exception;
		
}	
