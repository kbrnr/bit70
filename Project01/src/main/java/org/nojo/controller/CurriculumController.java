package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.CurriculumVO;
import org.nojo.service.CurriculumService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping("/{domain}/curriculum")
public class CurriculumController {

  @Inject
  private CurriculumService curriculumService;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String listForm(@PathVariable String domain) {
    return "/curriculum/list";
  }
  
  @Secured({"ROLE_ADMIN", "ROLE_CLASS_TEACHER"})
  @RequestMapping(value = "/edit", method = RequestMethod.GET)
  public String editForm(@PathVariable String domain) {
    return "/curriculum/edit";
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.GET)
  public List<CurriculumVO> list(@PathVariable String domain) {
    return curriculumService.list(domain);
  }

  @Secured({"ROLE_ADMIN", "ROLE_CLASS_TEACHER"})
  @RequestMapping(method = RequestMethod.POST)
  @ResponseStatus(HttpStatus.OK)
  public void test(@RequestBody List<CurriculumVO> list, @PathVariable String domain) {
    curriculumService.edit(list, domain);
  }

}
