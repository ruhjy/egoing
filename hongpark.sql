-- users 테이블 생성
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- PK 선언(SERIAL : 자동 생성 타입)
	nickname VARCHAR(50),
	email VARCHAR(100)
);
-- users 조회
SELECT * FROM users;

-- users 레코드 등록
INSERT INTO 
  users (nickname, email)
VALUES
  ('cloudstudying_kr', 'mail@cloudstudying.kr'),
  ('hongpark_cs', 'sehongpark@cloudstudying.kr'),
  ('haesamq', 'haesamq@naver.com'),
  ('hjy', 'hjy123@naver.com')
;
-- photos 테이블 생성
CREATE TABLE photos (
	id SERIAL PRIMARY KEY, -- PK
	filename VARCHAR(255),
	user_id INTEGER REFERENCES users(id) -- FK : 사진 게시자의 PK 연결
);

-- photos user 레코드 등록
INSERT INTO 
  photos (filename, user_id)
VALUES
  ('cat-on-road.jpg', 1),
  ('sunset-over-the-ocean.jpg', 1),
  ('andromeda-galaxy.jpg', 1),
  ('white.tiger.jpg', 2),
  ('nero-the-black-cat.jpg', 2),
  ('computer.jpg', 4)
;

-- photos 조회
SELECT * FROM photos;

-- comments 테이블 생성
CREATE TABLE "comments" (
	id SERIAL PRIMARY KEY, -- PK
	body VARCHAR(1000),
	user_id INTEGER REFERENCES users(id), -- FK: 댓글 생성자
	photo_id INTEGER REFERENCES photos(id) -- FK: 댓글이 달린 사진
);
-- comments 레코드 생성
INSERT INTO 
  "comments" (body, user_id, photo_id)
VALUES
  ('mewo', 1, 1),
  ('nyaong', 2, 1),
  ('냐옹', 3, 1),
  ('sunset', 1, 2),
  ('falling slowly', 2, 2),
  ('Andromeda galaxy', 1, 3),
  ('mysteriouse..!', 3, 3),
  ('hello real world!!', 4, 4)
;
-- comments 테이블 조회
SELECT * FROM "comments";