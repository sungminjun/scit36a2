/**	리드미	**/

// create-pos-account-on-oracle11g
conn system/oracle
show user
create user pos identified by pos default tablespace system
grant connect, resource to pos
disconn
conn pos/pos

기본설정해둔 project default set
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

to-do
(14) 프론트단 파일명과 이름, 기능 작성해서 devhome에 list화 시키고
(15) devhome 관리용 db/페이지 작성할것인지 검토할 것