package cn.dao;

import cn.entity.Business;

import java.util.List;
import java.util.Map;

public interface BusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);

    public List<Business> getBusinessList(Map<String,Object> parmas);
}