package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.CurriculumVO;
import org.nojo.service.CurriculumService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/{domain}/curriculum")
public class CurriculumController {

  @Inject
  private CurriculumService curriculumService;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String listForm() {
    return "/curriculum/list";
  }

  @RequestMapping(value = "/edit", method = RequestMethod.GET)
  public String editForm(@PathVariable String domain) {
    return "/curriculum/edit";
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.GET)
  public List<CurriculumVO> list(@PathVariable String domain) {
    return curriculumService.list(domain);
  }

  @RequestMapping(method = RequestMethod.POST)
  public void test(@RequestBody List<CurriculumVO> list, @PathVariable String domain) {
    curriculumService.edit(list, domain);
  }

}
