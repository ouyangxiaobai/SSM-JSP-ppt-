package cn.controller;

import cn.convertor.Constants;
import cn.dao.MessageMapper;
import cn.entity.Message;
import cn.entity.News;
import cn.entity.User;
import cn.util.Const;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageMapper messageMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(Message message, HttpSession session){
        message.setMutime(Const.getCurrentTime());
        message.setMstate("询问");
        messageMapper.insertSelective(message);
        String userrole = (String) session.getAttribute("userrole");
        User user = (User) session.getAttribute("userSession");
        if (userrole.equals("会员")){
            return "redirect:/order/getOrderOuidList?ouid="+user.getId();
        } else {
            return "redirect:/message/getMessageList";
        }
    }

    //删除
    @RequestMapping("delete")
    public String deleteByPrimaryKey(Integer id, HttpSession session){
        messageMapper.deleteByPrimaryKey(id);
        String userrole = (String) session.getAttribute("userrole");
        return "redirect:/message/getMessageList";
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(Message message, HttpSession session){
        String userrole = (String) session.getAttribute("userrole");
        if (userrole.equals("会员")){
            message.setMutime(Const.getCurrentTime());
        } else {
            message.setMstate("回复");
            message.setMatime(Const.getCurrentTime());
        }
        messageMapper.updateByPrimaryKeySelective(message);
        return "redirect:/message/getMessageList";
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public Message toupdate(@PathVariable("id")Integer id){
        Message message = messageMapper.selectByPrimaryKey(id);
        return message;
    }

    //查询 全部、muid、mstate
    @RequestMapping("getMessageList")
    public String getMessageList(String muid,String mstate,Integer currentPageNo, Integer pageIndex, HttpServletRequest request){
        String userrole = (String) request.getSession().getAttribute("userrole");
        int pageSize = Constants.pageSize;
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        if (userrole.equals("会员")){
            User user = (User) request.getSession().getAttribute("userSession");
            muid =  user.getId().toString();
        }
        parmas.put("muid",muid);
        parmas.put("mstate",mstate);
        parmas.put("currentPageNo",currentPageNo);
        List<Message> list = messageMapper.getMessageList(parmas);
        PageInfo<Message> pageInfo = new PageInfo<Message>(list);
        request.setAttribute("pageInfo", pageInfo);

        if (userrole.equals("会员")){
            return "purple/pages/samples/message";
        } else {
            return "purple/pages/samples/message";
        }
    }

    //查询 Id
    @RequestMapping("getIndexMessageList")
    public void getMessageJsonList(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("id",id);
        List<Message> list = messageMapper.getMessageList(parmas);
        PrintWriter out = response.getWriter();
        out.print(JSONArray.toJSONString(list));
        out.close();
    }
}
