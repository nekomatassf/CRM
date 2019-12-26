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
    //分页查询
    @RequestMapping("/delete.do")
    public ModelAndView delete(ModelAndView mav,OfficeTaskAssessment t){
    	System.out.println("删除任务"+t);
    	this.OfficeTaskAssessmentService.delete(t);
		mav.setViewName("redirect:listpage.do");//重定向到list方法
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
//    	System.out.println("添加新的任务"+t.getTaskId());
    	
    	System.out.println("办公任务最后修改时间"+new Date());
    	this.OfficeTaskAssessmentService.add(t);
    	System.out.println("获取到新的id为￥￥￥￥￥￥￥￥￥"+t.getTaskId());
    	d.setTaskId(t.getTaskId());
    	System.out.println("添加新的任务"+t);
    	d.setCompanyId(t.getCompanyId());
    	System.out.println("公司编号"+t.getCompanyId());
    	d.setFinalUpdataTime(new Date());
    	d.setTaskIsfinshed("未完成");
        this.officeTaskDetailService.add(d);
        System.out.println("添加新的任务"+d);
    	mav.setViewName("redirect:listpage.do");//重定向到list方法
    	return mav;
    }
    
    @RequestMapping("/goupdate.do")
	 public ModelAndView goupdate(ModelAndView mav,BigDecimal taskId){
			System.out.println("修改之前先查看");
			mav.addObject("t", OfficeTaskAssessmentService.get(taskId));
			mav.setViewName("OA/OfficeTaskAssessmentgoupdate");
			return mav;
		}
    
    
    
    @RequestMapping("/update.do")
    public ModelAndView update(ModelAndView mav,OfficeTaskAssessment t){
    	System.out.println("添加新的任务"+t);
    	t.setFinalUpdateTime(new Date());
    	this.OfficeTaskAssessmentService.update(t);
    	mav.setViewName("redirect:listpage.do");//重定向到list方法
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
