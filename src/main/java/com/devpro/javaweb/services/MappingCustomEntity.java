package com.devpro.javaweb.services;

import com.devpro.javaweb.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
