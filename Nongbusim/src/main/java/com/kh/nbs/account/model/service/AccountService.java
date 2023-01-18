package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.diary.model.vo.Diary;

public interface AccountService {


	ArrayList selectCatAndGoods(int memNo);

	ArrayList<Account> selectAccountList(Account account);

	int insertAccount(Account account);

	int insertAttachment(Attachment at);

	Account selectAccount(int accountNo);

	ArrayList<Attachment> selectAttachmentList(int accountNo);

	int updateAccount(Account diary);

	int updateAttachment(Attachment at);

	int deleteAccount(int accountNo);

	int deleteAttachment(int account);

	ArrayList seletCalEvent(int memNo);

	ArrayList monthlySummary(int memNo);
	
}
