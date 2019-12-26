package com.sc.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sc.entity.OfficeKpi;
import com.sc.entity.OfficeTaskAssessment;
import com.sc.service.OfficeKpiService;
import com.sc.service.OfficeTaskAssessmentService;
import com.sc.service.OfficeTaskDetailService;
import com.sc.entity.OfficeTaskDetail;
@Controller
@RequestMapping("/OfficeTaskAssessmentController")
public class OfficeTaskAssessmentController {
	  @Autowired 
	   OfficeTaskAssessmentService OfficeTaskAssessmentService;
	  @Autowired
	  OfficeKpiService  officeKpiService;
	  @Autowired
	  OfficeTaskDetailService officeTaskDetailService;
    @RequestMapping("/list.do")
    public ModelAndView list(ModelAndView mav){
    	List<OfficeTaskAssessment> list = this.OfficeTaskAssessmentService.select();
		mav.addObject("list", list);
		mav.setViewName("OA/OfficeTaskAssessmentListpage");// /WEB-INF/userslist.jsp
    	return mav;
    }
    @RequestMapping("/listpage.do")
	   public ModelAndView listpage(ModelAndView mav,@RequestParam(defaultValue="1") Integer pageNum,
			@RequestParam(defaultValue="5") Integer pageSize){
		System.out.println("----");
		
		mav.addObject("p",OfficeTaskAssessmentService.selectpage(pageNum,pageSize));
		
		mav.setViewName("OA/OfficeTaskAssessmentListpage");
		return mav;
		}
    //��ҳ��ѯ
    @RequestMapping("/delete.do")
    public ModelAndView delete(ModelAndView mav,OfficeTaskAssessment t){
    	System.out.println("ɾ������"+t);
    	this.OfficeTaskAssessmentService.delete(t);
		mav.setViewName("redirect:listpage.do");//�ض���list����
    	return mav;
    }
    @RequestMapping("/inaddOfficeTaskAssessment.do")
	public ModelAndView inaddofficeKpi(ModelAndView mav){
    	List<OfficeKpi> list = officeKpiService.select();
    	mav.addObject("lhj",list);
		mav.setViewName("OA/addOfficeTaskAssessment");
		return mav;
		}
    @RequestMapping("/add.do")
    public ModelAndView add(ModelAndView mav,OfficeTaskAssessment t,OfficeTaskDetail d){
    	
    	t.setFinalUpdateTime(new Date());
    	
//    	d.setTaskId(t.getTaskId());
//    	System.out.println("����µ�����"+t.getTaskId());
    	
    	System.out.println("�칫��������޸�ʱ��"+new Date());
    	this.OfficeTaskAssessmentService.add(t);
    	System.out.println("��ȡ���µ�idΪ������������������"+t.getTaskId());
    	d.setTaskId(t.getTaskId());
    	System.out.println("����µ�����"+t);
    	d.setCompanyId(t.getCompanyId());
    	System.out.println("��˾���"+t.getCompanyId());
    	d.setFinalUpdataTime(new Date());
    	d.setTaskIsfinshed("δ���");
        this.officeTaskDetailService.add(d);
        System.out.println("����µ�����"+d);
    	mav.setViewName("redirect:listpage.do");//�ض���list����
    	return mav;
    }
    
    @RequestMapping("/goupdate.do")
	 public ModelAndView goupdate(ModelAndView mav,BigDecimal taskId){
			System.out.println("�޸�֮ǰ�Ȳ鿴");
			mav.addObject("t", OfficeTaskAssessmentService.get(taskId));
			mav.setViewName("OA/OfficeTaskAssessmentgoupdate");
			return mav;
		}
    
    
    
    @RequestMapping("/update.do")
    public ModelAndView update(ModelAndView mav,OfficeTaskAssessment t){
    	System.out.println("����µ�����"+t);
    	t.setFinalUpdateTime(new Date());
    	this.OfficeTaskAssessmentService.update(t);
    	mav.setViewName("redirect:listpage.do");//�ض���list����
    	return mav;
    }
    
    @RequestMapping("selectKpi.do")
    public ModelAndView selectKpi(ModelAndView mav,OfficeTaskAssessment t,OfficeKpi k){
    	System.out.println("---------"+k.getKpiKpi());
    	t.setTaskKpi(k.getKpiKpi());
    	System.out.println("-----"+t.getTaskKpi());
    	List<OfficeTaskAssessment> list1=this.OfficeTaskAssessmentService.selectKpi(k.getKpiKpi());
    	mav.addObject("kl", list1);
    	mav.setViewName("OA/kpiDetaillist");
    	return mav;
    }
    
}
