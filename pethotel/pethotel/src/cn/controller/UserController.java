package cn.controller;

import cn.convertor.Constants;
import cn.dao.UserMapper;
import cn.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(User user, HttpSession session) throws UnsupportedEncodingException {
        userMapper.insertSelective(user);
        String userrole = (String)session.getAttribute("userrole");
        if (userrole!=null && !userrole.isEmpty()){
            if(user.getUrole().equals("会员")){
                return "redirect:/user/getUserList?role="+ URLEncoder.encode("会员","UTF-8");
            } else if (user.getUrole().equals("管理员")){
                return "redirect:/user/getUserList?role="+URLEncoder.encode("管理员","UTF-8");
            }
        } else {
            return "qiantai/index";
        }
        return null;
    }

    //删除
    @RequestMapping("delete")
    public String deleteByPrimaryKey(Integer id, HttpSession session) throws UnsupportedEncodingException {
        User user =userMapper.selectByPrimaryKey(id);
        String urole = user.getUrole();
        userMapper.deleteByPrimaryKey(id);
        return "redirect:/user/getUserList?role="+URLEncoder.encode(urole,"UTF-8");
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(User user, HttpSession session) throws UnsupportedEncodingException {
        userMapper.updateByPrimaryKeySelective(user);
        String userrole = (String)session.getAttribute("userrole");
        if (userrole.equals("会员")){
            session.setAttribute("userSession",user);
            return "redirect:/order/getOrderOuidList?ouid="+user.getId();
        } else if (userrole.equals("管理员")){
            if (user.getUrole().equals("会员")){
                return "redirect:/user/getUserList?role="+URLEncoder.encode("会员","UTF-8");
            } else if (user.getUrole().equals("管理员")){
                User user1 = (User) session.getAttribute("userSession");
                if (user1.getId() == user.getId()){
                    session.setAttribute("userSession",user);
                }
                return "redirect:/user/getUserList?role="+URLEncoder.encode("管理员","UTF-8");
            }
        }
        return null;
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public User toupdate(@PathVariable("id")Integer id){
        User user =userMapper.selectByPrimaryKey(id);
        return user;
    }

    //登录
    @RequestMapping("login")
    public String login(String username, String userpassword, String urole, HttpSession session, Model model, HttpServletResponse response) throws UnsupportedEncodingException {

        User user =userMapper.login(username,userpassword);
        if (user==null || !user.getUrole().equals(urole)){
            model.addAttribute("msg",user);
            return "purple/pages/samples/error-500";
        } else {
            String userrole = user.getUrole();
            session.setAttribute("userrole",userrole);
            session.setAttribute("userSession",user);
            if (userrole.equals("会员")){
                return "qiantai/index";
            } else if (userrole.equals("管理员")){
                return "redirect:/user/getUserList?role="+URLEncoder.encode("管理员","utf-8");
            }
            return null;
        }
    }

    //退出
    @RequestMapping("logout")
    public String logout(HttpSession session){
        String userrole = (String) session.getAttribute("userrole");
        session.removeAttribute("userrole");
        session.removeAttribute("userSession");
        session.invalidate();
        if (userrole.equals("会员")){
            return "qiantai/index";
        } else {
            return "purple/pages/login";
        }
    }

    //查询 集合
    @RequestMapping("getUserList")
    public String getUserList(String username,String role,Integer currentPageNo, Integer pageIndex, HttpServletRequest request) throws UnsupportedEncodingException {
        if (role!=null){
            role = java.net.URLDecoder.decode(role,"UTF-8");
        }
        int pageSize = Constants.pageSize;
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("username",username);
        parmas.put("urole",role);
        parmas.put("currentPageNo",currentPageNo);
        List<User> list = userMapper.getUserList(parmas);
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        request.setAttribute("pageInfo", pageInfo);
        if(role!=null){
            if (role.equals("会员")){
                return "purple/pages/samples/user_vip";
            } else if (role.equals("管理员")){
                return "purple/pages/samples/user_adm";
            }
        } else {
            return "purple/pages/samples/user";
        }
        return null;
    }

    //查询 Id
    @RequestMapping("getUserById")
    public String selectByPrimaryKey(Integer id, HttpSession session){
        User user =userMapper.selectByPrimaryKey(id);
        return "";
    } //单文件上传
    @RequestMapping("upload")
    public String upload(Integer id, MultipartFile photo, HttpServletRequest request, HttpSession session) throws IOException {
        String urole = (String) session.getAttribute("userrole");
        User user= userMapper.selectByPrimaryKey(id);
        String photoname = photo.getOriginalFilename();
        //文件上传
        //传到服务器
        if (!photo.isEmpty()){
            //传到真实路径
            String path = request.getServletContext().getRealPath("/upload");
            //目标文件
            String fileName = path+"/"+photoname;
            photo.transferTo(new File(fileName));
            request.setAttribute("fileName","/upload/"+photoname);
            user.setUphoto(photoname);
            userMapper.updateByPrimaryKeySelective(user);
            if (urole.equals("会员")){
                session.setAttribute("userSession",user);
            }
        }
        if (urole.equals("管理员")){
            return "redirect:/user/getUserList?role="+URLEncoder.encode("会员","UTF-8");
        }else{
            return "redirect:/order/getOrderOuidList?ouid="+id;
        }
    }
}
