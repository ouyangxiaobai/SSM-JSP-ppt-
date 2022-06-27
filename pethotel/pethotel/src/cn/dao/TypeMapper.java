package cn.dao;

import cn.entity.Type;

import java.util.List;
import java.util.Map;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

    public List<Type> getTypeRoomList(Map<String,Object> parmas);
    public List<Type> getTypeOrderList(Map<String,Object> parmas);
    public List<Type> getTypeBusinessList(Map<String,Object> parmas);
}