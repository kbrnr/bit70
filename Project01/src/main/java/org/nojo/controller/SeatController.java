package org.nojo.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.imageio.ImageTypeSpecifier;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;
import javax.swing.filechooser.FileNameExtensionFilter;

import org.imgscalr.Scalr;
import org.nojo.domain.MemberVO;
import org.nojo.domain.SeatVO;
import org.nojo.service.SeatService;
import org.omg.CORBA_2_3.portable.OutputStream;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.Response;

@Controller
@RequestMapping("/{domain}/seat")
public class SeatController {
	@Inject
	SeatService seatService;

	@RequestMapping(method = RequestMethod.GET)
	public String seatPage(@PathVariable("domain") String clz_domain, Model model) throws Exception {

		model.addAttribute("list", seatService.listMember(clz_domain, "lobby"));
		return "/seat/seat";
	}

	@ResponseBody
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public List<SeatVO> seat(@PathVariable String domain) throws Exception {
		return seatService.listMember(domain, "seat");
	}

	@RequestMapping(method = RequestMethod.POST)
	public void seatPage(@RequestBody List<SeatVO> list, @PathVariable String domain) throws Exception {
		seatService.addSeat(list, domain);
		System.out.println(list);
	}

	//이미지 보기 
	@RequestMapping(value = "/seatImg", method = RequestMethod.GET)
	public void photo(String userId, HttpServletResponse res, Model model) throws IOException {
		byte[] bytes = seatService.photo(userId);
		res.getOutputStream().write(bytes);
		
	}
}



/*BufferedImage sourceImg = ImageIO.read(new File(userId));
BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 25);
String thumbnailName = userId;
File newFile = new File(thumbnailName);
String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
ImageIO.write(destImg, formatName.toUpperCase(), newFile);*/