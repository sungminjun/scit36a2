// Team MANEKINEKO from SCIT 36A2, KITA-SES@Coex, Seoul
Choi, Chulkyu __ 최철규 (autumnsky1014@naver.com) __ server-side/ board and POS
Jun, Sungmin __ 전성민 (sungminjunkr@gmail.com) __ leader, front-side/ POS and server-side/ member, board, POS 
Kim, Yookyeong __ 김유경 (madamnurse43@gmail.com) __ server-side/ member and report
Lee, Yeongchang __ 이영창 (clvh753@naver.com) __ front-side/ POS, board, member
Lee, Hojung __ 이호정 (jos5050@naver.com) __ front-side/ report and server-side/ report

// speical thanks to : Jung 'kokoronotomo' JaeSung for fix on-delete-cascade happening.

// 팀원들을 위한 readme file입니다. 간략설명
먼저 DB세팅을 진행하고, 이후에 sample data를 입력하시기 바랍니다.
sample 계정은 hong/123 으로 6개월간의 매출, 판매내역, 지출 관련 정보가 있습니다.
sample_xls_datas.zip 에는 카드매출 누락관련 기능에 대한 검증용 샘플데이터가 있습니다.

// sample data 입력순서 
(1) minnano_pos_rev190401v6.sql
(2) payment-sample-data_v4_6months.sql
(3) sample_xls_datas.zip

// DB settings -- create-pos-account-on-oracle11g
conn system/oracle
show user
create user pos identified by pos default tablespace system
-- drop user pos cascade
-- create user pos identified by pos;
-- grant connect, resource, dba to pos;
-- GRANT UNLIMITED TABLESPACE TO pos;
disconn
conn pos/pos

// 기본설정해둔 project default set
(1)pom.xml
	버전설정
		java-version	1.8
		org.springframework-version	4.3.17.RELEASE
		org.aspectj-version	1.9.2
		org.slf4j-version	1.7.25
	DI추가
		mybatis, mybatis-spring, spring-jdbc
(2)web.xml
	한글필터링 추가
(3) root-context.xml
	DB연결설정, bean 추가
(4) WEB-INF/lib/ojdbc6.jar, resources/jquery 추가 
(5) Java Buildpath 1.8, facet 1.8 설정
(6) DB연결용 mybatis-config.xml, db.properties 추가
(7) readme.txt 추가 : DB계정 pos/pos 생성
(8) gitignore 설정
(9) minnano_pos_rev190312v4.sql 추가
(10) DB 테이블에 따라 기본 vo 추가: 11개
	Board_comments, Board, 
	Cashonhand, Payment, Sales_detail, Sales_state,
	Company, Employee, Expense, Menu, Seat
(11) mybatis-config.xml에 vo용 alias선언
(12) Repository-DAO-Mapper.xml의 분류처리 
Board > Board, Board_comments 접근 : 게시판 관리
Member > Seat, Menu, Company, Employee 접근 : 멤버별 정보 관리
Sales >	Cashonhand, Payment, Sales_detail, Sales_state, Expense : 매출, 수입과 지출에 대한 정보관리
(13) interceptor bean 설정 및 prehandle 오버라이드
