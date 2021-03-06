show databases;
/* 테이블 확인 */
desc members;

/* 테이블 확인 */
DROP TABLE MEMBERS;

/* member 테이블 생성 */
CREATE TABLE MEMBERS (
	mem_num			INT		    NOT NULL AUTO_INCREMENT 	PRIMARY KEY,	/* num */
	id 				VARCHAR(50) NOT NULL UNIQUE, 							/* 아이디 */
	pwd				VARCHAR(50) NOT NULL, 	 								/* 비밀번호 */
	name			VARCHAR(50) NOT NULL,	 								/* 이름 */
	imagePath		VARCHAR(50),						 					/* 이미지 */
	user_regr_id	VARCHAR(50) NOT NULL,									/* 유저 정보 등록자 아이디 */
	user_reg_dtime  DATETIME	DEFAULT CURRENT_TIMESTAMP,					/* 유저 정보 등록 일시 */
	user_modr_id	VARCHAR(50) NOT NULL,									/* 유저 정보 수정자 아이디 */
	user_mod_dtime	DATETIME    DEFAULT CURRENT_TIMESTAMP					/* 유저 정보 수정 일시 */
)

/* member 컬럼 생성 */
INSERT INTO MEMBERS (id, pwd, name, imagePath) VALUES('hhkim20', 'gusgml12', 'kim', 'logo.png');

/* member 컬럼 탐색 */
SELECT * FROM MEMBERS;

/* PROJECT 테이블 생성 */
CREATE TABLE PROJ_BOARD (
	proj_num		INT		    	NOT NULL AUTO_INCREMENT 	PRIMARY KEY,
	proj_title		VARCHAR(50) 	NOT NULL DEFAULT '프로젝트',
	proj_content	VARCHAR(500),
	proj_imagePath	VARCHAR(50),
	proj_regr_id	VARCHAR(50)		NOT NULL,
	proj_reg_dtime	DATETIME		DEFAULT CURRENT_TIMESTAMP,
	proj_modr_id	VARCHAR(50)		NOT NULL,
	proj_mod_dtime	DATETIME		DEFAULT CURRENT_TIMESTAMP,
	proj_disp_tf	BOOLEAN			NOT NULL  DEFAULT false
) ENGINE = InnoDB;

/* PROJECT 테이블 삭제 */
DROP TABLE PROJ_BOARD;

/* PROJECT 컬럼 생성 */
INSERT INTO PROJ_BOARD (proj_title,proj_writer,proj_content,proj_imagePath,proj_date,proj_disp_tf) 
				 VALUES('helloWorldPJ','hee', 'hello this is proj', 'logo.png', CURRENT_TIMESTAMP(),true);

INSERT INTO PROJ_BOARD (proj_writer,proj_content, proj_imagePath) VALUES('hyunhi7', 'hi', 'logo.png');

/* PROJECT 컬럼 탐색 */
select * from proj_board;


/* POST 테이블 생성 */
CREATE TABLE PROJ_POST_BOARD (
	post_num			INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	post_title  		VARCHAR(50),
	post_filePath		VARCHAR(50),
	post_fileOrgName	VARCHAR(100),
	post_fileSize		FLOAT, 
	post_content		VARCHAR(2000),
	post_regr_id		VARCHAR(50)		NOT NULL,	
	post_reg_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,
	post_modr_id		VARCHAR(50)		NOT NULL,	
	post_mod_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,	
	post_disp_tf		BOOLEAN			NOT NULL DEFAULT false,
	post_proj_num		INT,
	INDEX(post_proj_num),
	FOREIGN KEY(post_proj_num) REFERENCES PROJ_BOARD(proj_num) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE PROJ_POST_TAG (
	tag_num				INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tag_name			VARCHAR(50)		NOT NULL,
	tag_post_num		INT,
	tag_proj_num		INT,
	INDEX(tag_num)
	/*FOREIGN KEY(tag_post_num) REFERENCES PROJ_POST_BOARD(post_num) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(tag_proj_num) REFERENCES PROJ_POST_BOARD(post_proj_num) ON DELETE CASCADE ON UPDATE CASCADE*/
) ENGINE = InnoDB;


/* POST 테이블 삭제 */
DROP TABLE PROJ_POST_BOARD;
/* TAG 테이블 삭제 */
DROP TABLE PROJ_POST_TAG;	

/* POST 컬럼 생성 */
INSERT INTO PROJ_POST_BOARD (post_title, post_content, post_regr_id, post_modr_id, post_disp_tf, post_proj_num)
				VALUES ('hello', 'hello this is code','hyunhi7', 'hyunhi7',false, 20);

/*INSERT INTO POSTING (post_title, post_filePath, post_content, post_regr_id, post_modr_id, post_proj_num, tag_name, tag_post_num)
				SELECT
				p1.post_title, p1.post_filePath, p1.post_content, p1.post_regr_id, p1.post_modr_id, p1.post_proj_num,
				p2.tag_num, p2.tag_post_num
		FROM PROJ_POST_BOARD p1
		JOIN PROJ_POST_TAG p2 on p2.tag_post_num = p1.post_num*/

/* knowhow 테이블  */
CREATE TABLE KH_BOARD (
	kh_num			INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
	kh_title  		VARCHAR(50)		NOT NULL DEFAULT "노하우",
	kh_filePath		VARCHAR(50),
	kh_fileOrgName	VARCHAR(100),
	kh_fileSize		FLOAT, 
	kh_content		VARCHAR(2000),
	kh_regr_id		VARCHAR(50)		NOT NULL,	
	kh_reg_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,
	kh_modr_id		VARCHAR(50)		NOT NULL,	
	kh_mod_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,	
	kh_disp_tf		BOOLEAN			NOT NULL DEFAULT false
) ENGINE = InnoDB;
	
/* knowhow 태그 테이블 */
CREATE TABLE KH_TAG (
	tag_num				INT				NOT NULL AUTO_INCREMENT 	PRIMARY KEY,
	tag_name			VARCHAR(50)		NOT NULL,
	tag_kh_num		INT,
	INDEX(tag_num),
	FOREIGN KEY(tag_kh_num) REFERENCES KH_BOARD(kh_num) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;


/* knowhow 테이블 삭제 */
DROP TABLE KH_BOARD;
/* knowhow TAG 테이블 삭제 */
DROP TABLE KH_TAG;	

/* post 댓글 테이블 */
CREATE TABLE POST_CMT (
	cmt_num				INT				NOT NULL AUTO_INCREMENT 	PRIMARY KEY,
	cmt_imgPath			VARCHAR(50),
	cmt_content			VARCHAR(500),
	cmt_post_num		INT				NOT NULL,
	cmt_proj_num		INT				NOT NULL,
	cmt_regr_id			VARCHAR(50)		NOT NULL,	
	cmt_reg_dtime		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cmt_modr_id			VARCHAR(50)		NOT NULL,	
	cmt_mod_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,	
	cmt_disp_tf			BOOLEAN			NOT NULL DEFAULT false,	
	FOREIGN KEY(cmt_post_num) REFERENCES PROJ_POST_BOARD(post_num) ON DELETE CASCADE,
	FOREIGN KEY(cmt_proj_num) REFERENCES PROJ_POST_BOARD(post_proj_num) ON DELETE CASCADE
) ENGINE = InnoDB;

/* knowhow 댓글 테이블 */
CREATE TABLE KH_CMT (
	cmt_num				INT				NOT NULL AUTO_INCREMENT 	PRIMARY KEY,
	cmt_imgPath			VARCHAR(50),
	cmt_content			VARCHAR(500),
	cmt_kh_num			INT,
	cmt_regr_id			VARCHAR(50)		NOT NULL,	
	cmt_reg_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,
	cmt_modr_id			VARCHAR(50)		NOT NULL,	
	cmt_mod_dtime		DATETIME		DEFAULT CURRENT_TIMESTAMP,	
	cmt_disp_tf			BOOLEAN			NOT NULL DEFAULT false,		
	FOREIGN KEY(cmt_kh_num) REFERENCES KH_BOARD(kh_num) ON DELETE CASCADE
) ENGINE = InnoDB;


/* post 댓글 삭제 */
DROP TABLE POST_CMT;
/* knowhow 댓글 삭제 */
DROP TABLE KH_CMT;	
