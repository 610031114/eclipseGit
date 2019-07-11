package com.linGuoLiang.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linGuoLiang.bean.Good;
import com.linGuoLiang.bean.Shop;
import com.linGuoLiang.service.ShopService;

@Controller
public class ShopController {

	@Resource
	ShopService shopService;
	
	@RequestMapping("list")
	public String getList(Model model,@RequestParam(defaultValue = "1")int cpage,
									  @RequestParam(defaultValue = "")String likename,
									  Integer [] gids) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("cpage", cpage);
		paramMap.put("likename", likename);
		paramMap.put("gids", gids);
		List<Integer> sidList = shopService.getSids(paramMap);
		PageHelper.startPage(cpage,3);
		List<Map<String,Object>> shop_list = shopService.getList(sidList);
		PageInfo<Map<String, Object>> page = new PageInfo<Map<String,Object>>(shop_list);
		List<Good> good_list = shopService.getGoodList();
		model.addAttribute("page",page);
		List<Integer> gidsList = new ArrayList<Integer>();
		if(gids!=null) {
			gidsList = Arrays.asList(gids);
		}
		paramMap.put("gidsList",gidsList);
		model.addAttribute("shop_list",shop_list);
		model.addAttribute("good_list",good_list);
		model.addAttribute("map",paramMap);
		return "list";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(Model model) {
		List<Good> good_list = shopService.getGoodList();
		model.addAttribute("good_list",good_list);
		return "add";
	}
	
	@RequestMapping("addShop")
	@ResponseBody
	public int addShop(Shop shop,int [] gids) {
		int result = shopService.addShop(shop,gids);
		return result;
	}
	
	@RequestMapping("deleteAll")
	@ResponseBody
	public int deleteAll(int [] sids) {
		int result = shopService.deleteAll(sids);
		return result;
	}
	
	@RequestMapping("toMessage")
	public String toMessage(Model model,int sid) {
		Shop shop = shopService.getShopById(sid);
		List<Good> good_list = shopService.getGoodList();
		List<Integer> gidList = shopService.getGidBySid(sid);
		model.addAttribute("shop",shop);
		model.addAttribute("good_list",good_list);
		model.addAttribute("gidList",gidList);
		return "message";
	}
	
}
