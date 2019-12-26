package com.sc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import com.sc.entity.OffMessdeta;

public interface OffMessdetaService {
	
			//添加
			public void add(OffMessdeta md);
			
			//修改
		    public void update(OffMessdeta md);
		    
		    //
		    public OffMessdeta getbyid(Long did);
		    
		    //删除
		    public void delete(Long did);
		    
		    //获取
		    public OffMessdeta get(Long did);
		    
		    //查询
		    public List<OffMessdeta> select();
		    
		
		//查询列表-分页
		 public PageInfo<OffMessdeta> selectpage(Integer pageNum,Integer pageSize);
		 
		//查询列表-分页
		 public PageInfo<OffMessdeta> selectdeta(Integer pageNum,Integer pageSize,Long sid);
		 
		 
		//垃圾箱
		 public PageInfo<OffMessdeta> selectlajxiang(Integer pageNum,Integer pageSize,Long sid);
		 
		 //模糊查询收件箱
		 public PageInfo<OffMessdeta> sousuod(Integer pageNum,Integer pageSize,Long reid,String starch);
		 
		 
}
