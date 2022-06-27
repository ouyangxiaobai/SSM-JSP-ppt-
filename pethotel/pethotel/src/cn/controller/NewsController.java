package cn.controller;

import cn.convertor.Constants;
import cn.dao.NewsMapper;
import cn.entity.News;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsMapper newsMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(News news){
        news.setNtime(Const.getCurrentDay());
        newsMapper.insertSelective(news);
        return "redirect:/news/getNewsList";
    }

    //删除
    @RequestMapping("delete")
    public String deleteByPrimaryKey(Integer id){
        newsMapper.deleteByPrimaryKey(id);
        return "redirect:/news/getNewsList";
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(News news){
        news.setNtime(Const.getCurrentDay());
        newsMapper.updateByPrimaryKeySelective(news);
        return "redirect:/news/getNewsList";
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public News toupdate(@PathVariable("id")Integer id){
        News news = newsMapper.selectByPrimaryKey(id);
        return news;
    }

    //查询 集合
    @RequestMapping("getNewsList")
    public String getNewsList(String id,Integer currentPageNo, Integer pageIndex, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("id",id);
        parmas.put("currentPageNo",currentPageNo);
        List<News> list = newsMapper.getNewsList(parmas);
        PageInfo<News> pageInfo = new PageInfo<News>(list);
        request.setAttribute("pageInfo", pageInfo);
        String userrole= (String) request.getSession().getAttribute("userrole");
        if (userrole.equals("会员")){
            return null;
        } else {
            return "purple/pages/samples/news";
        }
    }

    //查询 Id
    @RequestMapping("getNewsListById")
    public String selectByPrimaryKey(Integer id){
        News news = newsMapper.selectByPrimaryKey(id);
        return "";
    }

    //查询
    @RequestMapping("getIndexNewsList")
    public void getNewsList(Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("id",id);
        List<News> list = newsMapper.getNewsList(parmas);
        PrintWriter out = response.getWriter();
        out.print(JSONArray.toJSONString(list));
        out.close();
    }
}
