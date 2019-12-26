package com.sc.service;

import java.math.BigDecimal;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sc.entity.JhCgd;
import com.sc.entity.JhCgdxq;
import com.sc.entity.SaleSoutOrder;
public interface JhCgdxqService {
	
			//分页查询
			//通过cgdId查询
			public PageInfo<JhCgdxq> selectpage(Long cgdId,Integer pageNum,Integer pageSize);
			//通过对象查询
			public PageInfo<JhCgdxq> selectpage1(Integer pageNum,Integer pageSize,JhCgdxq cgdxq);
			//添加
			public void add(JhCgdxq cgdxq);
			//删除
			public void delete(BigDecimal cgdxqId);
			//修改
			public void update(JhCgdxq cgdxq);
			//获取对象
			public JhCgdxq get(BigDecimal cgdxqId);
			 //ͨ通过主键查询对象
		    public JhCgdxq  getcgdID(long  cgdId);
		    
		    public List<JhCgdxq> getListByCgdid(Long cgdId);
		    
	
}
