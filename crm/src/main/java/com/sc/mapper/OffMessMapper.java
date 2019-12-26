package com.sc.mapper;

import com.sc.entity.OffMess;
import com.sc.entity.OffMessExample;
import com.sc.entity.OffMessdeta;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OffMessMapper {
	
	
	public List<OffMess> sousuo(@Param("sender")String sender,@Param("starch")String starch);
	
	
	public void write(OffMess m);
	
	public List<OffMess> messdeta(String ser);
	
	public List<OffMess> mdetail(Long mid);
	
    int countByExample(OffMessExample example);

    int deleteByExample(OffMessExample example);

    int deleteByPrimaryKey(Long messid);

    int insert(OffMess record);

    int insertSelective(OffMess record);

    List<OffMess> selectByExample(OffMessExample example);

    OffMess selectByPrimaryKey(Long messid);

    int updateByExampleSelective(@Param("record") OffMess record, @Param("example") OffMessExample example);

    int updateByExample(@Param("record") OffMess record, @Param("example") OffMessExample example);

    int updateByPrimaryKeySelective(OffMess record);

    int updateByPrimaryKey(OffMess record);
}