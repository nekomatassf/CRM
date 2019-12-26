package com.sc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMessdeta;
import com.sc.mapper.OffMessdetaMapper;
import com.sc.mapper.SysUsersMapper;
import com.sc.service.OffMessdetaService;

@Service
public class OffMessdetaServiceimpl implements OffMessdetaService {
	
	@Autowired
	OffMessdetaMapper  offMessdetaMapper;
	@Autowired
	SysUsersMapper  sysUsersMapper;

	@Override
	public void add(OffMessdeta md) {
		offMessdetaMapper.insert(md);

	}

	@Override
	public void update(OffMessdeta md) {
		this.offMessdetaMapper.updateByPrimaryKey(md);

	}

	
	@Override
	public OffMessdeta get(Long did) {
		
		OffMessdeta dmess = this.offMessdetaMapper.details(did);
		System.out.println(dmess);
		System.out.println(dmess.getOffMess());
		
		
		return dmess;
	}

	@Override
	public List<OffMessdeta> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<OffMessdeta> selectpage(Integer pageNum, Integer pageSize) {
		//设置分页数据，开始分页
		PageHelper.startPage(pageNum, pageSize);
		//查询当前页的集合数据
		List<OffMessdeta> list = this.offMessdetaMapper.selectByExample(null);
		//封装成pageinfo对象
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
	}

	@Override
	public PageInfo<OffMessdeta> selectdeta(Integer pageNum, Integer pageSize, Long sid) {
		//设置分页数据，开始分页
				PageHelper.startPage(pageNum, pageSize);
				//查询当前页的集合数据
				List<OffMessdeta> list = this.offMessdetaMapper.detamess(sid);
				
				for (OffMessdeta md : list) {
					System.out.println("短信详情"+md);
					System.out.println("短消息"+md.getOffMess());
					System.out.println();
				}
				
				//封装成pageinfo对象
				PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
				
				return page;
	}

	@Override
	public OffMessdeta getbyid(Long did) {
		OffMessdeta d =new OffMessdeta();
		d=this.offMessdetaMapper.selectByPrimaryKey(did);
		
		return this.offMessdetaMapper.selectByPrimaryKey(did);
		
	}

	@Override
	public void delete(Long did) {
		 this.offMessdetaMapper.deleteByPrimaryKey(did);
		
	}

	//模糊查询收件箱
	@Override
	public PageInfo<OffMessdeta> sousuod(Integer pageNum, Integer pageSize, Long reid, String starch) {
		System.out.println("接收者id"+reid+"关键字"+starch);
		List<OffMessdeta> list= this.offMessdetaMapper.sousuod(reid, starch);
		
		//封装成pageinfo对象
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
		 
	}

	//垃圾箱列表
	@Override
	public PageInfo<OffMessdeta> selectlajxiang(Integer pageNum, Integer pageSize, Long sid) {
		//设置分页数据，开始分页
		PageHelper.startPage(pageNum, pageSize);
		//查询当前页的集合数据
		List<OffMessdeta> list = this.offMessdetaMapper.lajixiang(sid);
		
		//封装成pageinfo对象
		PageInfo<OffMessdeta> page=new PageInfo<OffMessdeta>(list);
		
		return page;
	}

	

	

}
