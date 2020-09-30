--listCount
SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
 WHERE COMMUNITY_STATUS = 'Y';


-- 머리말 전체
SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
  JOIN TB_ADMIN ON(ADMIN_NO = USER_NO)
 WHERE COMMUNITY_STATUS = 'Y'
   AND COMMUNITY_HEAD = '명소'
    OR COMMUNITY_HEAD = '맛집';
-- 머리말 공지

SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
  JOIN TB_ADMIN ON(ADMIN_NO = USER_NO)
 WHERE COMMUNITY_STATUS = 'Y'
   AND COMMUNITY_HEAD = '공지';
  
-- 게시물 조회
SELECT *
  FROM (
    SELECT ROWNUM RNUM
         , A.*
    FROM (
        SELECT 
               COMMUNITY_NO
             , COMMUNITY_TITLE
             , COMMUNITY_CONTENT
             , USER_ID
             , COMMUNITY_COUNT
             , COMMUNITY_SCRAP
             , COMMUNITY_RECOMMEND
             , COMMUNITY_THUMB
             , COMMUNITY_HEAD
             , COMMUNITY_ENROLL
          FROM TB_COMMUNITY C
          JOIN TB_MEMBER USING(USER_NO)
         WHERE COMMUNITY_STATUS = 'Y'
           AND COMMUNITY_HEAD = '맛집'
            OR COMMUNITY_HEAD = '명소'
         ORDER 
            BY COMMUNITY_NO DESC
            ) A
    )
    WHERE RNUM BETWEEN 1 AND 10;
    
--community insert

INSERT
  INTO TB_COMMUNITY
  (
     COMMUNITY_NO
   , USER_NO
   , COMMUNITY_TITLE
   , COMMUNITY_CONTENT
   , COMMUNITY_THUMB
   , COMMUNITY_HEAD
   , COMMUNITY_ENROLL
   )
   VALUES
   (
      SEQ_UNO.NEXTVAL
    , ?
    , ?
    , ?
    , ?
    , ?
    , SYSDATE
    );
   SELECT SYSDATE FROM dual;
    
   DELETE 
     FROM TB_COMMUNITY 
    WHERE COMMUNITY_NO = 7;
  