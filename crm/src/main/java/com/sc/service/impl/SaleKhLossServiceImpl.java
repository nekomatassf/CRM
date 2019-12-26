package com.sc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.SaleKhinfo;
import com.sc.entity.SaleKhloss;
import com.sc.entity.SaleKhlossExample;
import com.sc.mapper.SaleKhinfoMapper;
import com.sc.mapper.SaleKhlossMapper;
import com.sc.service.SaleKhLossService;

@Service
public class SaleKhLossServiceImpl implements SaleKhLossService {
	
	@Autowired
	SaleKhlossMapper saleKhlossMapper;

	@Override
	public PageInfo<SaleKhloss> lossselect(Integer pageNum, Integer pageSize, SaleKhloss l) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		SaleKhlossExample example = new SaleKhlossExample();
		com.sc.entity.SaleKhlossExample.Criteria c = example.createCriteria();
		/*c.andUserIdEqualTo(l.getUserId());*/
		
		
		if(l!=null&&l.getUserId()!=null){
			List<SaleKhloss> list = this.saleKhlossMapper.selectByExample(example);
			PageInfo<SaleKhloss> pageInfo = new PageInfo<SaleKhloss>(list);
			if(list!=null&&list.size()>0){
				return pageInfo;
			}
		}else{
			List<SaleKhloss> list = saleKhlossMapper.selectByExample(null);
			PageInfo<SaleKhloss> pageInfo = new PageInfo<SaleKhloss>(list);
			return pageInfo;
		}
		
		return null;
	}

	@Override
	public void lossupdate(SaleKhloss l) {
		if(l!=null){
			this.saleKhlossMapper.insert(l);
		}
		
	}

	@Override
	public void lossdelete(Long lossid) {
		if(lossid!=null){
			this.saleKhlossMapper.deleteByPrimaryKey(lossid);
		}
	}
	
	@Autowired
	SaleKhinfoMapper saleKhinfoMapper;

	@Override
	public void losshuifu(SaleKhinfo s) {
		if(s!=null){
			this.saleKhinfoMapper.updateByPrimaryKey(s);
		}
		
	}

	@Override
	public SaleKhinfo idselect(Long id) {
		return this.saleKhinfoMapper.selectByPrimaryKey(id);
		
	}
	
	


}
