package cn.controller;

import cn.convertor.Constants;
import cn.dao.BusinessMapper;
import cn.dao.CommentMapper;
import cn.entity.Business;
import cn.entity.Comment;
import cn.entity.User;
import cn.util.Const;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private BusinessMapper businessMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(Comment comment, HttpServletRequest request) throws IOException {
        User user = (User) request.getSession().getAttribute("userSession");
        comment.setCuid(String.valueOf(user.getId()));
        comment.setCuname(user.getUname());
        businessMapper.selectByPrimaryKey(Integer.valueOf(comment.getCbid()));
        Business b1 = (Business) businessMapper.selectByPrimaryKey(Integer.valueOf(comment.getCbid()));
        comment.setCbphoto(b1.getBphoto());
        comment.setCbname(b1.getBname());

        comment.setCtime(Const.getCurrentTime());
        commentMapper.insertSelective(comment);
        return "redirect:/order/getOrderOuidList?ouid="+ URLEncoder.encode(String.valueOf(user.getId()),"UTF-8");
    }

    //删除
    @RequestMapping("delete")
    public String deleteByPrimaryKey(Integer id) throws UnsupportedEncodingException {
        Comment comment= commentMapper.selectByPrimaryKey(id);
        commentMapper.deleteByPrimaryKey(id);
        return "purple/pages/samples/pinglun";
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(Comment comment, HttpServletRequest request) throws UnsupportedEncodingException {
        commentMapper.updateByPrimaryKeySelective(comment);
        return "redirect:/comment/getCommentList?cuid="+ URLEncoder.encode(comment.getCuid(),"UTF-8");
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public Comment toupdate(@PathVariable("id")Integer id){
        Comment comment= commentMapper.selectByPrimaryKey(id);
        return comment;
    }

    //查询 全部、comment、cbid
    @RequestMapping("getCommentList")
    public String getCommentList(String cuid,String cbid,Integer currentPageNo, Integer pageIndex, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("cuid",cuid);
        parmas.put("cbid",cbid);
        parmas.put("currentPageNo",currentPageNo);
        List<Comment> list = commentMapper.getCommentList(parmas);
        PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
        request.setAttribute("pageInfo", pageInfo);

        String userrole = (String) request.getSession().getAttribute("userrole");
        if(userrole==null){
            return "qiantai/blog";
        }
        if (userrole.equals("会员")){
            return "qiantai/blog";
        } else {
            return "purple/pages/samples/pinglun";
        }
    }

    //查询 Id
    @RequestMapping("getCommentListById")
    public String selectByPrimaryKey(Integer id, String weizhi, HttpServletRequest request){
        Comment comment1= commentMapper.selectByPrimaryKey(id);
        List comment = new ArrayList();
        comment.add(comment1);
        request.setAttribute("comment", comment);
        return "qiantai/"+weizhi;
    }
}
