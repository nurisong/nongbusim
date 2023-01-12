package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.kh.nbs.account.model.vo.Account;

public interface AccountService {


	ArrayList selectCatAndGoods(int memNo);

	ArrayList<Account> selectAccountList(Account account);
	
}
