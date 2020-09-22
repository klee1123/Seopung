--1. insertMember(회원가입 요청시 실행해야될 sql문)
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
  