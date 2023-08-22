package com.devpro.javaweb.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb.model.Categories;

@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {

		return Categories.class;
	}

}
