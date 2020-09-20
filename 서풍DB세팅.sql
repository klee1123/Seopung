﻿DROP TABLE "TB_COMMUNITY";

CREATE TABLE "TB_COMMUNITY" (
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"COMMUNITY_TITLE"	VARCHAR2(100)		NOT NULL,
	"COMMUNITY_CONTENT"	CLOB		NOT NULL,
	"COMMUNITY_ENROLL"	DATE	DEFAULT SYSDATE	NULL,
	"COMMUNITY_MODIFY"	DATE	DEFAULT SYSDATE	NULL,
	"COMMUNITY_COUNT"	NUMBER	DEFAULT 0	NULL,
	"COMMUNITY_SCRAP"	NUMBER	DEFAULT 0	NULL,
	"COMMUNITY_RECOMMEND"	NUMBER	DEFAULT 0	NULL,
	"COMMUNITY_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"COMMUNITY_THUMB"	VARCHAR2(100)		NULL,
	"COMMUNITY_HEAD"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_NO" IS '글번호';

COMMENT ON COLUMN "TB_COMMUNITY"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_TITLE" IS '커뮤니티제목';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_CONTENT" IS '커뮤니티내용';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_ENROLL" IS '커뮤니티등록일';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_MODIFY" IS '커뮤니티수정일';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_COUNT" IS '커뮤니티조회수';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_SCRAP" IS '커뮤니티스크랩수';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_RECOMMEND" IS '추천수';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_STATUS" IS '상태값(Y/N)';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_THUMB" IS '썸네일 파일';

COMMENT ON COLUMN "TB_COMMUNITY"."COMMUNITY_HEAD" IS '말머리 유형(공지/명소/맛집)';

DROP TABLE "TB_MEMBER";

CREATE TABLE "TB_MEMBER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL,
	"USER_PWD"	VARCHAR2(30)		NOT NULL,
	"USER_NAME"	VARCHAR2(20)		NOT NULL,
	"USER_NICK"	VARCHAR2(50)		NOT NULL,
	"USER_BIRTH"	VARCHAR2(20)		NOT NULL,
	"GENDER"	VARCHAR2(1)		NOT NULL,
	"PHONE"	VARCHAR2(20)		NOT NULL,
	"EMAIL"	VARCHAR2(30)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_INTRO"	VARCHAR2(4000)		NULL,
	"PROFILEPIC_PATH"	VARCHAR2(100)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TB_MEMBER"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_MEMBER"."USER_ID" IS '회원아이디';

COMMENT ON COLUMN "TB_MEMBER"."USER_PWD" IS '회원비밀번호';

COMMENT ON COLUMN "TB_MEMBER"."USER_NAME" IS '회원이름';

COMMENT ON COLUMN "TB_MEMBER"."USER_NICK" IS '닉네임';

COMMENT ON COLUMN "TB_MEMBER"."USER_BIRTH" IS '생년월일';

COMMENT ON COLUMN "TB_MEMBER"."GENDER" IS '성별';

COMMENT ON COLUMN "TB_MEMBER"."PHONE" IS '휴대폰';

COMMENT ON COLUMN "TB_MEMBER"."EMAIL" IS '이메일';

COMMENT ON COLUMN "TB_MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "TB_MEMBER"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TB_MEMBER"."USER_INTRO" IS '자기소개';

COMMENT ON COLUMN "TB_MEMBER"."PROFILEPIC_PATH" IS '프사파일경로';

COMMENT ON COLUMN "TB_MEMBER"."STATUS" IS '기본 Y, 탈퇴 N, 블랙 B';

DROP TABLE "TB_COMMUNITY_COMMENT";

CREATE TABLE "TB_COMMUNITY_COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"COMMENT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COMMENT_MODIFY"	DATE	DEFAULT SYSDATE	NULL,
	"COMMENT_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."COMMUNITY_NO" IS '글번호';

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."COMMENT_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."COMMENT_DATE" IS '작성일';

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."COMMENT_MODIFY" IS '수정일';

COMMENT ON COLUMN "TB_COMMUNITY_COMMENT"."COMMENT_STATUS" IS '상태값(Y/N)';

DROP TABLE "TB_RECOMMEND";

CREATE TABLE "TB_RECOMMEND" (
	"RECOMMEND_NO"	NUMBER		NOT NULL,
	"RECOMMEND_TITLE"	VARCHAR2(40)		NOT NULL,
	"RECOMMEND_CONTENT"	CLOB		NOT NULL,
	"RECOMMEND_ENROLL"	DATE	DEFAULT SYSDATE	NULL,
	"RECOMMEND_MODIFY"	DATE	DEFAULT SYSDATE	NULL,
	"RECOMMEND_COUNT"	NUMBER	DEFAULT 0	NULL,
	"RECOMMEND_LIKE"	NUMBER	DEFAULT 0	NULL,
	"RECOMMENT_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"RECOMMEND_THUMB"	VARCHAR2(1000)		NULL,
	"ADMIN_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_NO" IS '추천코스 글번호';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_TITLE" IS '추천코스 제목';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_CONTENT" IS '추천코스 내용';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_ENROLL" IS '추천코스 작성일';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_MODIFY" IS '추천코스 수정일';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_COUNT" IS '추천코스 조회수';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_LIKE" IS '추천코스 추천수';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMENT_STATUS" IS '상태(Y/N)';

COMMENT ON COLUMN "TB_RECOMMEND"."RECOMMEND_THUMB" IS '썸네일파일저장경로';

COMMENT ON COLUMN "TB_RECOMMEND"."ADMIN_NO" IS '관리자번호';

DROP TABLE "TB_FAQ";

CREATE TABLE "TB_FAQ" (
	"FAQ_NO"	NUMBER		NOT NULL,
	"FAQ_TITLE"	VARCHAR2(40)		NOT NULL,
	"FAQ_CONTENT"	CLOB		NOT NULL,
	"FAQ_ENROLL"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"ADMIN_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_FAQ"."FAQ_NO" IS 'FAQ 글번호';

COMMENT ON COLUMN "TB_FAQ"."FAQ_TITLE" IS 'FAQ 제목';

COMMENT ON COLUMN "TB_FAQ"."FAQ_CONTENT" IS 'FAQ 내용';

COMMENT ON COLUMN "TB_FAQ"."FAQ_ENROLL" IS 'FAQ 작성일자';

COMMENT ON COLUMN "TB_FAQ"."ADMIN_NO" IS '관리자번호';

DROP TABLE "TB_NOTICE";

CREATE TABLE "TB_NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(40)		NOT NULL,
	"NOTICE_CONTENT"	CLOB		NOT NULL,
	"NOTICE_ENROLL"	DATE	DEFAULT SYSDATE	NULL,
	"NOTICE_MODIFY"	DATE	DEFAULT SYSDATE	NULL,
	"NOTICE_VIEWS"	NUMBER	DEFAULT 0	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"ADMIN_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_NO" IS '공지사항 글번호';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_TITLE" IS '공지사항 제목';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CONTENT" IS '공지사항 내용';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_ENROLL" IS '공지사항 작성일자';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_MODIFY" IS '공지사항 수정일자';

COMMENT ON COLUMN "TB_NOTICE"."NOTICE_VIEWS" IS '공지사항 조회수';

COMMENT ON COLUMN "TB_NOTICE"."STATUS" IS '상태(Y/N)';

COMMENT ON COLUMN "TB_NOTICE"."ADMIN_NO" IS '관리자번호';

DROP TABLE "TB_PLAN_SCRAP";

CREATE TABLE "TB_PLAN_SCRAP" (
	"PLAN_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PSCRAP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "TB_PLAN_SCRAP"."PLAN_NO" IS '일정번호';

COMMENT ON COLUMN "TB_PLAN_SCRAP"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_PLAN_SCRAP"."PSCRAP_DATE" IS '스크랩날짜';

DROP TABLE "TB_ADMIN";

CREATE TABLE "TB_ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_NAME"	VARCHAR2(30)		NOT NULL,
	"ADMIN_ID"	VARCHAR2(20)		NOT NULL,
	"ADMIN_PWD"	VARCHAR2(50)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TB_ADMIN"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "TB_ADMIN"."ADMIN_NAME" IS '관리자이름';

COMMENT ON COLUMN "TB_ADMIN"."ADMIN_ID" IS '관리자아이디';

COMMENT ON COLUMN "TB_ADMIN"."ADMIN_PWD" IS '관리자비밀번호';

COMMENT ON COLUMN "TB_ADMIN"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "TB_ADMIN"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TB_ADMIN"."STATUS" IS '상태(활동:Y/탈퇴:N)';

DROP TABLE "TB_PLAN_OPTION";

CREATE TABLE "TB_PLAN_OPTION" (
	"PLAN_NO"	NUMBER		NOT NULL,
	"PLAN_TITLE"	VARCHAR2(100)		NOT NULL,
	"PLAN_SDATE"	DATE		NOT NULL,
	"PLAN_EDATE"	DATE		NOT NULL,
	"PLAN_AGE"	VARCHAR2(30)		NULL,
	"PLAN_ACC"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"PLAN_BUDGET"	VARCHAR2(20)		NULL,
	"PLAN_SCRAP_YN"	VARCHAR2(1)		NOT NULL,
	"PLAN_PRIVATE"	VARCHAR2(1)		NOT NULL,
	"PLAN_MEMO"	VARCHAR2(1000)		NULL,
	"PLAN_HASHTAG"	VARCHAR2(100)		NULL,
	"PLAN_TEMP"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"PLAN_TYPE"	VARCHAR2(20)		NULL,
	"PLAN_TRANS"	VARCHAR2(100)		NULL,
	"PLAN_RECOMMEND"	NUMBER	DEFAULT 0	NULL,
	"PLAN_SCRAP_COUNT"	NUMBER	DEFAULT 0	NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_NO" IS '일정번호';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_TITLE" IS '일정만들기 페이지의 일정 제목';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_SDATE" IS '일정만들기 페이지의 시작일자';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_EDATE" IS '일정만든기 페이지의 종료일자';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_AGE" IS '10, 20, 30, 40, 50, 60 중에 선택';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_ACC" IS '비동행N, 동행 Y';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_BUDGET" IS '예산금액 - 콤마 포함';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_SCRAP_YN" IS '허용Y / 비허용N';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_PRIVATE" IS '공개Y / 비공개N';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_MEMO" IS '일정만들기의 작성자의 메모';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_HASHTAG" IS '#으로 구분 / 최대 5개';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_TEMP" IS '임시저장Y /  저장 N (강사님께 피드백)';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_TYPE" IS '남자끼리/여자끼리/가족/커플/남자혼자/여자혼자 유형선택';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_TRANS" IS '도보 / 택시 /대중교통 /전동킥보드 / 자가용 / 자전거';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_RECOMMEND" IS '추천수';

COMMENT ON COLUMN "TB_PLAN_OPTION"."PLAN_SCRAP_COUNT" IS '스크랩수';

COMMENT ON COLUMN "TB_PLAN_OPTION"."USER_NO" IS '회원번호';

DROP TABLE "TB_INQUIRE";

CREATE TABLE "TB_INQUIRE" (
	"INQUIRE_NO"	NUMBER		NOT NULL,
	"INQUIRE_TITLE"	VARCHAR2(100)		NOT NULL,
	"INQUIRE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"INQUIRE_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"INQUIRE_STATUS"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"INQUIRE_EMAIL"	VARCHAR2(50)		NULL,
	"INQUIRE_RESPONSE"	VARCHAR2(4000)		NULL,
	"RESPONSE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"USER_NO"	NUMBER		NULL,
	"ADMIN_NO"	NUMBER		NULL,
	"INQUIRE_SEP"	VARCHAR2(10)		NOT NULL,
	"INQUIRE_TYPE"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_NO" IS '문의글번호';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_TITLE" IS '문의글제목';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_CONTENT" IS '문의글내용';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_ENROLL_DATE" IS '문의글작성날짜';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_STATUS" IS '기본N, 답변 시'Y'';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_EMAIL" IS '비회원아이디';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_RESPONSE" IS '문의글관리자답변';

COMMENT ON COLUMN "TB_INQUIRE"."RESPONSE_DATE" IS '문의글관리자답변날짜';

COMMENT ON COLUMN "TB_INQUIRE"."STATUS" IS '상태(Y/N)';

COMMENT ON COLUMN "TB_INQUIRE"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_INQUIRE"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_SEP" IS '회원/비회원';

COMMENT ON COLUMN "TB_INQUIRE"."INQUIRE_TYPE" IS '서비스이용문의/계정문의/이벤트문의/서버,시스템문의/탈퇴문의/불법이용자문의/버그제보/건의/기타문의';

DROP TABLE "TB_PLAN_MAP";

CREATE TABLE "TB_PLAN_MAP" (
	"PLAN_XY_NO"	NUMBER		NOT NULL,
	"PLAN_DAY"	DATE		NOT NULL,
	"ORDER_NO"	NUMBER		NOT NULL,
	"LINE_MEMO"	VARCHAR2(200)		NULL,
	"LATITUDE"	VARCHAR2(20)		NOT NULL,
	"LONGITUDE"	VARCHAR2(20)		NOT NULL,
	"PLAN_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_PLAN_MAP"."PLAN_XY_NO" IS '좌표번호';

COMMENT ON COLUMN "TB_PLAN_MAP"."PLAN_DAY" IS 'DAY1, DAY2';

COMMENT ON COLUMN "TB_PLAN_MAP"."ORDER_NO" IS '리스트 순서';

COMMENT ON COLUMN "TB_PLAN_MAP"."LINE_MEMO" IS '작성자가 장소 생성시 작성가능한 한줄 메모';

COMMENT ON COLUMN "TB_PLAN_MAP"."LATITUDE" IS '장소의 위도값';

COMMENT ON COLUMN "TB_PLAN_MAP"."LONGITUDE" IS '장소의 경도값';

COMMENT ON COLUMN "TB_PLAN_MAP"."PLAN_NO" IS '일정번호';

DROP TABLE "TB_ACCOMPANY";

CREATE TABLE "TB_ACCOMPANY" (
	"ACCOM_NO"	NUMBER		NOT NULL,
	"ACCOM_APPLY"	DATE	DEFAULT SYSDATE	NULL,
	"ACCOM_STATUS"	VARCHAR2(1)	DEFAULT Null	NULL,
	"ACCOM_COMPLETE"	DATE		NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"USER_NO2"	NUMBER		NOT NULL,
	"PLAN_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_ACCOMPANY"."ACCOM_NO" IS '동행목록의 번호';

COMMENT ON COLUMN "TB_ACCOMPANY"."ACCOM_APPLY" IS '동행 신청한 신청일';

COMMENT ON COLUMN "TB_ACCOMPANY"."ACCOM_STATUS" IS '동행이면 Y, Null 이면 진행중, 동행아니면 N';

COMMENT ON COLUMN "TB_ACCOMPANY"."ACCOM_COMPLETE" IS '동행 신청 완료일';

COMMENT ON COLUMN "TB_ACCOMPANY"."USER_NO" IS '동행신청자';

COMMENT ON COLUMN "TB_ACCOMPANY"."USER_NO2" IS '동행구인자==일정등록자';

COMMENT ON COLUMN "TB_ACCOMPANY"."PLAN_NO" IS '동행일정';

DROP TABLE "TB_MESSAGE";

CREATE TABLE "TB_MESSAGE" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"MESSAGE_CONTENT"	VARCHAR2(300)		NOT NULL,
	"MESSAGE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"USER_NO2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_MESSAGE"."MESSAGE_NO" IS '메세지목록의 번호';

COMMENT ON COLUMN "TB_MESSAGE"."MESSAGE_CONTENT" IS '메세지 내용';

COMMENT ON COLUMN "TB_MESSAGE"."MESSAGE_DATE" IS '메세지 발신,수신날짜';

COMMENT ON COLUMN "TB_MESSAGE"."STATUS" IS '상태값(Y/N)';

COMMENT ON COLUMN "TB_MESSAGE"."USER_NO" IS '발신자';

COMMENT ON COLUMN "TB_MESSAGE"."USER_NO2" IS '수신자';

DROP TABLE "TB_PLAN_COMMENT";

CREATE TABLE "TB_PLAN_COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PLAN_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"COMMENT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COMMENT_MODIFY"	DATE	DEFAULT SYSDATE	NULL,
	"COMMENT_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TB_PLAN_COMMENT"."COMMENT_NO" IS '댓글번호';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."PLAN_NO" IS '일정번호';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."COMMENT_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."COMMENT_DATE" IS '작성일';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."COMMENT_MODIFY" IS '수정일';

COMMENT ON COLUMN "TB_PLAN_COMMENT"."COMMENT_STATUS" IS '상태';

DROP TABLE "TB_COMMUNITY_SCRAP";

CREATE TABLE "TB_COMMUNITY_SCRAP" (
	"USER_NO"	NUMBER		NOT NULL,
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"SCRAP_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "TB_COMMUNITY_SCRAP"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_COMMUNITY_SCRAP"."COMMUNITY_NO" IS '글번호';

COMMENT ON COLUMN "TB_COMMUNITY_SCRAP"."SCRAP_DATE" IS '스크랩날짜';

DROP TABLE "TB_REPORT";

CREATE TABLE "TB_REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_CONTENT"	CLOB		NOT NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"REPORT_STATUS"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"USER_NO2"	NUMBER		NOT NULL,
	"REPORT_POSTNO"	NUMBER		NOT NULL,
	"REPORT_TYPE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "TB_REPORT"."REPORT_NO" IS '신고 번호';

COMMENT ON COLUMN "TB_REPORT"."REPORT_CONTENT" IS '신고 내용';

COMMENT ON COLUMN "TB_REPORT"."REPORT_DATE" IS '신고 일시';

COMMENT ON COLUMN "TB_REPORT"."REPORT_STATUS" IS '신고 처리 상태(미처리: N/ 처리: Y)';

COMMENT ON COLUMN "TB_REPORT"."USER_NO" IS '신고자 번호';

COMMENT ON COLUMN "TB_REPORT"."USER_NO2" IS '신고대상자 번호';

COMMENT ON COLUMN "TB_REPORT"."REPORT_POSTNO" IS '커뮤니티번호,일정번호,댓글번호';

COMMENT ON COLUMN "TB_REPORT"."REPORT_TYPE" IS '불법성, 광고성, 기타 등';

DROP TABLE "TB_COMMUNITY_RECOMMEND";

CREATE TABLE "TB_COMMUNITY_RECOMMEND" (
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_COMMUNITY_RECOMMEND"."COMMUNITY_NO" IS '글번호';

COMMENT ON COLUMN "TB_COMMUNITY_RECOMMEND"."USER_NO" IS '회원번호';

DROP TABLE "TB_PLAN_RECOMMEND";

CREATE TABLE "TB_PLAN_RECOMMEND" (
	"USER_NO"	NUMBER		NOT NULL,
	"PLAN_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_PLAN_RECOMMEND"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_PLAN_RECOMMEND"."PLAN_NO" IS '일정번호';

ALTER TABLE "TB_COMMUNITY" ADD CONSTRAINT "PK_TB_COMMUNITY" PRIMARY KEY (
	"COMMUNITY_NO"
);

ALTER TABLE "TB_MEMBER" ADD CONSTRAINT "PK_TB_MEMBER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "TB_COMMUNITY_COMMENT" ADD CONSTRAINT "PK_TB_COMMUNITY_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "TB_RECOMMEND" ADD CONSTRAINT "PK_TB_RECOMMEND" PRIMARY KEY (
	"RECOMMEND_NO"
);

ALTER TABLE "TB_FAQ" ADD CONSTRAINT "PK_TB_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "TB_PLAN_SCRAP" ADD CONSTRAINT "PK_TB_PLAN_SCRAP" PRIMARY KEY (
	"PLAN_NO",
	"USER_NO"
);

ALTER TABLE "TB_ADMIN" ADD CONSTRAINT "PK_TB_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "TB_PLAN_OPTION" ADD CONSTRAINT "PK_TB_PLAN_OPTION" PRIMARY KEY (
	"PLAN_NO"
);

ALTER TABLE "TB_INQUIRE" ADD CONSTRAINT "PK_TB_INQUIRE" PRIMARY KEY (
	"INQUIRE_NO"
);

ALTER TABLE "TB_PLAN_MAP" ADD CONSTRAINT "PK_TB_PLAN_MAP" PRIMARY KEY (
	"PLAN_XY_NO"
);

ALTER TABLE "TB_ACCOMPANY" ADD CONSTRAINT "PK_TB_ACCOMPANY" PRIMARY KEY (
	"ACCOM_NO"
);

ALTER TABLE "TB_MESSAGE" ADD CONSTRAINT "PK_TB_MESSAGE" PRIMARY KEY (
	"MESSAGE_NO"
);

ALTER TABLE "TB_PLAN_COMMENT" ADD CONSTRAINT "PK_TB_PLAN_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "TB_COMMUNITY_SCRAP" ADD CONSTRAINT "PK_TB_COMMUNITY_SCRAP" PRIMARY KEY (
	"USER_NO",
	"COMMUNITY_NO"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "TB_COMMUNITY_RECOMMEND" ADD CONSTRAINT "PK_TB_COMMUNITY_RECOMMEND" PRIMARY KEY (
	"COMMUNITY_NO",
	"USER_NO"
);

ALTER TABLE "TB_PLAN_RECOMMEND" ADD CONSTRAINT "PK_TB_PLAN_RECOMMEND" PRIMARY KEY (
	"USER_NO",
	"PLAN_NO"
);

ALTER TABLE "TB_COMMUNITY" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_COMMUNITY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_COMMUNITY_COMMENT" ADD CONSTRAINT "FK_TB_COMMUNITY_TO_TB_COMMUNITY_COMMENT_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "TB_COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "TB_COMMUNITY_COMMENT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_COMMUNITY_COMMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_RECOMMEND" ADD CONSTRAINT "FK_TB_ADMIN_TO_TB_RECOMMEND_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "TB_ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "TB_FAQ" ADD CONSTRAINT "FK_TB_ADMIN_TO_TB_FAQ_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "TB_ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "FK_TB_ADMIN_TO_TB_NOTICE_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "TB_ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "TB_PLAN_SCRAP" ADD CONSTRAINT "FK_TB_PLAN_OPTION_TO_TB_PLAN_SCRAP_1" FOREIGN KEY (
	"PLAN_NO"
)
REFERENCES "TB_PLAN_OPTION" (
	"PLAN_NO"
);

ALTER TABLE "TB_PLAN_SCRAP" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_PLAN_SCRAP_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_PLAN_OPTION" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_PLAN_OPTION_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_INQUIRE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_INQUIRE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_INQUIRE" ADD CONSTRAINT "FK_TB_ADMIN_TO_TB_INQUIRE_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "TB_ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "TB_PLAN_MAP" ADD CONSTRAINT "FK_TB_PLAN_OPTION_TO_TB_PLAN_MAP_1" FOREIGN KEY (
	"PLAN_NO"
)
REFERENCES "TB_PLAN_OPTION" (
	"PLAN_NO"
);

ALTER TABLE "TB_ACCOMPANY" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_ACCOMPANY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_ACCOMPANY" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_ACCOMPANY_2" FOREIGN KEY (
	"USER_NO2"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_ACCOMPANY" ADD CONSTRAINT "FK_TB_PLAN_OPTION_TO_TB_ACCOMPANY_1" FOREIGN KEY (
	"PLAN_NO"
)
REFERENCES "TB_PLAN_OPTION" (
	"PLAN_NO"
);

ALTER TABLE "TB_MESSAGE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_MESSAGE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_MESSAGE" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_MESSAGE_2" FOREIGN KEY (
	"USER_NO2"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_PLAN_COMMENT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_PLAN_COMMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_PLAN_COMMENT" ADD CONSTRAINT "FK_TB_PLAN_OPTION_TO_TB_PLAN_COMMENT_1" FOREIGN KEY (
	"PLAN_NO"
)
REFERENCES "TB_PLAN_OPTION" (
	"PLAN_NO"
);

ALTER TABLE "TB_COMMUNITY_SCRAP" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_COMMUNITY_SCRAP_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_COMMUNITY_SCRAP" ADD CONSTRAINT "FK_TB_COMMUNITY_TO_TB_COMMUNITY_SCRAP_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "TB_COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_REPORT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_REPORT_2" FOREIGN KEY (
	"USER_NO2"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_COMMUNITY_RECOMMEND" ADD CONSTRAINT "FK_TB_COMMUNITY_TO_TB_COMMUNITY_RECOMMEND_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "TB_COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "TB_COMMUNITY_RECOMMEND" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_COMMUNITY_RECOMMEND_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_PLAN_RECOMMEND" ADD CONSTRAINT "FK_TB_MEMBER_TO_TB_PLAN_RECOMMEND_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_MEMBER" (
	"USER_NO"
);

ALTER TABLE "TB_PLAN_RECOMMEND" ADD CONSTRAINT "FK_TB_PLAN_OPTION_TO_TB_PLAN_RECOMMEND_1" FOREIGN KEY (
	"PLAN_NO"
)
REFERENCES "TB_PLAN_OPTION" (
	"PLAN_NO"
);

ALTER TABLE "TB_MEMBER" ADD UNIQUE (
	"USER_NICK"
);

ALTER TABLE "TB_MEMBER" ADD UNIQUE (
	"USER_ID"
);

ALTER TABLE "TB_ADMIN" ADD UNIQUE (
	"ADMIN_ID"
);