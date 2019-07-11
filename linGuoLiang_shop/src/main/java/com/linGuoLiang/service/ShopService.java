package com.linGuoLiang.service;

import java.util.List;
import java.util.Map;

import com.linGuoLiang.bean.Shop;


public interface ShopService {

	List<Map<String, Object>> getList(List<Integer> sidList);

	List<com.linGuoLiang.bean.Good> getGoodList();

	int addShop(Shop shop, int[] gids);

	int deleteAll(int[] sids);

	Shop getShopById(int sid);

	List<Integer> getGidBySid(int sid);

	List<Integer> getSids(Map<String, Object> paramMap);


}
