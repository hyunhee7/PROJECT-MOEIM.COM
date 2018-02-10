/* Service 관련 DB 전체 삭제 후 재생성 */


/* post 댓글 삭제 */
DROP TABLE POST_CMT;

/* knowhow 댓글 삭제 */
DROP TABLE KH_CMT;	

/* knowhow TAG 테이블 삭제 */
DROP TABLE KH_TAG;	

/* knowhow 테이블 삭제 */
DROP TABLE KH_BOARD;

/* TAG 테이블 삭제 */
DROP TABLE PROJ_POST_TAG;	

/* POST 테이블 삭제 */
DROP TABLE PROJ_POST_BOARD;

/* PROJECT 테이블 삭제 */
DROP TABLE PROJ_BOARD;

/* PROJECT 테이블 생성 */
CREATE TABLE PROJ_BOARD (
	proj_num		INT		    	NOT NULL AUTO_INCREMENT 	PRIMARY KEY,
	proj_title		VARCHAR(50) 	NOT NULL DEFAULT '프로젝트',
	proj_writer		VARCHAR(50)		NOT NULL,
	proj_content	VARCHAR(500),
	proj_imagePath	VARCHAR(50),
	proj_date		DATETIME		DEFAULT CURRENT_TIMESTAMP,
	proj_disp_tf	BOOLEAN			NOT NULL  DEFAULT false
) ENGINE = InnoDB;


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