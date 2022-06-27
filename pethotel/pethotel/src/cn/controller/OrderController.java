package cn.controller;

import cn.convertor.Constants;
import cn.dao.BusinessMapper;
import cn.dao.OrderMapper;
import cn.entity.Business;
import cn.entity.Order;
import cn.entity.User;
import cn.util.Const;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private BusinessMapper businessMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(Order order, HttpSession session){
        User user = (User) session.getAttribute("userSession");
        String otype = order.getOtype();

        if (!otype.equals("服务类")){
            Integer bid = Integer.valueOf(order.getObid());
            Business b1 = businessMapper.selectByPrimaryKey(bid);
            Integer num1 = Integer.valueOf(b1.getBsize());
            Integer num2 = num1 - 1;
            b1.setBsize(String.valueOf(num2));
            businessMapper.updateByPrimaryKey(b1);
        }

        if (otype.equals("主粮类")|| otype.equals("零食类")){
            order.setOstate("未发货");
            if (!order.getOnote().equals("")){
                order.setOnote("地址："+user.getUaddress()+"；备注："+order.getOnote());
            } else {
                order.setOnote("地址："+user.getUaddress());
            }

        } else if (otype.equals("服务类") || otype.equals("宠舍类") ){
            order.setOstate("未完成");
        }
        order.setOctime(Const.getCurrentTime());
        orderMapper.insertSelective(order);

        String userrole = user.getUrole();
        if (userrole.equals("会员")){
            return "redirect:/order/getOrderOuidList?ouid="+user.getId();
        } else if (userrole.equals("管理员")){
            return "redirect:/order/getOrderOuidList";
        }
        return null;
    }

    //删除
    @RequestMapping("deleted")
    public String deleteByPrimaryKey(Integer id){
        orderMapper.deleteByPrimaryKey(id);
        return "redirect:/order/getOrderOuidList";
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(Order order, HttpSession session){
        order.setOftime(Const.getCurrentTime());
        orderMapper.updateByPrimaryKeySelective(order);
        return "redirect:/order/getOrderOuidList";
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public Order toupdate(@PathVariable("id")Integer id){
        Order order =orderMapper.selectByPrimaryKey(id);
        return order;
    }
    //发货 & 完成
    @RequestMapping("doupdate")
    public String doupdate(Integer id, String onote){
        Order order =orderMapper.selectByPrimaryKey(id);
        order.setOftime(Const.getCurrentTime());
        String ostate = order.getOstate();
        if (ostate.equals("未发货")){
            order.setOstate("已发货");
        } else if (ostate.equals("未完成")){
            order.setOstate("已完成");
        }
        if (onote!=null && !onote.isEmpty()){
            order.setOnote(onote);
        }
        orderMapper.updateByPrimaryKeySelective(order);
        return "redirect:/order/getOrderOuidList";
    }


    
    //查询 全部 或者根据ouid 或者根据otype
    @RequestMapping("getOrderOuidList")
    public String getOrderOuidList(String ouid,String otype,Integer currentPageNo, Integer pageIndex, HttpServletRequest request, HttpSession session){
        String userrole = (String) request.getSession().getAttribute("userrole");
        int pageSize = 0;
        if (userrole.equals("管理员")){
            pageSize = Constants.pageSize;
        }
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }

        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("ouid",ouid);
        parmas.put("otype",otype);
        parmas.put("currentPageNo",currentPageNo);
        List<Order> list = orderMapper.getOrderOuidList(parmas);
        PageInfo<Order> pageInfo = new PageInfo<Order>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("qiantaiorder", list);
        if (userrole.equals("会员")){
            return "qiantai/user_order";
        } else if (userrole.equals("管理员")){
            return "purple/pages/samples/order";
        }
        return null;
    }

    //查询 Id
    @RequestMapping("getOrderOuidListById")
    public String selectByPrimaryKey(Integer id){
        Order order =orderMapper.selectByPrimaryKey(id);
        return "";
    }
}
