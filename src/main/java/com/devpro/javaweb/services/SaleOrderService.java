package com.devpro.javaweb.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

}
