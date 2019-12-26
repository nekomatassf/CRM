package com.sc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMess;
import com.sc.entity.OffMessExample;
import com.sc.entity.OffMessExample.Criteria;
import com.sc.entity.OffMessdeta;
import com.sc.entity.OffMessdetaExample;
import com.sc.entity.SysUsers;
import com.sc.mapper.OffMessMapper;
import com.sc.mapper.OffMessdetaMapper;
import com.sc.mapper.SysUsersMapper;
import com.sc.service.OffMessService;

@Service
public class OffMessServiceimpl implements OffMessService {

	@Autowired
	OffMessMapper offMessMapper;
	@Autowired
	OffMessdetaMapper offMessdetaMapper ;
	@Autowired
	SysUsersMapper sysUsersMapper;
	
	@Override
	public void add(OffMess m) {
		 this.offMessMapper.insert(m);
	}  

	@Override
	public void update(OffMess m) {
		// TODO Auto-generated method stub
	}

	@Override
	public void delete(OffMess m) {
		// TODO Auto-generated method stub
	}

	@Override
	public OffMess get(OffMess m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OffMess> select() {
		// TODO Auto-generated method stub
		return this.offMessMapper.selectByExample(null);
	}

	@Override
	public PageInfo<OffMess> selectpage(Integer pageNum, Integer pageSize) {
		//设置分页数据，开始分页
				PageHelper.startPage(pageNum, pageSize);
				//查询当前页的集合数据
				List<OffMess> list = this.offMessMapper.selectByExample(null);
				//封装成pageinfo对象
				PageInfo<OffMess> page=new PageInfo<OffMess>(list);
				return page;
	}

	@Override
	public PageInfo<OffMess> selectdeta(Integer pageNum, Integer pageSize, String ser) {
		//设置分页数据，开始分页
		System.out.println("进入服务器接口");
		PageHelper.startPage(pageNum, pageSize);
		//查询当前页的集合数据
		OffMessExample e = new OffMessExample();
		                Criteria c = e.createCriteria();
		                if(ser!=null){
		                	c.andSenderEqualTo(ser);
		                }
	    List<OffMess> list = offMessMapper.selectByExample(e);
		//封装成pageinfo对象
		PageInfo<OffMess> page=new PageInfo<OffMess>(list);
		return page;
	}
	
	@Override
	public List<OffMessdeta> selectdeta1(Long did) {
		//设置分页数据，开始分页
		System.out.println("进入服务器接口");
		//查询当前页的集合数据
		OffMessdetaExample e = new OffMessdetaExample();
		com.sc.entity.OffMessdetaExample.Criteria c = e.createCriteria();
		c.andMessidEqualTo(did);
	    List<OffMessdeta> list = offMessdetaMapper.selectByExample(e);
	    for(OffMessdeta d: list){
	    	System.out.println("ddddddddddddddddddddddddddddddddddddddddddddddddid"+d.getReceiverid());
	    	 SysUsers user=this.sysUsersMapper.selectByPrimaryKey(d.getReceiverid());
	    	 System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+user);
	    	d.setUanme(user.getUsersName());
	    	
	    }
	    
	    
		//封装成pageinfo对象
		return list;
	}

	@Override
	public List<OffMess> mdetail(Long mid) {
		return this.offMessMapper.mdetail(mid);
		 
	}

	@Override
	public void write(OffMess m) {
		 this.offMessMapper.write(m);
		 
	}

	@Override
	public PageInfo<OffMess> sousuo(Integer pageNum, Integer pageSize,String sender, String starch) {
		//设置分页数据，开始分页
				System.out.println("进入服务器接口");
				PageHelper.startPage(pageNum, pageSize);
				/*//查询当前页的集合数据
				                OffMessExample e = new OffMessExample();
				                Criteria c = e.createCriteria();
				                if(starch!=null){
				                	c.andSenderEqualTo(starch);
				                }*/
			    List<OffMess> list = offMessMapper.sousuo(sender, starch);
			    System.out.println(sender+starch);
				//封装成pageinfo对象
				PageInfo<OffMess> page=new PageInfo<OffMess>(list);
				return page;
	}

	@Override
	public List<OffMessdeta> sousuod(Long mid) {
		//设置分页数据，开始分页
				System.out.println("进入服务器接口");
				//查询当前页的集合数据
				OffMessdetaExample e = new OffMessdetaExample();
				com.sc.entity.OffMessdetaExample.Criteria c = e.createCriteria();
				c.andMessidEqualTo(mid);
			    List<OffMessdeta> list = offMessdetaMapper.selectByExample(e);
				//封装成pageinfo对象
				return list;
	}

	@Override
	public String uname(Long reid) {
		 SysUsers user=this.sysUsersMapper.selectByPrimaryKey(reid);
		  return user.getUsersName();
		 
	}

	

	

	

	

	

}
