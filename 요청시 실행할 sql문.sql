--1. insertMember(ȸ������ ��û�� �����ؾߵ� sql��)
INSERT 
  INTO TB_MEMBER 
  (
        USER_NO
      , USER_ID
      , USER_PWD
      , USER_NAME
      , USER_NICK
      , USER_BIRTH
      , GENDER
      , EMAIL
      ) 
      VALUES
      ( 
        SEQ_UNO.NEXTVAL
       , ?
       , ?
       , ?
       , ?
       , ?
       , ?
       , ?
      );
      
SELECT 
       USER_NO
     , USER_ID
     , USER_PWD
     , USER_NAME
     , USER_NICK
     , USER_BIRTH
     , GENDER
     , EMAIL
     , ENROLL_DATE
     , MODIFY_DATE
     , STATUS
  FROM MEMBER
 WHERE STATUS='Y'
   AND USER_ID=?
   AND USER_PWD=?;
  