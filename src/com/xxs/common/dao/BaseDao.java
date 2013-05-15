package com.xxs.common.dao;

import java.util.List;

public interface BaseDao {
	public List queryForList(String sid, Object param);
	public int deleteBatch(String sid, String ids[]);
	public Object queryForObject(String sid,Object param);
	public int add(String sid,Object param);
	public int update(String sid,Object param);
	public int delete(String sid,Object param);
}
