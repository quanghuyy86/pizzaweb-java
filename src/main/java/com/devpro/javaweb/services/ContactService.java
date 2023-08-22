package com.devpro.javaweb.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb.model.Contact;

@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}

}
