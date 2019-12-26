package com.sc.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sc.entity.JhCgd;
import com.sc.entity.JhCgdxq;
import com.sc.service.JhCgdService;
import com.sc.service.JhCgdxqService;

@Controller
@RequestMapping("/cgdXqCtrl")
public class cgdXqCtrl {

	@Autowired
	JhCgdxqService jhCgdxqService;
	
	@Autowired
	JhCgdService jhCgdService;
	
	
	//采购单详情页面显示
	
		@RequestMapping("/cgdxqList1.do")
		public ModelAndView cgdxqList(ModelAndView mav,
				@RequestParam(defaultValue="1")Integer pageNum,
				@RequestParam(defaultValue="5")Integer pageSize,
				Long cgdId){
			System.out.println("查询采购单详情-分页！"+cgdId);
			
			//查询list集合-分页     ${page.list}
			PageInfo<JhCgdxq> ii = jhCgdxqService.selectpage(cgdId,pageNum, pageSize);
			List<JhCgdxq> list = ii.getList();
			//cgd采购情况判断设置开始
			int rk=0;//1代表有未入库，2代表全部入库
			for (JhCgdxq jhCgdxq : list) {
				if(jhCgdxq.getIsRk()=="未入库"){
					rk=1;
					break;
				}
					
			}
			JhCgd cgd = jhCgdService.get(cgdId);
			if(rk==1){
				cgd.setCgJz("未入库");
			}else if(rk==0){
				cgd.setCgJz("已入库");
			}
			//cgd采购情况判断设置结束
			if(list.size()==0){
				cgd.setCgJz("待采购");
			}
			jhCgdService.update(cgd);
			System.out.println("-------------------------------->>>>>>>>>>>>采购单详情页面"+ii.getList().size());
			
			mav.addObject("pcgdxq",ii);
			mav.addObject("cgdId", cgdId);
			mav.setViewName("yjs/selectRukuPage");// 路径是：/WEB-INF/userslistpage.jsp
			return mav;
		}
	
		//通过此方法进入，入库页面
		@RequestMapping("/cgdxqList.do")
		public ModelAndView rukuList(ModelAndView mav,
				@RequestParam(defaultValue="1")Integer pageNum,
				@RequestParam(defaultValue="5")Integer pageSize,
				JhCgdxq cgdxq){
			mav.addObject("pcgdxq", jhCgdxqService.selectpage1(pageNum, pageSize, cgdxq));
			System.out.println("通过cgdxqList.do进入，入库页面");
			mav.setViewName("yjs/selectRukuPage");
			return mav;
		}
	
	
	//删除
	@RequestMapping("/cgdxqDelete.do")
	public ModelAndView cgdxqDelete(ModelAndView mav,
								BigDecimal cgdxqId,
								Long cgdId){
		
		jhCgdxqService.delete(cgdxqId);
		System.out.println("------------------>采购单详情删除"+cgdxqId);
		mav.addObject("cgdId", cgdId);
		mav.setViewName("redirect:cgdxqList.do?");// 路径是：/WEB-INF/userslistpage.jsp
		return mav;
	}
	
	//删除选中
		@RequestMapping("/cgdxqDeleteSelect.do")
		public ModelAndView cgdxqDeleteSelect(ModelAndView mav,
											HttpServletRequest req,
											Long cgdId){
			
			String[] idsArr = req.getParameterValues("cgdxqId");
			System.out.println("------------------>采购单详情选择删除"+idsArr.length);
			for (String cgdxqIdStr : idsArr) {
				BigDecimal cgdxqId = new BigDecimal(cgdxqIdStr);
				System.out.println("-------------->"+cgdxqId);
				jhCgdxqService.delete(cgdxqId);
			}
			System.out.println("cgdid-----------------------"+cgdId);
			
			mav.addObject("cgdId", cgdId);
			mav.setViewName("redirect:cgdxqList.do");// 路径是：/WEB-INF/userslistpage.jsp
			return mav;
		}	
		
		//添加采购单详情
		@RequestMapping("/cgdxqToAdd.do")
		public ModelAndView cgdxqToAdd(ModelAndView mav,Long cgdId){
			System.out.println("---------------->采购单详情ToAdd");
			mav.addObject("cgdId", cgdId);
			mav.setViewName("fhw/JH-cgdxqAdd");// 路径是：/WEB-INF/userslistpage.jsp
			return mav;
		}
		
		//入库
		@RequestMapping("/cgdxqRk.do")
		public ModelAndView cgdxqRk(ModelAndView mav,BigDecimal cgdxqId,Long cgdId){
			System.out.println("---------------->采购单详情入库"+cgdxqId);
			JhCgdxq cgdxq = jhCgdxqService.get(cgdxqId);
			cgdxq.setIsRk("已入库");
			jhCgdxqService.update(cgdxq);
			mav.addObject("cgdId", cgdId);
			mav.setViewName("redirect:cgdxqList.do");// 路径是：/WEB-INF/userslistpage.jsp
			return mav;
		}
		
		
}
