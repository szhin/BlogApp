package com.blog.dao;

import java.util.List;

public interface IDAO<T> {

	 void insert(T t);
	 void update(T t);
	 void delete(T t);
	 T get(int id);
	 List<T> getAll();
	 
}
