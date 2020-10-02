--listCount
SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
 WHERE COMMUNITY_STATUS = 'Y';


-- �Ӹ��� ��ü
SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
  JOIN TB_ADMIN ON(ADMIN_NO = USER_NO)
 WHERE COMMUNITY_STATUS = 'Y'
   AND COMMUNITY_HEAD = '���'
    OR COMMUNITY_HEAD = '����';
-- �Ӹ��� ����

SELECT 
       COUNT(*)
  FROM TB_COMMUNITY C
  JOIN TB_ADMIN ON(ADMIN_NO = USER_NO)
 WHERE COMMUNITY_STATUS = 'Y'
   AND COMMUNITY_HEAD = '����';
  
-- �Խù� ��ȸ
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
           AND COMMUNITY_HEAD = '����'
            OR COMMUNITY_HEAD = '���'
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
 

  