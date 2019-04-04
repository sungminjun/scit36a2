/* SCIT36-A-2, team minnanoPOS, 2019.04.01. v6. */
--INSERT VERSION
DROP TABLE version; 
CREATE TABLE version(version varchar2(50) not null);
INSERT INTO version VALUES('190401, rev6');

/* Drop Tables */
DROP TABLE board_comments CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE cashonhand CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE expense CASCADE CONSTRAINTS;
DROP TABLE sales_detail CASCADE CONSTRAINTS;
DROP TABLE menu CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE sales_state CASCADE CONSTRAINTS;
DROP TABLE seat CASCADE CONSTRAINTS;
DROP TABLE company CASCADE CONSTRAINTS;

/* DROP sequences */
DROP SEQUENCE comp_seqs;
DROP SEQUENCE emp_seqs;
DROP SEQUENCE seat_seqs;
DROP SEQUENCE menu_seqs;
DROP SEQUENCE board_seqs;
DROP SEQUENCE board_comments_seqs;
DROP SEQUENCE expense_seqs;
DROP SEQUENCE sales_state_seqs;
DROP SEQUENCE sales_detail_seqs;
DROP SEQUENCE cashonhand_seqs;
DROP SEQUENCE payment_seqs;


/* Create Tables */
-- 커뮤니티용 게시판
CREATE TABLE board
(
	-- 게시판 고유번호
	board_seq number NOT NULL,
	-- 일련번호
	emp_seq number NOT NULL,
	-- 게시판 글 카테고리 (e.g. 삽니다, 팝니다, 조언부탁드립니다..)
	board_category varchar2(30) NOT NULL,
	-- 글 제목
	board_title varchar2(100) NOT NULL,
	-- 글 내용
	board_content varchar2(3000) NOT NULL,
	-- 첨부파일 (원 업로드명)
	board_orgname varchar2(500),
	-- 첨부파일 (저장 경로)
	board_savname varchar2(500),
	-- 글 등록시간
	board_regdate date DEFAULT sysdate NOT NULL,
	-- 글 조회수
	board_hitcount number DEFAULT 0 NOT NULL,
	PRIMARY KEY (board_seq)
);


-- 커뮤니티용 댓글
CREATE TABLE board_comments
(
	-- 리플번호
	board_comments_seq number NOT NULL,
	-- 게시판 고유번호
	board_seq number NOT NULL,
	-- 리플 작성자
	board_comments_writer varchar2(30) NOT NULL,
	-- 리플 내용
	board_comments_content varchar2(500) NOT NULL,
	-- 리플 등록시간
	board_comments_regdate date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (board_comments_seq)
);

-- 소액현금 (시재)
CREATE TABLE cashonhand
(
	-- 일련번호
	cashonhand_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 분류구분) 1개시+ 2회수- 3투입+ 4마감-
	cashonhand_type number(1) NOT NULL,
	-- 시재 내역 등록자
	cashonhand_register varchar2(30) NOT NULL,
	-- 시재 내역 등록일시
	cashonhand_regdate date DEFAULT sysdate NOT NULL,
	-- 결산시 현금과 장부상 오차금액
	cashonhand_error number,
	-- 시재 금액
	cashonhand_cash number NOT NULL,
	PRIMARY KEY (cashonhand_seq)
);


-- 멤버(회원사)테이블
CREATE TABLE company
(
	-- 일련번호
	comp_seq number NOT NULL,
	-- 사업자등록번호(10자리)
	comp_id varchar2(10) NOT NULL UNIQUE,
	-- 가게 이름
	comp_name varchar2(100) NOT NULL,
	-- 가게 전화번호
	comp_tel varchar2(20) NOT NULL,
	-- 가게 주소
	comp_address varchar2(600) NOT NULL,
	-- 가게 지역
	comp_address2 varchar2(100) NOT NULL,
	PRIMARY KEY (comp_seq)
);


-- 멤버유저(회원사의 종업원)테이블
CREATE TABLE employee
(
	-- 일련번호
	emp_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 멤버(회사소속 개인) 로그인용 아이디
	emp_id varchar2(20) NOT NULL UNIQUE,
	-- 멤버(회사소속 개인) 로그인용 비밀번호
	emp_pw varchar2(30) NOT NULL,
	-- 멤버의 권한 (사장(관리자)=9, 직원(종업원)=1)
	emp_auth_level number(1) NOT NULL,
	-- 멤버 이름
	emp_name varchar2(30) NOT NULL,
	-- 멤버 전화번호
	emp_tel varchar2(20),
	-- 비밀번호 찾기 질문
	emp_quiz varchar2(100) NOT NULL,
	-- 비밀번호 찾기 답
	emp_quiz_answer varchar2(100) NOT NULL,
	PRIMARY KEY (emp_seq)
);


-- 지출테이블
CREATE TABLE expense
(
	-- 지출고유번호
	expense_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 지출 유형(1고정, 2변동, 3기타)
	expense_type number(1) NOT NULL,
	-- 지출 일시
	expense_date date DEFAULT sysdate NOT NULL,
	-- 지출 명목/내역(세부내용)
	expense_description varchar2(300) NOT NULL,
	-- 지출 금액
	expense_amount number DEFAULT 0 NOT NULL,
	PRIMARY KEY (expense_seq)
);


-- 회원사 메뉴정보
CREATE TABLE menu
(
	-- 메뉴 일련번호
	menu_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 판매중 여부 (0=판매중지, 1=판매)
	menu_sellFlag number(1) NOT NULL,
	-- 품목명
	menu_name varchar2(200) NOT NULL,
	-- 품목 판매가
	menu_price number NOT NULL,
	-- 품목 분류
	menu_category varchar2(100) NOT NULL,
	PRIMARY KEY (menu_seq)
);


-- 결제내역테이블
CREATE TABLE payment
(
	-- 일련번호
	payment_seq number NOT NULL,
	-- 일련번호
	sales_state_seq number NOT NULL,
	-- 결제종별(1카드,2현금)
	payment_type number(1) NOT NULL,
	-- 결제 금액
	payment_amount number DEFAULT 0 NOT NULL,
	-- 결제 시각
	payment_time date DEFAULT sysdate NOT NULL,
	-- 결제 담당자(결제시 로그인한 사람)
	payment_clerk varchar2(30) NOT NULL,
	PRIMARY KEY (payment_seq)
);


-- 회원사의 주문전표(세부내역)
CREATE TABLE sales_detail
(
	-- sales_detail_seq
	sales_detail_seq number NOT NULL,
	-- 일련번호
	sales_state_seq number NOT NULL,
	-- 메뉴 일련번호
	menu_seq number NOT NULL,
	-- 주문수량
	sales_order number(2) DEFAULT 1 NOT NULL,
	-- 할인가격을 절대금액으로 (1천원 깍아주면 1000)
	sales_discount number,
	PRIMARY KEY (sales_detail_seq)
);


-- 회원사의 주문전표(+테이블할당)
CREATE TABLE sales_state
(
	-- 일련번호
	sales_state_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 일련번호
	seat_seq number NOT NULL,
	-- 전표 생성시각(손님 첫 주문시각)
	sales_start date DEFAULT sysdate NOT NULL,
	-- 전표 마감시각(=결제받은시각), 0이거나 -1이면 현재 방문중인 고객으로 처리)
	sales_end date,
	-- 손님수
	sales_visitors number(2) NOT NULL,
	-- 메모- 개별 특이사항(주문시 배달장소, 예약시 손님명, 기타 특이사항 등)
	sales_memo varchar2(600),
	PRIMARY KEY (sales_state_seq)
);


-- 회원사의 점내 테이블정보
CREATE TABLE seat
(
	-- 일련번호
	seat_seq number NOT NULL,
	-- 일련번호
	comp_seq number NOT NULL,
	-- 각 테이블별 명칭 (e.g. 1,2,3...,룸1,룸2,홀1,홀2..,매,난,국,죽,배달1,배달2,포장1,포장2...
	seat_id varchar2(30) NOT NULL,
	PRIMARY KEY (seat_seq)
);


/* Create Foreign Keys */
ALTER TABLE board_comments
	ADD FOREIGN KEY (board_seq)
	REFERENCES board (board_seq)
;


ALTER TABLE cashonhand
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
;


ALTER TABLE employee
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
	ON DELETE CASCADE
;


ALTER TABLE expense
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
;


ALTER TABLE menu
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
;


ALTER TABLE sales_state
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
;


ALTER TABLE seat
	ADD FOREIGN KEY (comp_seq)
	REFERENCES company (comp_seq)
;


ALTER TABLE board
	ADD FOREIGN KEY (emp_seq)
	REFERENCES employee (emp_seq)
;


ALTER TABLE sales_detail
	ADD FOREIGN KEY (menu_seq)
	REFERENCES menu (menu_seq)
;


ALTER TABLE payment
	ADD FOREIGN KEY (sales_state_seq)
	REFERENCES sales_state (sales_state_seq)
	ON DELETE CASCADE -- 3월 28일 추가, sales_state가 삭제되면, 그에 종속된 sales_detail 도 함께 지워진다.
;


ALTER TABLE sales_detail
	ADD FOREIGN KEY (sales_state_seq)
	REFERENCES sales_state (sales_state_seq)
	ON DELETE CASCADE -- 3월 28일 추가, sales_state가 삭제되면, 그에 종속된 sales_detail 도 함께 지워진다.
;


ALTER TABLE sales_state
	ADD FOREIGN KEY (seat_seq)
	REFERENCES seat (seat_seq)
;


/* CREATE sequences */
create SEQUENCE comp_seqs start with 1 increment by 1 nocache;
create SEQUENCE emp_seqs start with 1 increment by 1 nocache;
create SEQUENCE seat_seqs start with 1 increment by 1 nocache;
create SEQUENCE menu_seqs start with 1 increment by 1 nocache;
create SEQUENCE board_seqs start with 1 increment by 1 nocache;
create SEQUENCE board_comments_seqs start with 1 increment by 1 nocache;
create SEQUENCE expense_seqs start with 1 increment by 1 nocache;
create SEQUENCE sales_state_seqs start with 1 increment by 1 nocache;
create SEQUENCE sales_detail_seqs start with 1 increment by 1 nocache;
create SEQUENCE cashonhand_seqs start with 1 increment by 1 nocache;
create SEQUENCE payment_seqs start with 1 increment by 1 nocache;

/* insert sample datas */
insert into company values(comp_seqs.nextval, '2048167238', '유진헬스케어', '02-2236-6966', '서울시 성동구 성수동', '지역2');
insert into company values(comp_seqs.nextval, '2040000000', 'SESOCGLOBAL', '02-555-5555', '서울시 강남구 삼성동', '지역2');
insert into company values(comp_seqs.nextval, '1234500000', '호정이네이남장', '043-222-2222', '충청남도 천안', '지역2');


insert into employee values(emp_seqs.nextval, 1, 'qwe', '123', 9, '전성민', '010-6545-5825', 'quiz1', 'answ1');
insert into employee values(emp_seqs.nextval, 2, 'asd', '123', 9, '웃기는놈들', '02-555-5555', 'quiz2', 'answ2');
insert into employee values(emp_seqs.nextval, 3, 'zxc', '123', 9, '이호정', '010-2222-2222', 'quiz3', 'answ3');

insert into seat values(seat_seqs.nextval, 1, '매');
insert into seat values(seat_seqs.nextval, 2, '룸1');
insert into seat values(seat_seqs.nextval, 3, '가가');
insert into seat values(seat_seqs.nextval, 1, '난');
insert into seat values(seat_seqs.nextval, 2, '룸2');
insert into seat values(seat_seqs.nextval, 3, '나나');
insert into seat values(seat_seqs.nextval, 1, '국');
insert into seat values(seat_seqs.nextval, 2, '룸3');
insert into seat values(seat_seqs.nextval, 3, '다다');
insert into seat values(seat_seqs.nextval, 1, '죽');

insert into menu values(menu_seqs.nextval, 1, 1, '판매중1', 1000, '카테1');
insert into menu values(menu_seqs.nextval, 2, 1, '짜장면', 2000, '식사');
insert into menu values(menu_seqs.nextval, 3, 1, '도련님도시락', 3000, '도시락');
insert into menu values(menu_seqs.nextval, 1, 1, '판매중2', 4000, '카테2');
insert into menu values(menu_seqs.nextval, 2, 1, '짬뽕', 5000, '식사');
insert into menu values(menu_seqs.nextval, 3, 1, '고기고기도시락', 6000, '도시락');
insert into menu values(menu_seqs.nextval, 1, 0, '판매중아님', 7000, '카테1');
insert into menu values(menu_seqs.nextval, 2, 1, '소주', 8000, '주류');
insert into menu values(menu_seqs.nextval, 3, 1, '생선생선도시락', 9000, '도시락');
insert into menu values(menu_seqs.nextval, 1, 1, '판매중3', 9500, '카테3');
insert into menu values(menu_seqs.nextval, 2, 1, '빼갈', 10000, '주류');

-- 3월 28일 
--insert into sales_state values(sales_state_seqs.nextval, 1, 1, sysdate, sysdate-1, 1, '[nothing yet]'); -- 유진(1번회사) 1번테이블에 손님이 들어옴
--insert into sales_detail values(sales_detail_seqs.nextval, 1, 4, 1, 0); -- 1번째 sales_state 판매중2(4번메뉴) 1개 주문등록, 할인 0
--insert into sales_state values(sales_state_seqs.nextval, 2, 5, sysdate, sysdate-1, 1, '[nothing yet]'); -- sesoc(2번회사) 2번째테이블(5번테이블)에 손님이 들어옴
--insert into sales_detail values(sales_detail_seqs.nextval, 2, 5, 1, 0); -- 2번째 sales_state에 짬뽕(5번메뉴) 1개 주문등록, 할인 0
--insert into sales_state values(sales_state_seqs.nextval, 3, 9, sysdate, sysdate-1, 1, '[nothing yet]'); -- 호정이(3번회사) 3번째테이블(9번테이블)에 손님이 들어옴
--insert into sales_detail values(sales_detail_seqs.nextval, 3, 9, 1, 0); -- 3번째 sales_state 생선생선도시락(9번메뉴) 1개 주문, 할인 0
-- 4월 1일 할인자료관리용 dummy company와 할인코드
insert into company values(-1, '0000000000', 'dummy', '00-000-0000', 'dummy', 'dummy');
insert into menu values(-1, -1, 1, '할인', 0, '공용');



commit;
show user;
