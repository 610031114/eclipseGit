package com.linGuoLiang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.linGuoLiang.bean.Good;
import com.linGuoLiang.bean.Shop;
import com.linGuoLiang.mapper.ShopMapper;

@Service
public class ShopServiceImpl implements ShopService{

	@Resource
	ShopMapper shopMapper;

	@Override
	public List<Map<String, Object>> getList(List<Integer> sidList) {
		// TODO Auto-generated method stub
		return shopMapper.getList(sidList);
	}

	@Override
	public List<Good> getGoodList() {
		// TODO Auto-generated method stub
		return shopMapper.getGoodList();
	}

	@Override
	@Transactional
	public int addShop(Shop shop, int[] gids) {
		int result = shopMapper.addShop(shop);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("sid", shop.getSid());
		map.put("gids",gids);
		result = shopMapper.addMiddle(map);
		return result;
	}

	@Override
	public int deleteAll(int[] sids) {
		// TODO Auto-generated method stub
		int result = shopMapper.deleteAll(sids);
		result = shopMapper.deleteMiddle(sids);
		return result;
		}

	@Override
	public Shop getShopById(int sid) {
		// TODO Auto-generated method stub
		return shopMapper.getShopById(sid);
	}

	@Override
	public List<Integer> getGidBySid(int sid) {
		// TODO Auto-generated method stub
		return shopMapper.getGidBySid(sid);
	}

	@Override
	public List<Integer> getSids(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return shopMapper.getSids(paramMap);
	}
	
	
}
