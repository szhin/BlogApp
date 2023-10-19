package com.blog.dao;

import java.util.List;

// Data Access Object (DAO) Pattern
public interface IDAO<O> {
	
	 void insert(O o);
	 void update(O o);
	 boolean delete(int id);
	 O get(int id);
	 List<O> getAll();
	 
}
