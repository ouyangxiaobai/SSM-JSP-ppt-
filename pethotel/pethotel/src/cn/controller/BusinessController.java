package cn.controller;

import cn.convertor.Constants;
import cn.dao.BusinessMapper;
import cn.entity.Business;
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
@RequestMapping("/business")
public class BusinessController {

    @Autowired
    private BusinessMapper businessMapper;

    //增加
    @RequestMapping("add")
    public String insertSelective(Business business) throws IOException {
        businessMapper.insertSelective(business);
        return "redirect:/business/getBusinessList?btype="+ URLEncoder.encode(business.getBtype(),"UTF-8");
    }

    //删除
    @RequestMapping("delete")
    public String deleteByPrimaryKey(Integer id) throws UnsupportedEncodingException {
        Business business= businessMapper.selectByPrimaryKey(id);
        businessMapper.deleteByPrimaryKey(id);
        return "redirect:/business/getBusinessList?btype="+ URLEncoder.encode(business.getBtype(),"UTF-8");
    }

    //修改
    @RequestMapping("update")
    public String updateByPrimaryKeySelective(Business business, HttpServletRequest request) throws UnsupportedEncodingException {
        businessMapper.updateByPrimaryKeySelective(business);
        return "redirect:/business/getBusinessList?btype="+ URLEncoder.encode(business.getBtype(),"UTF-8");
    }
    @RequestMapping("toupdate/{id}")
    @ResponseBody
    public Business toupdate(@PathVariable("id")Integer id){
        Business business= businessMapper.selectByPrimaryKey(id);
        return business;
    }

    //查询 全部、btype、btroom
    @RequestMapping("getBusinessList")
    public String getBusinessList(String btype,String btroom,Integer currentPageNo, Integer pageIndex, HttpServletRequest request){
        int pageSize = Constants.pageSize;
        if (pageIndex==null){
            currentPageNo = 1;
        }else{
            currentPageNo=pageIndex;
        }
        PageHelper.startPage(currentPageNo,pageSize);
        Map<String ,Object> parmas = new HashMap<String ,Object>();
        parmas.put("btype",btype);
        parmas.put("btroom",btroom);
        parmas.put("currentPageNo",currentPageNo);
        List<Business> list = businessMapper.getBusinessList(parmas);
        PageInfo<Business> pageInfo = new PageInfo<Business>(list);
        request.setAttribute("pageInfo", pageInfo);

        String userrole = (String) request.getSession().getAttribute("userrole");
        if (userrole.equals("会员")){
            if (btype.equals("宠舍类")){
                return "qiantai/shop_fj";
            } else if (btype.equals("服务类")){
                return "qiantai/shop_fw";
            } else if (btype.equals("主粮类")){
                return "qiantai/shop_zl";
            } else if (btype.equals("零食类")){
                return "qiantai/shop_ls";
            }
        } else {
            if (btype.equals("宠舍类")){
                return "purple/pages/samples/business_fj";
            } else if (btype.equals("服务类")){
                return "purple/pages/samples/business_fw";
            } else if (btype.equals("主粮类")){
                return "purple/pages/samples/business_zl";
            } else if (btype.equals("零食类")){
                return "purple/pages/samples/business_ls";
            }
        }
        return null;
    }

    //查询 Id
    @RequestMapping("getBusinessListById")
    public String selectByPrimaryKey(Integer id, String weizhi, HttpServletRequest request){
        Business business1= businessMapper.selectByPrimaryKey(id);
        List business = new ArrayList();
        business.add(business1);
        request.setAttribute("business", business);
        return "qiantai/"+weizhi;
    }

    //单文件上传
    @RequestMapping("upload")
    public String upload(Integer id, MultipartFile photo, HttpServletRequest request) throws IOException {
        Business business= businessMapper.selectByPrimaryKey(id);
        String bname = business.getBname();
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
            business.setBphoto(photoname);
            businessMapper.updateByPrimaryKeySelective(business);
        }
        return "redirect:/business/getBusinessList?btype="+ URLEncoder.encode(business.getBtype(),"UTF-8");
    }
}
