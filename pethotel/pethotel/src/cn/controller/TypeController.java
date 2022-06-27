package cn.controller;

import cn.convertor.Constants;
import cn.dao.TypeMapper;
import cn.entity.Type;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/type")
public class TypeController {

    @Autowired
    private TypeMapper typeMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(Type type){
        typeMapper.insertSelective(type);
        return "redirect:/type/getTypeList";
    }

    //删除
    @RequestMapping("delete/{id}")
    public String deleteByPrimaryKey(@PathVariable("id") Integer id){
        typeMapper.deleteByPrimaryKey(id);
        return "redirect:/type/getTypeList";
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(Type type){
        typeMapper.updateByPrimaryKeySelective(type);
        return "redirect:/type/getTypeList";
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public Type toupdate(@PathVariable("id")Integer id){
        Type type =typeMapper.selectByPrimaryKey(id);
        return type;
    }

    //查询 宠舍类别
    @RequestMapping("getTypeRoomList")
    public String getTypeRoomList(String troom,Integer currentPageNo, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (currentPageNo==null){
            currentPageNo = 1;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("troom",troom);
        parmas.put("currentPageNo",currentPageNo);
        List<Type> list = typeMapper.getTypeRoomList(parmas);
        PageInfo<Type> pageInfo = new PageInfo<Type>(list);
        request.setAttribute("pageInfo", pageInfo);
        return "purple/pages/samples/type_room";
    }

    //查询 订单类别
    @RequestMapping("getTypeOrderList")
    public String getTypeOrderList(String torder,Integer currentPageNo, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (currentPageNo==null){
            currentPageNo = 1;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("torder",torder);
        parmas.put("currentPageNo",currentPageNo);
        List<Type> list = typeMapper.getTypeOrderList(parmas);
        PageInfo<Type> pageInfo = new PageInfo<Type>(list);
        request.setAttribute("pageInfo", pageInfo);
        return "purple/pages/samples/type_order";
    }

    //查询 业务类别
    @RequestMapping("getTypeBusinessList")
    public String getTypeBusinessList(String tbusiness,Integer currentPageNo, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (currentPageNo==null){
            currentPageNo = 1;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("tbusiness",tbusiness);
        parmas.put("currentPageNo",currentPageNo);
        List<Type> list = typeMapper.getTypeBusinessList(parmas);
        PageInfo<Type> pageInfo = new PageInfo<Type>(list);
        request.setAttribute("pageInfo", pageInfo);
        return "purple/pages/samples/type_business";
    }

    //查询 Id
    @RequestMapping("getTypeListById")
    public String selectByPrimaryKey(Integer id){
        Type type =typeMapper.selectByPrimaryKey(id);
        return "";
    }
}
