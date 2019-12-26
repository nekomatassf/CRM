package com.sc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sc.entity.OffMessdeta;
import com.sc.entity.OffMessdetaExample;

public interface OffMessdetaMapper {
	
	public List<OffMessdeta> lajixiang(Long sid);
	
	//模糊查询收件箱
	public List<OffMessdeta> sousuod(@Param("reid")Long reid,@Param("starch")String starch);
	
	public OffMessdeta details(Long did);
	
	public List<OffMessdeta> detamess(Long sid);
	
    int countByExample(OffMessdetaExample example);

    int deleteByExample(OffMessdetaExample example);

    int deleteByPrimaryKey(Long detailsid);

    int insert(OffMessdeta record);

    int insertSelective(OffMessdeta record);

    List<OffMessdeta> selectByExample(OffMessdetaExample example);

    OffMessdeta selectByPrimaryKey(Long detailsid);

    int updateByExampleSelective(@Param("record") OffMessdeta record, @Param("example") OffMessdetaExample example);

    int updateByExample(@Param("record") OffMessdeta record, @Param("example") OffMessdetaExample example);

    int updateByPrimaryKeySelective(OffMessdeta record);

    int updateByPrimaryKey(OffMessdeta record);
}