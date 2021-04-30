DROP TABLE CALENDARPLUG
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CALPLUG;

CREATE TABLE CALENDARPLUG(
    SEQ NUMBER(8) PRIMARY KEY,
    ID VARCHAR2(50) NOT NULL,
    SLEVEL NUMBER(8),
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    STARTDATE VARCHAR2(20) NOT NULL,
    ENDDATE VARCHAR2(20),
    WDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_CALPLUG
START WITH 1
INCREMENT BY 1;

ALTER TABLE CALENDARPLUG
ADD CONSTRAINT FK_CALPLUG_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);


INSERT INTO calendarplug(SEQ,ID,SLEVEL,TITLE,CONTENT,STARTDATE,ENDDATE,WDATE)
VALUES (SEQ_CALPLUG.nextval, 'aaa', 1, '사업 미팅', '제품 계약서 건', '2021-04-05T12:30', '', SYSDATE);


INSERT INTO calendarplug(SEQ,ID,SLEVEL,TITLE,CONTENT,STARTDATE,ENDDATE,WDATE)
VALUES (SEQ_CALPLUG.nextval, 'aaa', 1, '국내 여행', '대포항', '2021-04-26T08:30', '2021-04-30T16:00', SYSDATE);


INSERT INTO calendarplug(SEQ,ID,SLEVEL,TITLE,CONTENT,STARTDATE,ENDDATE,WDATE)
VALUES (SEQ_CALPLUG.nextval, 'aaa', 1, '밥', '점심', '2021-04-18', '', SYSDATE);


INSERT INTO calendarplug(SEQ,ID,SLEVEL,TITLE,CONTENT,STARTDATE,ENDDATE,WDATE)
VALUES (SEQ_CALPLUG.nextval, 'aaa', 1, '연수', '워크숍', '2021-05-02', '', SYSDATE);



SELECT SEQ, ID, SLEVEL, TITLE, CONTENT, STARTDATE, ENDDATE, WDATE
	FROM CALENDARPLUG
	WHERE ID='aaa';
    
commit;


SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE 
FROM 
(SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(RDATE, 1, 8)ORDER BY RDATE ASC) AS RNUM,
SEQ, ID, TITLE, CONTENT, RDATE, WDATE
FROM CALENDAR
WHERE ID='aaa' AND SUBSTR(RDATE, 1, 8)='20210421')
ORDER BY RDATE ASC;
