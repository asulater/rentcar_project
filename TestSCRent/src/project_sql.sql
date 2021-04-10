
/* Create Sequences */

CREATE SEQUENCE SEQ_accident_accidentno INCREMENT BY 1 START WITH 10000; --# 사고번호 시퀀스 (PK)
-- #CREATE SEQUENCE SEQ_bbbbbb_asdsad INCREMENT BY 1 START WITH 1; 
CREATE SEQUENCE SEQ_car_notice_noticeNo INCREMENT BY 1 START WITH 1; --# 공지사항 번호 시퀀스(PK)
CREATE SEQUENCE SEQ_faq_faqno INCREMENT BY 1 START WITH 1; --# 자주하는 질문 번호 시퀀스 (PK)
CREATE SEQUENCE SEQ_Rent_rentno INCREMENT BY 1 START WITH 10000; --# 렌트 No 시퀀스 (PK)
CREATE SEQUENCE SEQ_approval_approvalno INCREMENT BY 1 START WITH 10000; --# 결재번호 시퀀스(PK)


/* Create Tables */

create table approval(
approvalno number primary key,
carid varchar2(20) not null,
accidentno varchar2(20),
requestid varchar2(20) not null,
category varchar2(20) not null,
appcomment varchar2(1000),
requestdate date default sysdate
);

CREATE TABLE accident
(
	-- # Accident
	-- # Primary key
	-- # 사건번호
	accidentno number primary key,
	-- # Accident
	-- # Not Null
	-- # 사고 차량 Id
	carid varchar2(15) NOT NULL,
	-- # Accident
	-- # Not Null
	-- # 액터(사고 낸 당사자)
	userid varchar2(20) NOT NULL,
	-- # Accident
	-- # Not Null
	-- # 사고가 발생한 날짜
	accidentdate date NOT NULL,
	-- # Accident
	-- # Not Null
	-- # 코멘트
	comments varchar2(300) NOT NULL,
	-- # Accident
	-- # Not Null
	-- # 서류 ID
	documentno varchar2(20) NOT NULL,
	-- # Accident
	-- # Not Null
	-- # 사건 담당자 Id
	managerid varchar2(20) NOT NULL
);


CREATE TABLE Car
(
	-- # Car
	-- # Primary key
	-- # 차량 번호
	carid varchar2(15) primary key,
	-- # Car
	-- # Not Null
	-- # 차량 이름
	carname varchar2(20) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 차량 종류
	cartype varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 제조사
	company varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 가격
	price number NOT NULL,
	-- # Car
	-- # Not Null
	-- # 연비 (km/ℓ)
	km varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 승차인원
	persons varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 사용연료
	fuel varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 최고출력
	maxoutput varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 배기량
	capacity varchar2(10) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 사진(경로 저장)
	picture varchar2(300) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 사용중지여부 ( 0 - 문제 없음 / 1 - 정비중  
	--                         2 - 폐차(가용중지 기록만) 
	--                         3 - 구입 승인 결재 전 )
	status number DEFAULT 0 NOT NULL
);


CREATE TABLE car_notice
(
	-- # Notice
	-- # Primary key
	-- # 공지사항 번호
	noticeNo number primary key,
	-- # Notice
	-- # Not Null
	-- # 공지사항 - 제목
	title varchar2(100) NOT NULL,
	-- # Notice
	-- # Not Null
	-- # 공지사항 - 조회수
	count number DEFAULT 0 NOT NULL,
	-- # Notice
	-- # Not Null
	-- # 공지사항 - 작성일
	insertDate date DEFAULT SYSDATE NOT NULL
);


CREATE TABLE faq
(
	-- # FAQ
	-- # Primary key
	-- # 자주하는 질문 - No
	faqno number DEFAULT 1 primary key,
	-- # FAQ
	-- # Not Null
	-- # 자주하는 질문 - 제목
	title varchar2(100) NOT NULL,
	-- # FAQ
	-- # Not Null
	-- # 자주하는 질문 - 내용
	content varchar2(2000) NOT NULL
);


CREATE TABLE fee
(
	-- # Fee
	-- # Primary key
	feeno varchar2(10) primary key,
	-- # Fee
	-- # Not Null
	-- # 차량 이름
	carname varchar2(20) NOT NULL,
	-- # Fee
	-- # Not Null
	-- # 연료 종류
	fuel varchar2(10) NOT NULL,
	-- # Fee
	-- # Not Null
	-- # 사용료 ( 가격/시간 )
	price number NOT NULL
);


CREATE TABLE levels
(
	-- # Level
	-- # Not Null
	-- # 직급 - 권한
	grade varchar2(10) primary key,
	-- # Level
	-- # Not Null
	-- # 차량정보조회 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	carinfo number DEFAULT 0 NOT NULL,
	-- # Level
	-- # Not Null
	-- # 예약정보 확인 및 승인 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	reservechk number DEFAULT 0 NOT NULL,
	-- # Level
	-- # Not Null
	-- # 사고차량관리 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	accmanage number DEFAULT 0 NOT NULL,
	-- # Level
	-- # Not Null
	-- # 차량구입신청 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	buycar number DEFAULT 0 NOT NULL,
	-- # Level
	-- # Not Null
	-- # 결재 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	confirm number DEFAULT 0 NOT NULL,
	-- # Level
	-- # Not Null
	-- # 사원관리 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)
	employeemanage number DEFAULT 0 NOT NULL
);


CREATE TABLE managers
(
	-- # Manager Member
	-- # Primary key
	-- # 관리자 Id
	id varchar2(20) primary key,
	-- # Manager Member
	-- # Not Null
	-- # 비밀번호
	password varchar2(30) NOT NULL,
	-- # Manager Member
	-- # Not Null
	-- # 관리자 이름
	name varchar2(20) NOT NULL,
	-- # Manager Member
	-- # Not Null
	-- # 관리자 전화번호
	phone varchar2(20) NOT NULL,
	-- # Manager Member
	-- # Not Null
	-- # 관리자 EMail
	email varchar2(50) NOT NULL,
	-- # Level
	-- # Not Null
	-- # 직급 - 권한
	grade varchar2(10) references levels(grade)
);


-- # Client Member
CREATE TABLE members
(
	-- # Client Member
	-- # Primary key
	id varchar2(20) primary key,
	-- # Client Member
	-- # Not Null
	password varchar2(20) NOT NULL,
	-- # Client Member
	-- # Not Null
	name varchar2(15) NOT NULL,
	-- # Client Member
	-- # Not Null
	licensedate date NOT NULL,
	-- # Client Member
	-- # Not Null
	address varchar2(50) NOT NULL,
	-- # Client Member
	-- # Not Null
	phone varchar2(20) NOT NULL,
	-- # Client Member
	-- # Not Null
	email varchar2(30) NOT NULL
);


CREATE TABLE Rent
(
	-- # Rent
	-- # Primary key
	-- # 렌트 일련번호
	rentno number primary key,
	-- # Rent
	-- # Not Null
	-- # 대여일
	startday date NOT NULL,
	-- # Client Member
	-- # Primary key (Member)
	-- ## Foreign key (Member.id)
	endday date NOT NULL,
	-- # Client Member
	-- # Primary key (Member)
	-- ## Foreign key (Member.id)
	member_id varchar2(20) references members(id),
	-- # Rent
	-- # 보험 여부
	insurance varchar2(10) NOT NULL,
	-- # Rent
	-- # 옵션 여부
	options varchar2(10),
	-- # Rent
	-- # Not Null
	-- # 결제여부
	obtain number DEFAULT 0 NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 승인여부
	paycheck number NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 반납여부
	returnchk number DEFAULT 0 NOT NULL,
	-- # Manager Member
	-- # Primary key
	-- # 관리자 Id
	manager_id varchar2(20) references managers(id),
	-- # Car
	-- # Primary key
	-- # 차량 번호
	car_id varchar2(15) references car(carid),
	-- # Rent
	-- # Not Null
	-- # 연체 여부 ( 0 - 연체 없음 / 1 - 연체 있음 )
	overdue number DEFAULT 0 NOT NULL
);






/* Comments */

COMMENT ON COLUMN accident.accidentno IS '# Accident
# Primary key
# 사건번호';
COMMENT ON COLUMN accident.carid IS '# Accident
# Not Null
# 사고 차량 Id';
COMMENT ON COLUMN accident.userid IS '# Accident
# Not Null
# 액터(사고 낸 당사자)';
COMMENT ON COLUMN accident.accidentdate IS '# Accident
# Not Null
# 사고가 발생한 날짜';
COMMENT ON COLUMN accident.comments IS '# Accident
# Not Null
# 코멘트';
COMMENT ON COLUMN accident.documentno IS '# Accident
# Not Null
# 서류 ID';
COMMENT ON COLUMN accident.managerid IS '# Accident
# Not Null
# 사건 담당자 Id';
COMMENT ON COLUMN Car.carid IS '# Car
# Primary key
# 차량 번호';
COMMENT ON COLUMN Car.carname IS '# Car
# Not Null
# 차량 이름';
COMMENT ON COLUMN Car.cartype IS '# Car
# Not Null
# 차량 종류';
COMMENT ON COLUMN Car.company IS '# Car
# Not Null
# 제조사';
COMMENT ON COLUMN Car.price IS '# Car
# Not Null
# 가격';
COMMENT ON COLUMN Car.km IS '# Car
# Not Null
# 연비 (km/ℓ)';
COMMENT ON COLUMN Car.persons IS '# Car
# Not Null
# 승차인원';
COMMENT ON COLUMN Car.fuel IS '# Car
# Not Null
# 사용연료';
COMMENT ON COLUMN Car.maxoutput IS '# Car
# Not Null
# 최고출력';
COMMENT ON COLUMN Car.capacity IS '# Car
# Not Null
# 배기량';
COMMENT ON COLUMN Car.picture IS '# Car
# Not Null
# 사진(경로 저장)';
COMMENT ON COLUMN Car.status IS '# Car
# Not Null
# 사용중지여부 ( 0 - 문제 없음 / 1 - 정비중  
                        2 - 폐차(가용중지 기록만) 
                        3 - 구입 승인 결재 전 )';
COMMENT ON COLUMN car_notice.noticeNo IS '# Notice
# Primary key
# 공지사항 번호';
COMMENT ON COLUMN car_notice.title IS '# Notice
# Not Null
# 공지사항 - 제목';
COMMENT ON COLUMN car_notice.count IS '# Notice
# Not Null
# 공지사항 - 조회수';
COMMENT ON COLUMN car_notice.insertDate IS '# Notice
# Not Null
# 공지사항 - 작성일';
COMMENT ON COLUMN faq.faqno IS '# FAQ
# Primary key
# 자주하는 질문 - No';
COMMENT ON COLUMN faq.title IS '# FAQ
# Not Null
# 자주하는 질문 - 제목';
COMMENT ON COLUMN faq.content IS '# FAQ
# Not Null
# 자주하는 질문 - 내용';
COMMENT ON COLUMN fee.feeno IS '# Fee
# Primary key';
COMMENT ON COLUMN fee.carname IS '# Fee
# Not Null
# 차량 이름';
COMMENT ON COLUMN fee.fuel IS '# Fee
# Not Null
# 연료 종류';
COMMENT ON COLUMN fee.price IS '# Fee
# Not Null
# 사용료 ( 가격/시간 )';
COMMENT ON COLUMN levels.grade IS '# Level
# Not Null
# 직급 - 권한';
COMMENT ON COLUMN levels.carinfo IS '# Level
# Not Null
# 차량정보조회 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN levels.reservechk IS '# Level
# Not Null
# 예약정보 확인 및 승인 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN levels.accmanage IS '# Level
# Not Null
# 사고차량관리 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN levels.buycar IS '# Level
# Not Null
# 차량구입신청 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN levels.confirm IS '# Level
# Not Null
# 결재 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN levels.employeemanage IS '# Level
# Not Null
# 사원관리 ( 0 - 메뉴권한없음 / 1 - 메뉴권한있음)';
COMMENT ON COLUMN managers.id IS '# Manager Member
# Primary key
# 관리자 Id';
COMMENT ON COLUMN managers.password IS '# Manager Member
# Not Null
# 비밀번호';
COMMENT ON COLUMN managers.name IS '# Manager Member
# Not Null
# 관리자 이름';
COMMENT ON COLUMN managers.phone IS '# Manager Member
# Not Null
# 관리자 전화번호';
COMMENT ON COLUMN managers.email IS '# Manager Member
# Not Null
# 관리자 EMail';
COMMENT ON COLUMN managers.grade IS '# Level
# Not Null
# 직급 - 권한';
COMMENT ON TABLE members IS '# Client Member';
COMMENT ON COLUMN members.id IS '# Client Member
# Primary key';
COMMENT ON COLUMN members.password IS '# Client Member
# Not Null';
COMMENT ON COLUMN members.name IS '# Client Member
# Not Null';
COMMENT ON COLUMN members.licensedate IS '# Client Member
# Not Null';
COMMENT ON COLUMN members.address IS '# Client Member
# Not Null';
COMMENT ON COLUMN members.phone IS '# Client Member
# Not Null';
COMMENT ON COLUMN members.email IS '# Client Member
# Not Null';
COMMENT ON COLUMN Rent.rentno IS '# Rent
# Primary key
# 렌트 일련번호';
COMMENT ON COLUMN Rent.startday IS '# Rent
# Not Null
# 대여일';
COMMENT ON COLUMN Rent.endday IS '# Rent
# Not Null';
COMMENT ON COLUMN Rent.id IS '# Client Member
# Primary key (Member)
## Foreign key (Member.id)';
COMMENT ON COLUMN Rent.insurance IS '# Rent
# Not Null
# 보험여부';
COMMENT ON COLUMN Rent.options IS '# Rent
';
COMMENT ON COLUMN Rent.obtain IS '# Rent
# Not Null - Default 0
# 승인 여부';
COMMENT ON COLUMN Rent.paycheck IS '# Rent
# Not Null
# 결제여부';
COMMENT ON COLUMN Rent.returnchk IS '# Rent
# Not Null
# 반납여부';
COMMENT ON COLUMN Rent.manager_id IS '# Manager Member
# Primary key
# 관리자 Id';
COMMENT ON COLUMN Rent.carid IS '# Car
# Primary key
# 차량 번호';
COMMENT ON COLUMN Rent.overdue IS '# Rent
# Not Null
# 연체 여부 ( 0 - 연체 없음 / 1 - 연체 있음 )';



