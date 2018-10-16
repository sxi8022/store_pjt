CREATE TABLE IF NOT EXISTS `USER` (
    `USER_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '유저번호',
    `USER_ID` VARCHAR(12) NOT NULL COMMENT '아이디',
    `USER_PWD` VARCHAR(30) NOT NULL COMMENT '비밀번호',
    `NAME` VARCHAR(20) NOT NULL COMMENT '이름',
    `PHONE` VARCHAR(12) NOT NULL COMMENT '전화번호',
    `EMAIL` VARCHAR(40) NOT NULL COMMENT '이메일',
    `BIRTH` DATE NULL COMMENT '생일',
    `ADDRESS` VARCHAR(400) NOT NULL COMMENT '사용자주소',
    `USER_STAT` INT(1) NOT NULL DEFAULT 1 COMMENT '계정활성화상태',
    `JOIN_DATE`	TIMESTAMP NOT NULL DEFAULT NOW() COMMENT '가입일시',
    `USER_MOD_DATE` TIMESTAMP NULL COMMENT '개인정보수정일시',
    `GENDER` VARCHAR(5) NOT NULL COMMENT '성별',
    `POINTS`	INT(10)	NOT NULL DEFAULT 0 COMMENT '포인트',
    `RATING`	VARCHAR(10)	NULL DEFAULT '' COMMENT '구매등급',
    CONSTRAINT UNIQUE(`USER_ID`),
    PRIMARY KEY(`USER_CODE`)
);
    
CREATE TABLE IF NOT EXISTS `COUPON` (
    `CP_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '쿠폰번호(기본키)',
    `CP_STR_DATE` TIMESTAMP NOT NULL COMMENT '쿠폰유효기간시작일시',
    `CP_END_DATE` TIMESTAMP NOT NULL COMMENT '쿠폰유효기간종료일시',
    `CP_NAME` VARCHAR(60) NOT NULL COMMENT '쿠폰이름',
    `CP_PERCENT` INT(10) NOT NULL COMMENT '쿠폰할인율',
    PRIMARY KEY(`CP_CODE`)
);
    
CREATE TABLE IF NOT EXISTS `COUPON_LIST` (
    `CPL_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '보유쿠폰번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `CP_CODE` INT(10) NOT NULL COMMENT '쿠폰번호(외래키)',
    `CPL_USE_YN` BOOLEAN NOT NULL COMMENT '쿠폰사용여부',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    FOREIGN KEY(`CP_CODE`) REFERENCES `COUPON` (`CP_CODE`),
    PRIMARY KEY(`CPL_CODE`)
);

CREATE TABLE IF NOT EXISTS `AUTH_USER` (
    `USER_CODE` INT(10) NOT NULL COMMENT '유저코드(기본키/식별관계)',
    `AUTH_CODE` VARCHAR(10) NOT NULL COMMENT '인증코드',
    `AUTH_TYPE` VARCHAR(10) NOT NULL COMMENT '인증유형/예: 구글 이메일',
    `AUTH_ID` VARCHAR(12) NOT NULL COMMENT '인증계정번호',
    `AUTH_EMAIL` VARCHAR(40) NOT NULL COMMENT '인증이메일',
    `AUTH_CONN_DATE` TIMESTAMP NOT NULL COMMENT '로그인일시',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`USER_CODE`)
);

CREATE TABLE IF NOT EXISTS `ADMIN` (
    `AD_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '관리자번호',
    `AD_ID`	VARCHAR(12)	NOT NULL COMMENT 'ID',
    `AD_PWD` VARCHAR(30) NOT NULL COMMENT '비밀번호',
    `AD_AUTH` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '관리자권한',
    `AD_NAME` VARCHAR(20) NOT NULL COMMENT '이름',
    `AD_VISIT_DATE` TIMESTAMP NULL COMMENT '접속일시',
    CONSTRAINT UNIQUE(`AD_ID`),
    PRIMARY KEY(`AD_CODE`)
);

CREATE TABLE IF NOT EXISTS `QNA` (
    `QNA_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'QNA번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `QNA_TITLE` VARCHAR(200) NOT NULL COMMENT '제목',
    `QNA_CONT` VARCHAR(1000) NULL COMMENT '내용',
    `QNA_GRP` INT(8) NOT NULL DEFAULT 0 COMMENT '글그룹',
    `QNA_GRP_SEQ` INT(8) NOT NULL DEFAULT 0 COMMENT '글그룹순서',
    `QNA_DEPTH` INT(8) NOT NULL DEFAULT 0 COMMENT '글단계',
    `QNA_HIT` INT(10) NOT NULL DEFAULT 0 COMMENT '조회수',
    `QNA_YN` BOOLEAN NOT NULL DEFAULT false COMMENT '답변여부',
    `QNA_STR_DATE` TIMESTAMP NOT NULL DEFAULT NOW() COMMENT '등록일시',
    `QNA_MOD_DATE` TIMESTAMP NULL COMMENT '수정일시',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`QNA_CODE`)
);

CREATE TABLE IF NOT EXISTS `FAQ` (
    `FAQ_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'FAQ번호(기본키)',
    `AD_CODE` INT(10) NOT NULL COMMENT '관리자번호(외래키)',
    `FAQ_TITLE` VARCHAR(200) NOT NULL COMMENT '제목',
    `FAQ_CONT` VARCHAR(1000) NOT NULL COMMENT '내용',
    `FAQ_CATE` VARCHAR(200) NOT NULL COMMENT '카테고리/답변종류_계정및상품',
    FOREIGN KEY(`AD_CODE`) REFERENCES `ADMIN` (`AD_CODE`),
    PRIMARY KEY(`FAQ_CODE`)
);

CREATE TABLE IF NOT EXISTS `SELLER` (
    `SEL_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '판매자번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `SEL_ID`	VARCHAR(12)	NOT NULL COMMENT '판매자ID',
	`SEL_PWD`	VARCHAR(30)	NOT NULL COMMENT '판매자비밀번호',
    `SEL_OWNER_CODE` INT(11) NULL COMMENT '사업자번호',
    `SEL_JOIN_STAT` INT(2) NOT NULL DEFAULT 1 COMMENT '가입상태/유저가 판매자 등록을 했을경우 1:가입, 2:탈퇴',
    `SEL_CREDIT` INT(10) NOT NULL DEFAULT 0 COMMENT '신용도/정상적으로 판매를 했을 경우 올라가는 판매자 포인트 점수',
    `SEL_TYPE` INT(1) NOT NULL DEFAULT 1 COMMENT '판매자구분/1:개인판매자, 2:사업자 판매자(구현 난이도 때문에 개인판매자만 진행 보류)',
    `SEL_NAME` VARCHAR(50) NULL COMMENT '판매자이름',
    `SEL_ORI_ADDR` VARCHAR(400) NOT NULL COMMENT '출고지주소',
    `SEL_RTN_ADDR` VARCHAR(400) NOT NULL DEFAULT '' COMMENT '반품지수조',
    `SEL_PHONE` VARCHAR(12) NOT NULL COMMENT '전화번호',
    `SEL_SHP_CHARGE` VARCHAR(200) NOT NULL DEFAULT 'POST_01'COMMENT '배송비부담/1.판매자 부담: 주문수량에 관계없이 판매자가 배송비를 100% 부담합니다., 2.구매자 부담: 기본 배송비(2600원)/도서산간배송비(4300원), 3.무료배송',
    `SEL_JOIN_DATE`	TIMESTAMP NULL DEFAULT NOW() COMMENT '가입일시' ,
	`SEL_MOD_DATE`	TIMESTAMP NULL COMMENT '수정일시',
    CONSTRAINT UNIQUE(`SEL_ID`),
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`SEL_CODE`)
);

CREATE TABLE IF NOT EXISTS `REFUND` (
    `REF_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '환불번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `SEL_CODE` INT(10) NOT NULL COMMENT '판매자번호(외래키)',
    `REF_PRICE` INT(11) NOT NULL COMMENT '환불금액',
    `REF_DATE` TIMESTAMP NOT NULL COMMENT '환불일시',
	FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    FOREIGN KEY(`SEL_CODE`) REFERENCES `SELLER` (`SEL_CODE`),
    PRIMARY KEY(`REF_CODE`)
);

CREATE TABLE IF NOT EXISTS `PAYMENT` (
    `PAY_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '결제번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `SEL_CODE` INT(10) NOT NULL COMMENT '판매자번호(외래키)',
    `PAY_TYPE` VARCHAR(20) NOT NULL COMMENT '결제수단',
    `PAY_PRICE` INT(11) NOT NULL COMMENT '결제금액',
    `PAY_DATE` TIMESTAMP NOT NULL COMMENT '결제일시',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    FOREIGN KEY(`SEL_CODE`) REFERENCES `SELLER` (`SEL_CODE`),
    PRIMARY KEY(`PAY_CODE`)
);

CREATE TABLE IF NOT EXISTS `POST` (
    `POST_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '배송번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `SEL_CODE` INT(10) NOT NULL COMMENT '판매자번호(외래키)',
    `POST_STR_DATE` TIMESTAMP NOT NULL DEFAULT NOW() COMMENT '발송일시',
    `POST_END_DATE` TIMESTAMP NULL COMMENT '수령일시',
    `POST_TYPE` VARCHAR(10) NOT NULL COMMENT '배송방식',
    `POST_PRICE` INT(11) NOT NULL COMMENT '배송료',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    FOREIGN KEY(`SEL_CODE`) REFERENCES `SELLER` (`SEL_CODE`),
    PRIMARY KEY(`POST_CODE`)
);

/*
	대분류 카테고리 lft, rgt 값 범위
	카테고리명				lft			rgt
-----------------------------------------------
	전체메뉴				1			182
    음반					2			25
    게임					26			45
    공연					46			57
    영화					58			83
    EBOOK					84			111				
    외국도서				112			137
    국내도서				138			181
*/
CREATE TABLE IF NOT EXISTS `CATEGORY` (
	`CAT_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '카테고리번호(기본키)',
    `CAT_NAME` VARCHAR(20) NOT NULL COMMENT '카테고리명',
	`CAT_LFT` INT(10) NOT NULL DEFAULT 0 COMMENT '하위카테고리 시작범위',
    `CAT_RGT` INT(10) NOT NULL DEFAULT 0 COMMENT '하위카테고리 종료범위',
    PRIMARY KEY(`CAT_CODE`)
);

CREATE TABLE IF NOT EXISTS `GOODS` (
    `GDS_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '상품번호(기본키)',
    `CAT_CODE` INT(10) NOT NULL COMMENT '카테고리번호(외래키)',
    `SEL_CODE` INT(10) NOT NULL COMMENT '판매자번호(외래키)',
    `GDS_NAME` VARCHAR(300) NOT NULL COMMENT '상품명',
    `GDS_COMPANY` VARCHAR(300) NOT NULL COMMENT '제작회사 혹은 출판사',
    `GDS_MADEBY` VARCHAR(300) NULL COMMENT '제작자혹은 글쓴이',
    `GDS_DESC` VARCHAR(500) NULL COMMENT '상품 상세 설명',
    `GDS_PRICE` INT(11) NOT NULL COMMENT '가격',
    `GDS_CNT` INT(10) NOT NULL COMMENT '재고',
    `GDS_SEL_YN` BOOLEAN NOT NULL DEFAULT TRUE COMMENT '상품판매가능여부',
    `GDS_HIT` INT(10) NOT NULL DEFAULT 0 COMMENT '상품조회수',
    `GDS_STR_DATE` TIMESTAMP NOT NULL COMMENT '상품등록일시',
    `GDS_MOD_DATE` TIMESTAMP NULL COMMENT '상품수정일시',
    FOREIGN KEY(`CAT_CODE`) REFERENCES `CATEGORY` (`CAT_CODE`),
    FOREIGN KEY(`SEL_CODE`) REFERENCES `SELLER` (`SEL_CODE`),
    PRIMARY KEY(`GDS_CODE`)
);

 CREATE TABLE IF NOT EXISTS `GOODS_IMAGES` (
    `GDS_IMG_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '이미지번호(기본키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품번호(외래키)',
    `GDS_IMG_NAME` VARCHAR(200) NOT NULL COMMENT '이미지이름',
    `GDS_IMG_URL` VARCHAR(400) NOT NULL COMMENT '이미지저장경로',
    `GDS_IMG_SEQ` INT(2) NOT NULL COMMENT '상품이미지순서',
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    PRIMARY KEY(`GDS_IMG_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `GOODS_OPT` (
    `OPT_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '상품옵션번호(기본키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품번호(외래키)',
    `OPT_NAME` VARCHAR(60) NOT NULL COMMENT '옵션명',
    `OPT_PRICE` INT(11) NOT NULL COMMENT '옵션가',
    `OPT_CNT` INT(10) NOT NULL COMMENT '수량',
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    PRIMARY KEY(`OPT_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `FAVORITES` (
    `FAV_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '즐겨찾기번호(기본키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품번호(외래키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`FAV_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `CART` (
    `CART_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '장바구니번호(기본키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품번호(외래키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`CART_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `ORDERS` (
    `ORD_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '주문번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `ORD_PRICE` INT(11) NOT NULL COMMENT '합계금액',
    `ORD_CNT` INT(10) NOT NULL DEFAULT 0 COMMENT '총수량',
    `ORD_STAT` INT(1) NOT NULL DEFAULT 0 COMMENT '주문상태',
    `ORD_DATE` TIMESTAMP NOT NULL COMMENT '주문일시',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    PRIMARY KEY(`ORD_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `ORDER_ITEM` (
    `ORD_ITEM_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '주문상품번호(기본키)',
    `ORD_CODE` INT(10) NOT NULL COMMENT '주문번호(외래키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품(외래키)',
    `ORD_ITEM_DTL_PRICE` INT(11) NOT NULL COMMENT '상세가격',
    `ORD_ITEM_NAME` VARCHAR(300) NOT NULL COMMENT '상품명',
    `ORD_ITEM_CNT` INT(10) NOT NULL COMMENT '수량',
    FOREIGN KEY(`ORD_CODE`) REFERENCES `ORDERS` (`ORD_CODE`),
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    PRIMARY KEY(`ORD_ITEM_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `GOODS_REVIEW` (
    `REV_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '후기번호(기본키)',
    `USER_CODE` INT(10) NOT NULL COMMENT '유저번호(외래키)',
    `GDS_CODE` INT(10) NOT NULL COMMENT '상품(외래키)',
    `REV_TITLE` VARCHAR(200) NOT NULL COMMENT '제목',
    `REV_CONT` VARCHAR(1000) NULL COMMENT '내용',
    `REV_YN` BOOLEAN NOT NULL COMMENT '후기비밀글여부',
    `REV_PWD` VARCHAR(30) NULL COMMENT '비공개시 비밀번호',
    `REV_REG_DATE` TIMESTAMP NOT NULL COMMENT '후기등록일시',
    `REV_MOD_DATE` TIMESTAMP NULL COMMENT '후기수정일시',
    `REV_RATING` INT(2) NULL COMMENT '평점',
    `REV_REFS` INT(10) NULL COMMENT '추천',
    FOREIGN KEY(`USER_CODE`) REFERENCES `USER` (`USER_CODE`),
    FOREIGN KEY(`GDS_CODE`) REFERENCES `GOODS` (`GDS_CODE`),
    PRIMARY KEY(`REV_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `REVIEW_IMAGES` (
    `REV_IMG_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '후기이미지번호(기본키)',
    `REV_CODE` INT(10) NOT NULL COMMENT '후기번호(외래키)',
    `REV_IMG_URL` VARCHAR(400) NOT NULL COMMENT '후기이미지경로',
    `REV_IMG_NAME` VARCHAR(200) NOT NULL COMMENT '후기이미지이름',
    FOREIGN KEY(`REV_CODE`) REFERENCES `GOODS_REVIEW` (`REV_CODE`),
    PRIMARY KEY(`REV_IMG_CODE`)
 );
 
 CREATE TABLE IF NOT EXISTS `EVENTS` (
	`EVENT_CODE` INT(10) NOT NULL AUTO_INCREMENT COMMENT '이벤트번호',
	`EVENT_TITLE` VARCHAR(200) NULL COMMENT '이벤트이름',
	`EVNET_CONTENT` VARCHAR(1000) NULL COMMENT '이벤트내용',
	`EVENT_RATE` INT(10)	NOT NULL default 0 COMMENT '할인율',
	`EVENT_STR_DATE` TIMESTAMP NULL	COMMENT '이벤트시작일시',
	`EVENT_END_DATE` TIMESTAMP NULL	COMMENT '이벤트종료일시',
	`EVENT_TYPE` VARCHAR(20)	 NULL	COMMENT '이벤트종류(1.출석2.상품할인NULL.없음)',
	`EVENT_RANGE` VARCHAR(200) NULL	COMMENT '이벤트적용범위(카테고리,판매자)',
    PRIMARY KEY(`EVENT_CODE`)
);

-- 유저 샘플 추가 
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user001','rose1024#', '하명희','01012301024','user001@naver.com','서울특별시 강남구 강남대로 338 (역삼동, 서울빌딩) 3층', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user002','rose1025#', '김은겸','01012311025','user002@naver.com','서울특별시 은평구 연서로43길 16-15 (불광동, 갈현근린공원 관리사무소)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user003','rose1026#', '이은겸','01012321026','user003@naver.com','서울특별시 중랑구 봉우재로20길 58 (면목동)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user004','rose1027#', '박은안','01012331027','user004@naver.com','전라북도 군산시 팔마로 80 (서흥남동, 서구건업)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user005','rose1028#', '차은용','01012341028','user005@naver.com','대전광역시 대덕구 문평동로48번길 80 (문평동, 서구산업)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user006','rose1029#', '성은익','01012351029','user006@naver.com','대구광역시 남구 대명복개로1길 38 (대명동, 대구광역시 달성교육청)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user007','rose1030#', '주은상','01012361030','user007@naver.com','부산광역시 동래구 사직로 77 (사직동, 부산광역시 체육회관)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user008','rose1031#', '이은준','01012371031','user008@naver.com','경기도 평택시 평택로57번길 3 (평택동, 평택아케이드)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user009','rose1032#', '석은서','01012381032','user009@naver.com','제주특별자치도 제주시 고산동산5길 44 (이도2동, 안성빌라)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user010','rose1033#', '주은성','01012391033','user010@naver.com','경기도 안양시 동안구 시민대로 233 (관양동, 안양시의회)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user011','rose1034#', '이은수','01012401034','user011@naver.com','전라남도 영광군 영광읍 중앙로3길 6-10 (영광읍, 영광군 청소년문화센터)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user012','rose1035#', '김은섭','01012411035','user012@naver.com','전라남도 나주시 완사천길 18 (송월동, 나주시산림조합)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user013','rose1036#', '최은재','01012421036','user013@naver.com','강원도 홍천군 홍천읍 홍천로 677 (홍천읍, 홍천군농업기술센터)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user014','rose1037#', '지은준','01012431037','user014@naver.com','강원도 고성군 죽왕면 문암항길 61 (죽왕면, 속초민박)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user015','rose1038#', '나은찬','01012441038','user015@naver.com','경기도 김포시 김포한강11로 455 (운양동, 김포시에코센터)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user016','rose1039#', '류은채','01012451039','user016@naver.com','경기도 수원시 영통구 광교호수로 278 (하동, 수원시 연화장)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user017','rose1040#', '추은산','01012461040','user017@naver.com','강원도 양양군 양양읍 양양로 9-5 (양양읍, 양양군보건소)', 0);
INSERT INTO USER (USER_ID, USER_PWD, NAME, PHONE, EMAIL, ADDRESS, GENDER) VALUES ('user018','rose1041#', '제은석','01012471041','user018@naver.com','서울특별시 광진구 구천면로 20 (광장동, 광진구공연장)', 0);

-- 관리자 샘플 추가
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_AUTH, AD_NAME) VALUES ('ADMIN01','1234','SERVER','MANA'); 
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_NAME) VALUES ('ADMIN03','1234','YJJ'); 
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_NAME) VALUES ('ADMIN04','1234','SUWAN'); 
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_NAME) VALUES ('ADMIN05','1234','HASEO'); 
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_NAME) VALUES ('ADMIN06','1234','SMITH'); 
INSERT INTO ADMIN(AD_ID, AD_PWD, AD_NAME) VALUES ('ADMIN07','1234','SHARPCODING'); ; 

-- 판매자 샘플 추가 
INSERT INTO SELLER (USER_CODE, SEL_ID,SEL_PWD, SEL_NAME, SEL_ORI_ADDR, SEL_PHONE) VALUES (1,'user001','rose1024#', '플라워','서울특별시 강남구 강남대로 338 (역삼동, 서울빌딩) 3층','01012301024');
INSERT INTO SELLER (USER_CODE, SEL_ID,SEL_PWD, SEL_NAME, SEL_ORI_ADDR, SEL_PHONE) VALUES (2,'user002','rose1025#', '멋진서점','서울특별시 은평구 연서로43길 16-15 (불광동, 갈현근린공원 관리사무소)','01012301025');
INSERT INTO SELLER (USER_CODE, SEL_ID,SEL_PWD, SEL_NAME, SEL_ORI_ADDR, SEL_PHONE) VALUES (3,'user003','rose1026#', '레이티켓','서울특별시 중랑구 봉우재로20길 58 (면목동)','01012301025');

-- 카테고리 샘플 추가 
-- safe mode 헤제 
SET SQL_SAFE_UPDATES = 0 ;

INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES ('전체메뉴',1,2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('국내도서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('외국도서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('EBOOK', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('영화', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('공연', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('게임', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='전체메뉴';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('음반', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('가정/생활', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('건강', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('시사/상식', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('경제/경영', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('언어/사전', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('대학교제', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('만화', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('문학', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('사회/정치', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('여행', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('역사/문화', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('어린이', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자기개발', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자연과학', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('학습참고서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('IT', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('잡지', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('종교', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('예술', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자격증', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='국내도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('기타', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('어린이', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('문학', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('ELT·사전', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('일본도서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('경제·인문', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('실용·예술', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('대학·전문서적', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('컴퓨터', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('해외잡지', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('해외원서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('학습교구/게임', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='외국도서';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자기계발', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('소설', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('에세이', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자기계발', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('인문/역사', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('예술/종교', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('자연/사회과학', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('가정/취미/건강', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('학습서', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('어학', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('대학교재', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('만화', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('어린이/청소년', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='EBOOK';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('잡지', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('최신/미개봉', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('한국영화', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('공포/스릴러', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('SF/판타지', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('전쟁/무협', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('코미디', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('액션', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('멜로', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('드라마', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('고전', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('유아', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='영화';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('기타', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='공연';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('콘서트', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='공연';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('뮤지컬', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='공연';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('클래식/무용/국악', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='공연';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('전시/행사', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='공연';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('가족/어린이', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('최신게임', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('고전게임', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('액션', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('FPS', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('전략/시뮬', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('RPG/모험', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('스포츠', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('게임기기', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='게임';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('기타', @myLeft + 1, @myLeft + 2);

SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('가요', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('클래식', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('POP', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('ROCK', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('재즈', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('OST', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('뮤비', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('어린이', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('종교음악', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('국악', @myLeft + 1, @myLeft + 2);
SELECT @myLeft := cat_lft FROM category WHERE cat_name ='음반';
UPDATE category SET cat_rgt = cat_rgt + 2 WHERE cat_rgt > @myLeft;
UPDATE category SET cat_lft = cat_lft + 2 WHERE cat_lft > @myLeft;
INSERT INTO category(cat_name, cat_lft, cat_rgt) VALUES('세계음악', @myLeft + 1, @myLeft + 2);

-- 상품 샘플 추가 
INSERT INTO GOODS (CAT_CODE, SEL_CODE, GDS_NAME, GDS_COMPANY, GDS_MADEBY, GDS_PRICE, GDS_CNT) VALUES (38, 1, '정의란무엇인가','마이클 센델','와이즈베리', 17000, 1);
INSERT INTO GOODS (CAT_CODE, SEL_CODE, GDS_NAME, GDS_COMPANY, GDS_MADEBY, GDS_PRICE, GDS_CNT) VALUES (14, 1, '삼대','문학과지성사 ','염상섭', 10800, 2);
INSERT INTO GOODS (CAT_CODE, SEL_CODE, GDS_NAME, GDS_COMPANY, GDS_MADEBY, GDS_PRICE, GDS_CNT) VALUES(22, 1, 'java의정석', '도우출판', '남궁성', 30000, 10);

-- 상품 이미지 추가 url = goods/판매자id/상품id/파일명
INSERT INTO GOODS_IMAGES (GDS_CODE, GDS_IMG_NAME, GDS_IMG_URL, GDS_IMG_SEQ) VALUES (1,'justice_book','goods/1/1/justice_book.jpg',1);
INSERT INTO GOODS_IMAGES (GDS_CODE, GDS_IMG_NAME, GDS_IMG_URL, GDS_IMG_SEQ) VALUES (1,'justice_book2','goods/1/1/justice_book2.png',2);
INSERT INTO GOODS_IMAGES (GDS_CODE, GDS_IMG_NAME, GDS_IMG_URL, GDS_IMG_SEQ) VALUES (2,'samdae_book','goods/1/2/samdae_book.jpg', 1);
INSERT INTO GOODS_IMAGES (GDS_CODE, GDS_IMG_NAME, GDS_IMG_URL, GDS_IMG_SEQ) VALUES (3,'jungsuck_book','goods/1/3/jungsuck_book.jpg', 1);

-- 테이블 삭제 쿼리 
/*
drop table if exists COUPON_LIST;
drop table if exists COUPON;
drop table if exists QNA;
drop table if exists FAQ;
drop table if exists ADMIN;
drop table if exists AUTH_USER;
drop table if exists REFUND;
drop table if exists PAYMENT;
drop table if exists POST;
drop table if exists GOODS_IMAGES;
drop table if exists GOODS_OPT;
drop table if exists FAVORITES;
drop table if exists CART;
drop table if exists ORDER_ITEM;
drop table if exists ORDERS;
drop table if exists REVIEW_IMAGES;
drop table if exists GOODS_REVIEW;
drop table if exists GOODS;
drop table if exists CATEGORY;
drop table if exists SELLER;
drop table if exists rosefinchdb.USER;
drop table if exists EVENTS;
*/