
CREATE TABLE AUTH_NAMES
(
  AUTH_NAME VARCHAR(200) NOT NULL COMMENT '접근권한명',
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '접근권한명';

CREATE TABLE AUTHS
(
  UNIQUE_ID_USERS      VARCHAR(200) NOT NULL COMMENT '대표값',
  UNIQUE_ID_AUTH_NAMES VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID_USERS, UNIQUE_ID_AUTH_NAMES)
) COMMENT '권한들';

CREATE TABLE USERS
(
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '대표값',
  NAME      VARCHAR(200) NOT NULL COMMENT '이름',
  PASSWORD  VARCHAR(200) NOT NULL COMMENT '암호화',
  EMAIL     VARCHAR(200) NOT NULL COMMENT '이메일',
  JOB       VARCHAR(200) NULL     COMMENT '직책',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '사용자들';

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_USERS_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID_USERS)
    REFERENCES USERS (UNIQUE_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_AUTH_NAMES_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID_AUTH_NAMES)
    REFERENCES AUTH_NAMES (UNIQUE_ID);