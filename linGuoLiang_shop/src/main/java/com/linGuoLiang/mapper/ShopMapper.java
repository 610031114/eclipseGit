package com.linGuoLiang.mapper;

import java.util.List;
import java.util.Map;

import com.linGuoLiang.bean.Good;
import com.linGuoLiang.bean.Shop;

public interface ShopMapper {

	List<Map<String, Object>> getList(List<Integer> sids);

	List<Good> getGoodList();

	int addShop(Shop shop);

	int addMiddle(Map<String, Object> map);

	int deleteAll(int[] sids);

	Shop getShopById(int sid);

	List<Integer> getGidBySid(int sid);

	List<Integer> getSids(Map<String, Object> paramMap);

	int deleteMiddle(int[] sids);

}
