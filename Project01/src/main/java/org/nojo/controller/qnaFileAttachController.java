package org.nojo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.nojo.domain.AttachfileVO;
import org.nojo.service.AttachFileService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Secured({"ROLE_CLASS_TEACHER","ROLE_CLASS_PRESIDENT","ROLE_CLASS_STUDENT","ROLE_ADMIN"})
//QnA 게시판 파일 첨부 컨트롤러
@RestController
public class qnaFileAttachController {

	@Inject
	private AttachFileService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void upload() {

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public Map<String, Object> upload(MultipartFile file) throws Exception {

		String fileName = file.getOriginalFilename();
		String attachfile_name = uploadFile(fileName, file.getBytes());

		AttachfileVO vo = new AttachfileVO();
		vo.setAttachfile_name(fileName);
		vo.setAttachfile_path(attachfile_name);
		vo.setAttachfile_size(file.getSize());

		service.addAttachFile(vo);

		Map<String, Object> map = new HashMap<>();
		map.put("filePath", attachfile_name);
		map.put("fileNo", vo.getAttachfile_no());
		map.put("fileName", fileName);
		return map;
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();

		String attachfile_name = uid.toString() + "_" + originalName;

		String attachfile_path = calcPath();

		File target = new File(uploadPath + attachfile_path, attachfile_name);

		FileCopyUtils.copy(fileData, target);

		return attachfile_path + File.separator + attachfile_name;
	}

	public String calcPath() {

		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(yearPath, monthPath, datePath);

		return datePath;
	}

	private void makeDir(String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = new FileInputStream(uploadPath + fileName);
		
		ResponseEntity<byte[]> entity = null;

		try {

			final HttpHeaders headers = new HttpHeaders();

			MediaType mimeType = null;

			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);

			if (suffix.equalsIgnoreCase("jpg") || suffix.equalsIgnoreCase("jpeg")) {
				mimeType = MediaType.IMAGE_JPEG;
			} else if (suffix.equalsIgnoreCase("png")) {
				mimeType = MediaType.IMAGE_PNG;
			} else if (suffix.equalsIgnoreCase("gif")) {
				mimeType = MediaType.IMAGE_GIF;
			} else if (suffix.equalsIgnoreCase("zip")) {
				mimeType = MediaType.APPLICATION_OCTET_STREAM;
			}
			fileName = fileName.substring(fileName.indexOf("_")+1);
			headers.setContentType(mimeType);
			headers.add("Content-Disposition",
					"attachment; fileName=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		} finally{ in.close(); }

		return entity;

	}

	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("attachfile_name") String attachfile_name,
			@RequestParam("attachfile_no") Integer attachfile_no) throws Exception {

		new File(uploadPath + attachfile_name.replace('/', File.pathSeparatorChar)).delete();
		service.removeAttach(attachfile_no);

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
