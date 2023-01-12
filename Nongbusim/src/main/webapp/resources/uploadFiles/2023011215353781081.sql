INSERT
		  INTO
				FARM
				(
				FARM_NO
			   ,FARMER
			   ,FARM_NAME
			   ,FARM_INTRO
			   ,ADDRESS
			   ,PHONE
			   ,CROP
				)
		VALUES
				(
				SEQ_FNO.NEXTVAL
			   ,2
			   ,'테스트'
			   ,'테스트'
			   ,'테스트'
			   ,'테스트'
			   ,'테스트'
				);
                
                commit;
                
                	INSERT
		  INTO
		  		ATTACHMENT
		  		VALUES
		  		(
		  		SEQ_ANO.NEXTVAL
		  	   ,''
		  	   ,''
		  	   ,null
		  	   ,SYSDATE
		  	   ,SEQ_FNO.CURRVAL
		  	   ,''
		  		);
                
                
                
                
                
                
                	INSERT
		  INTO
		  		ATTACHMENT
		  		(
		  		file_no,
		  		origin_name,
		  		change_name,
		  		board_type,
		  		board_no
		  		)
		VALUES
		  		(
		  		SEQ_ANO.NEXTVAL
		  	   ,'abvc'
		  	   ,'abvc'
		  	   ,'F'
		  	   ,1)

                
                ;
                rollback;
                
                SELECT
				COUNT(*)
		  FROM
		  		FARM
		 WHERE
		 		STATUS = 'Y';
                
                ALTER TABLE MEMBER ADD CAREER VARCHAR2(300);
ALTER TABLE MEMBER DROP COLUMN FARMER_CODE;
ALTER TABLE MEMBER ADD FARMER_CODE VARCHAR2(300);

ALTER TABLE MEMBER ADD MODIFY_DATE DATE;
                
INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, NAME, NICKNAME, PHONE, GENDER, EMAIL, ENROLL_DATE, MEM_STATUS)
VALUES(2, 'user01', '$2a$10$IjWcr5f3qRWw7l.nNpnfBe2H8zQV9A6rxmUTsd.jRfQlicUibsEDa', '유저01', 'ㅇㅇ', '010-1111-1111', 'F', 'user01@email.com', SYSDATE, 'Y');

INSERT INTO MEMBER(MEM_NO, MEM_ID, MEM_PWD, NAME, NICKNAME, PHONE, GENDER, ENROLL_DATE, MEM_STATUS)
VALUES(7, 'farmer01', '$2a$10$g0ROzbZhrhj28kZKXIwUeeZTHtg28RHzAXtuEAMKnG.OkBOsKCuCq', '농부01', '농부신', '010-1111-2222', 'F', SYSDATE, 'Y');
                
                
                commit;
                
                
                SELECT
				FILE_NO
			   ,ORIGIN_NAME
			   ,CHANGE_NAME
			   ,UPLOAD_DATE
			   ,BOARD_NO
			   ,BOARD_TYPE
		 FROM
				ATTACHMENT
		WHERE
				BOARD_NO = 4
		  AND
				BOARD_TYPE = 'Farm'
		ORDER
		   BY
				FILE_NO;
                