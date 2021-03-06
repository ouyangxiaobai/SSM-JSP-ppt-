package cn.dao;

import cn.entity.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    public List<Order> getOrderList(Map<String,Object> parmas);

    public List<Order> getOrderOuidList(Map<String,Object> parmas);
}