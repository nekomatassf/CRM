package com.sc.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sc.entity.KcCangku;
import com.sc.entity.KcGoods;
import com.sc.entity.SaleSinfo;
import com.sc.entity.SaleSoutOrder;
import com.sc.service.KcGoodsService;
import com.sc.service.SInfoService;
import com.sc.service.SOutOrderService;
import com.sc.service.SaleService;

@Controller
@RequestMapping("/SOUTControllerCtrl")//类的路径
public class SOUTController {
	@Autowired
	SOutOrderService  sOutOrderService;
	@Autowired
	KcGoodsService  kcGoodsService;
	@Autowired
	SInfoService sInfoService;
	//分页查询--所有
	@RequestMapping("/listPage.do")
	public ModelAndView listPage(ModelAndView mav,
			@RequestParam(defaultValue="1")Integer pageNum,
			@RequestParam(defaultValue="5")Integer pageSize,SaleSoutOrder sout){
		
		mav.addObject("p", sOutOrderService.select(pageNum, pageSize,sout));
		System.out.println("销售金额销售金额，");
		//跳转到销售出库单页面
		mav.setViewName("yjs/selectSOUTPage");
		
		System.out.println("分页--SOUT");		
		return mav;
	}
	
	//出库--
	@RequestMapping("/cuku.do")
	public ModelAndView cukulistPage(ModelAndView mav,Long soid){
		SaleSoutOrder sout = this.sOutOrderService.getSordeID(soid);
		sout.setOrderStatus("已发货");//0--已发货
		sout.setSstatus("已出库");//已出库
		sOutOrderService.update(sout);
		List<SaleSinfo> glist = this.sInfoService.getsoidlist(soid);//通过销售编号查询的商品编号小集合
		System.out.println("sssssssssssssss");
			for (SaleSinfo g : glist) {
			
			KcGoods kc = kcGoodsService.getGsID(g.getGoodsId());//得到对应商品编号的商品对象
			String kcslstr = kc.getKcNum();//得到库存数量-字符串
			int kcsl =Integer.parseInt(kcslstr);//转化
			System.out.println("仓库库存"+kcsl);
			String cukslstr = g.getGoodsQuantity();//得到出库数量
			int cuksl = Integer.parseInt(cukslstr);
			System.out.println("出库数量"+cuksl);
			System.out.println("得到差值"+(kcsl-cuksl));
			String cz=Integer.toString(kcsl-cuksl);
			kc.setKcNum(cz);
			kcGoodsService.update(kc);	
			}			
			mav.setViewName("yjs/selectSOUTPage");
			return mav;
		}
		
	 //去添加
		 @RequestMapping("/add.do")//去页面转一圈
		 public ModelAndView addofficeKpi(ModelAndView mav){
			 mav.setViewName("yjs/addSOUTPage");
			 return mav;
		 }
		//真正添加的
		 @RequestMapping("/addSOUT.do")
		 public ModelAndView addKCGS(ModelAndView mav,SaleSoutOrder sout){
			/* kcgs.setLastModifyTime(new Date());*/
			 sout.setLastModifyTime(new Date());
			 System.out.println("添加出库单信息"+sout);
			this.sOutOrderService.add(sout);
			 mav.setViewName("redirect:listPage.do");
			 return mav;
			 }
		 
		 //删除
		@RequestMapping("/delete.do")
		public ModelAndView delete(ModelAndView mav, Long soid){//soid--sorderId
			System.out.println("删除库存商品信息！"+soid);
			this.sOutOrderService.delete(soid);
			mav.setViewName("redirect:listPage.do");//重定向到list方法
			return mav;
		}
		
		//选中删除
				@RequestMapping("/soutDeleteSelect.do")
				public ModelAndView kcgsDeleteSelect(ModelAndView mav,
												HttpServletRequest req,
												HttpServletResponse resp){
					
					String[] idsArr = req.getParameterValues("soid");
					System.out.println("------进入删除选中1:>"+idsArr.length);
					for (String gidStr : idsArr) {
						System.out.println("--------进入删除选中2：>"+gidStr);
						Long gid = Long.parseLong(gidStr);
						
						System.out.println("--------进入删除选中3：>"+gid);
						sOutOrderService.delete(gid);
					}
					
					mav.setViewName("redirect:listPage.do");
					return mav;
				}
				
		//修改
		 @RequestMapping("/goupdate.do")
		 public ModelAndView goupdate(ModelAndView mav,Long soid ){
				System.out.println("进入了goupdate");
				mav.addObject("kcgs", sOutOrderService.getSordeID(soid));
				mav.setViewName("yjs/updateSOUTPage");
				return mav;
			}
		 @RequestMapping("/update.do")
		 public ModelAndView OfficeKpiupdate(ModelAndView mav,SaleSoutOrder sout){
			/* kcck.setCangkuLastModifyTime(new Date());*/
			 sout.setLastModifyTime(new Date());
			 System.out.println("修改KCGS信息"+sout);
			this.sOutOrderService.update(sout);
			 mav.setViewName("redirect:listPage.do");
			 return mav;
		 }
}
