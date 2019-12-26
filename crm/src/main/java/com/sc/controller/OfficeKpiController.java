package com.sc.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sc.entity.OfficeKpi;
import com.sc.entity.OfficeTaskAssessment;
import com.sc.entity.OfficeTaskDetail;
import com.sc.service.OfficeKpiService;
import com.sc.service.OfficeTaskAssessmentService;
import com.sc.service.OfficeTaskDetailService;

@Controller
@RequestMapping("/OfficeKpictrl")
public class OfficeKpiController {
	@Autowired 
	OfficeKpiService OfficeKpiService ;
	@Autowired 
	OfficeTaskAssessmentService OfficeTaskAssessmentService;
	@Autowired
	OfficeTaskDetailService officeTaskDetailService;
    @RequestMapping("/list.do")
		public ModelAndView list(ModelAndView mav){
			
			List<OfficeKpi> list = this.OfficeKpiService.select();
			mav.addObject("list", list);
			mav.setViewName("OA/OfficeKpilistpage");// /WEB-INF/userslist.jsp
			return mav;
		}
	 //@RequestMapping("/delete.do")
	 
	
	 @RequestMapping("/listpage.do")
	   public ModelAndView listpage(ModelAndView mav,@RequestParam(defaultValue="1") Integer pageNum,
			@RequestParam(defaultValue="10") Integer pageSize){
		System.out.println("----�����ҳ");
		
		mav.addObject("p",OfficeKpiService.selectpage(pageNum,pageSize));
		
		mav.setViewName("OA/OfficeKpilistpage");
		return mav;
		}
	 
	
	 @RequestMapping("/delete.do")
		public ModelAndView delete(ModelAndView mav,OfficeKpi k){
			System.out.println("ɾ������ָ�꣡"+k.toString());
			this.OfficeKpiService.delete(k);
			
			this.OfficeTaskAssessmentService.deleteByCompanyId(k.getCompanyId());
			mav.setViewName("redirect:listpage.do");//�ض���list����
			return mav;
		}
	 @RequestMapping("/goupdate.do")
	 public ModelAndView goupdate(ModelAndView mav,BigDecimal kpiId){
			System.out.println("�޸�֮ǰ�Ȳ鿴");
			mav.addObject("kpi", OfficeKpiService.get(kpiId));
			mav.setViewName("OA/OfficeKpigoupdate");
			return mav;
		}
	 @RequestMapping("OfficeKpiupdate.do")
	 public ModelAndView OfficeKpiupdate(ModelAndView mav,OfficeKpi kpi,OfficeTaskAssessment t){
		 kpi.setFinalUpdataTime(new Date());
		 t.setFinalUpdateTime(kpi.getFinalUpdataTime());
		 t.setCompanyId(kpi.getCompanyId());
		 t.setTaskKpi(kpi.getKpiKpi());
		 System.out.println("�޸ÿ�������"+kpi);
		this.OfficeKpiService.update(kpi);
		this.OfficeTaskAssessmentService.updateByCompanyId(t);
		 mav.setViewName("redirect:listpage.do");
		 return mav;
	 }
	 @RequestMapping("/addofficeKpi.do")
	 public ModelAndView addofficeKpi(ModelAndView mav,OfficeKpi k,OfficeTaskAssessment t, OfficeTaskDetail d){
		  k.setFinalUpdataTime(new Date());
		  t.setFinalUpdateTime(k.getFinalUpdataTime());
		 t.setCompanyId(k.getCompanyId());
		 t.setTaskKpi(k.getKpiKpi());
		  System.out.println("��ӿ�������"+k);
		  System.out.println(t);
		  this.OfficeKpiService.add(k);
		  this.OfficeTaskAssessmentService.add(t);
		  //this.OfficeTaskAssessmentService.toadd();
		  System.out.println("��ȡ���µ�idΪ������������������"+t.getTaskId());
	    	d.setTaskId(t.getTaskId());
	    	System.out.println("����µ�����"+t);
	    	d.setCompanyId(k.getCompanyId());
	    	System.out.println("��˾���"+k.getCompanyId());
	    	d.setFinalUpdataTime(new Date());
	    	d.setStatus("������");
	    	d.setTaskIsfinshed("δ���");
	        this.officeTaskDetailService.add(d);
		 mav.setViewName("redirect:listpage.do");
		 return mav;
		 }
	 @RequestMapping("/inaddofficeKpi.do")
		public ModelAndView inaddofficeKpi(ModelAndView mav){
			mav.setViewName("OA/addofficeKpi");
			return mav;
			}
}
