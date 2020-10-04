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
--1.1recommend
UPDATE TB_COMMUNITY
   SET COMMUNITY_RECOMMEND = COMMUNITY_RECOMMEND + 1
     , COMMUNITY_COUNT = COMMUNITY_COUNT - 1
 WHERE COMMUNITY_NO = 25;
--1.2recommend
INSERT
  INTO TB_COMMUNITY_RECOMMEND
  (
     COMMUNITY_NO
   , USER_NO
   )
   VALUES
   (
      ?
    , ?
    );
 
	SELECT 
		       COUNT(*)
		  FROM TB_COMMUNITY C
		 WHERE COMMUNITY_STATUS = 'Y'
		   AND COMMUNITY_HEAD IN ('명소','맛집');
           
SELECT *
			  FROM (
			    SELECT ROWNUM RNUM
			         , A.*
			    FROM (
			        SELECT 
			               COMMUNITY_NO
			             , COMMUNITY_TITLE
			             , COMMUNITY_CONTENT
			             , USER_NICK
			             , COMMUNITY_COUNT
			             , COMMUNITY_SCRAP
			             , COMMUNITY_RECOMMEND
			             , COMMUNITY_THUMB
			             , COMMUNITY_HEAD
			             , COMMUNITY_ENROLL
			          FROM TB_COMMUNITY C
			          JOIN TB_MEMBER USING(USER_NO)
			         WHERE COMMUNITY_STATUS = 'Y'
			           AND COMMUNITY_TITLE LIKE '%'||''||'%'			    
			           AND COMMUNITY_HEAD IN ('맛집', '명소')
			         ORDER 
			            BY COMMUNITY_COUNT DESC
			            ) A
			     )
			 WHERE RNUM BETWEEN 1 AND 10;
             
INSERT 
  INTO TB_COMMUNITY
  (  COMMUNITY_NO
   , ADMIN_ID
   , COMMUNITY_TITLE
   , COMMUNITY_CONTENT
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
    , SYSDATE
   );
 
 
 
 
  SELECT ROWNUM RNUM
       , A.*
    FROM(   
     SELECT
            COMMUNITY_NO
          , ADMIN_ID
          , COMMUNITY_TITLE
          , COMMUNITY_CONTENT
          , COMMUNITY_ENROLL
          , COMMUNITY_COUNT
          , COMMUNITY_HEAD
       FROM TB_COMMUNITY
       JOIN TB_ADMIN ON (USER_NO = ADMIN_NO)
      WHERE COMMUNITY_STATUS = 'Y'
        AND COMMUNITY_HEAD = '공지'
      ORDER
         BY COMMUNITY_NO DESC
        ) A;
        
INSERT
  INTO TB_COMMUNITY_COMMENT
  (
     COMMENT_NO
   , COMMENT_CONTENT
   , COMMUNITY_NO
   , USER_NICK
   , COMMENT_DATE
   )
   VALUES
   (
      SEQ_COMMUNITYCOMMENTNO.NEXTVAL
    , ?
    , ?
    , ?
    , SYSDATE
    );
SELECT
       COMMENT_NO
     , COMMENT_CONTENT
     , USER_NICK
     , PROFILEPIC_PATH
     , COMMENT_DATE
  FROM TB_COMMUNITY_COMMENT 
  JOIN TB_MEMBER USING(USER_NO)
 WHERE COMMUNITY_NO = ?
   AND COMMENT_STATUS = 'Y'
 ORDER BY COMMENT_NO DESC;
    