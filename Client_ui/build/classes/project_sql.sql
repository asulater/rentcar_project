alter table rent add(subdate date default(sysdate));
alter table rent add(carname varchar2(20) not null);
alter table rent add(total number not null);
alter table car_notice add(content varchar2(4000));
alter table rent add(cancelchk number default 0);

/* Create Sequences */

CREATE SEQUENCE SEQ_accident_accidentno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_bbbbbb_asdsad INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_car_notice_noticeNo INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_faq_faqno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Rent_rentno INCREMENT BY 1 START WITH 1;


/* Create Tables */

CREATE TABLE accident
(
	-- # Accident
	-- # Primary key
	-- # 사건번호
	accidentno number NOT NULL,
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
	managerid varchar2(20) NOT NULL,
	PRIMARY KEY (accidentno)
);


CREATE TABLE Car
(
	-- # Car
	-- # Primary key
	-- # 차량 번호
	carid varchar2(15) NOT NULL,
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
	company varchar2(20) NOT NULL,
	-- # Car
	-- # Not Null
	-- # 가격
	price number NOT NULL,
	-- # Car
	-- # Not Null
	-- # 연비 (km/ℓ)
	km varchar2(20) NOT NULL,
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
	-- # 사용중지여부 ( 0 - 문제 없음 / 
	--                         1 - 예약 중인 차량
	--                         2 - 사용 중 차량
	--                         3 - 정비중  
	--                         4 - 폐차(가용중지 기록만) 
	--                         5 - 구입 승인 결재 전 
	--                         6 - 재정비
	--                         7 - 폐차 신청 
	--                         8 - 블록 폐지 요청 )
	status number DEFAULT 0 NOT NULL,
	PRIMARY KEY (carid)
);


CREATE TABLE car_notice
(
	-- # Notice
	-- # Primary key
	-- # 공지사항 번호
	noticeNo number NOT NULL,
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
	insertDate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (noticeNo)
);


CREATE TABLE faq
(
	-- # FAQ
	-- # Primary key
	-- # 자주하는 질문 - No
	faqno number DEFAULT 1 NOT NULL,
	-- # FAQ
	-- # Not Null
	-- # 자주하는 질문 - 제목
	title varchar2(100) NOT NULL,
	-- # FAQ
	-- # Not Null
	-- # 자주하는 질문 - 내용
	content varchar2(2000) NOT NULL,
	PRIMARY KEY (faqno)
);


CREATE TABLE fee
(
	-- # Fee
	-- # Primary key
	feeno varchar2(10) NOT NULL,
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
	price number NOT NULL,
	PRIMARY KEY (feeno)
);


CREATE TABLE levels
(
	-- # Level
	-- # Not Null
	-- # 직급 - 권한
	grade varchar2(10) NOT NULL,
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
	employeemanage number DEFAULT 0 NOT NULL,
	PRIMARY KEY (grade)
);


CREATE TABLE managers
(
	-- # Manager Member
	-- # Primary key
	-- # 관리자 Id
	id varchar2(20) NOT NULL,
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
	grade varchar2(10) NOT NULL,
	PRIMARY KEY (id)
);


-- # Client Member
CREATE TABLE members
(
	-- # Client Member
	-- # Primary key
	id varchar2(20) NOT NULL,
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
	address varchar2(100) NOT NULL,
	-- # Client Member
	-- # Not Null
	phone varchar2(20) NOT NULL,
	-- # Client Member
	-- # Not Null
	email varchar2(30) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE Rent
(
	-- # Rent
	-- # Primary key
	-- # 렌트 일련번호
	rentno number NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 대여일
	startday date NOT NULL,
	-- # Rent
	-- # Not Null
	endday date NOT NULL,
	-- # Client Member
	-- # Primary key (Member)
	-- ## Foreign key (Member.id)
	id varchar2(20) NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 보험여부 ( 0 - 보험 등록 / 1 - 보험 없음)
	insurance number NOT NULL,
	-- # Rent
	-- 
	options varchar2(10),
	-- # Rent
	-- # Not Null - Default 0
	-- # 승인 여부
	obtain number DEFAULT 0,
	-- # Rent
	-- # Not Null
	-- # 결제여부
	paycheck number NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 반납여부
	returnchk number DEFAULT 0,
	-- # Manager Member
	-- # Primary key
	-- # 관리자 Id
	manager_id varchar2(20),
	-- # Car
	-- # Primary key
	-- # 차량 번호
	carid varchar2(15) NOT NULL,
	-- # Rent
	-- # Not Null
	-- # 연체 여부 ( 0 - 연체 없음 / 1 - 연체 있음 )
	overdue number DEFAULT 0,
	PRIMARY KEY (rentno)
);



/* Create Foreign Keys */

ALTER TABLE Rent
	ADD FOREIGN KEY (carid)
	REFERENCES Car (carid)
;


ALTER TABLE managers
	ADD FOREIGN KEY (grade)
	REFERENCES levels (grade)
;


ALTER TABLE Rent
	ADD FOREIGN KEY (manager_id)
	REFERENCES managers (id)
;


ALTER TABLE Rent
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_accident_accidentno BEFORE INSERT ON accident
FOR EACH ROW
BEGIN
	SELECT SEQ_accident_accidentno.nextval
	INTO :new.accidentno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_bbbbbb_asdsad BEFORE INSERT ON bbbbbb
FOR EACH ROW
BEGIN
	SELECT SEQ_bbbbbb_asdsad.nextval
	INTO :new.asdsad
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_car_notice_noticeNo BEFORE INSERT ON car_notice
FOR EACH ROW
BEGIN
	SELECT SEQ_car_notice_noticeNo.nextval
	INTO :new.noticeNo
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_faq_faqno BEFORE INSERT ON faq
FOR EACH ROW
BEGIN
	SELECT SEQ_faq_faqno.nextval
	INTO :new.faqno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Rent_rentno BEFORE INSERT ON Rent
FOR EACH ROW
BEGIN
	SELECT SEQ_Rent_rentno.nextval
	INTO :new.rentno
	FROM dual;
END;

/




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
# 사용중지여부 ( 0 - 문제 없음 / 
                        1 - 예약 중인 차량
                        2 - 사용 중 차량
                        3 - 정비중  
                        4 - 폐차(가용중지 기록만) 
                        5 - 구입 승인 결재 전 
                        6 - 재정비
                        7 - 폐차 신청 
                        8 - 블록 폐지 요청 )';
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
# 보험여부 ( 0 - 보험 등록 / 1 - 보험 없음)';
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



