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
		//���÷�ҳ���ݣ���ʼ��ҳ
				PageHelper.startPage(pageNum, pageSize);
				//��ѯ��ǰҳ�ļ�������
				List<OffMess> list = this.offMessMapper.selectByExample(null);
				//��װ��pageinfo����
				PageInfo<OffMess> page=new PageInfo<OffMess>(list);
				return page;
	}

	@Override
	public PageInfo<OffMess> selectdeta(Integer pageNum, Integer pageSize, String ser) {
		//���÷�ҳ���ݣ���ʼ��ҳ
		System.out.println("����������ӿ�");
		PageHelper.startPage(pageNum, pageSize);
		//��ѯ��ǰҳ�ļ�������
		OffMessExample e = new OffMessExample();
		                Criteria c = e.createCriteria();
		                if(ser!=null){
		                	c.andSenderEqualTo(ser);
		                }
	    List<OffMess> list = offMessMapper.selectByExample(e);
		//��װ��pageinfo����
		PageInfo<OffMess> page=new PageInfo<OffMess>(list);
		return page;
	}
	
	@Override
	public List<OffMessdeta> selectdeta1(Long did) {
		//���÷�ҳ���ݣ���ʼ��ҳ
		System.out.println("����������ӿ�");
		//��ѯ��ǰҳ�ļ�������
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
	    
	    
		//��װ��pageinfo����
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
		//���÷�ҳ���ݣ���ʼ��ҳ
				System.out.println("����������ӿ�");
				PageHelper.startPage(pageNum, pageSize);
				/*//��ѯ��ǰҳ�ļ�������
				                OffMessExample e = new OffMessExample();
				                Criteria c = e.createCriteria();
				                if(starch!=null){
				                	c.andSenderEqualTo(starch);
				                }*/
			    List<OffMess> list = offMessMapper.sousuo(sender, starch);
			    System.out.println(sender+starch);
				//��װ��pageinfo����
				PageInfo<OffMess> page=new PageInfo<OffMess>(list);
				return page;
	}

	@Override
	public List<OffMessdeta> sousuod(Long mid) {
		//���÷�ҳ���ݣ���ʼ��ҳ
				System.out.println("����������ӿ�");
				//��ѯ��ǰҳ�ļ�������
				OffMessdetaExample e = new OffMessdetaExample();
				com.sc.entity.OffMessdetaExample.Criteria c = e.createCriteria();
				c.andMessidEqualTo(mid);
			    List<OffMessdeta> list = offMessdetaMapper.selectByExample(e);
				//��װ��pageinfo����
				return list;
	}

	@Override
	public String uname(Long reid) {
		 SysUsers user=this.sysUsersMapper.selectByPrimaryKey(reid);
		  return user.getUsersName();
		 
	}

	

	

	

	

	

}
