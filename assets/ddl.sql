CREATE TABLE `user` (
    `internal_id` bigint(20) NOT NULL COMMENT '내부 분류 아이디' PRIMARY KEY auto_increment,
    `username` varchar(30) NOT NULL UNIQUE COMMENT '로그인 할 때 사용할 것',
    `name` varchar(20) NOT NULL,
    `password` varchar(256) NOT NULL COMMENT 'SHA256',
    `email` varchar(320) NOT NULL COMMENT '이메일 ID 부분은 최대 64자 + @ + 도메인은 255자까지 320자',
    `role` varchar(15) NOT NULL COMMENT 'For Spring Security'
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `profile` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `user_id` bigint(20) NOT NULL,
    `nickname` varchar(15) NOT NULL UNIQUE COMMENT '닉네임 15자 제한',
    `profile_image` varchar(36) NULL DEFAULT NULL COMMENT 'UUID는 36글자로 구성',
    FOREIGN KEY (`user_id`) REFERENCES `user` (`internal_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `article` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `author_id` bigint(20) NOT NULL,
    `title` varchar(50) NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
    FOREIGN KEY (`author_id`) REFERENCES `user` (`internal_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `comment` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `author_id` bigint(20) NOT NULL,
    `article_id` bigint(20) NOT NULL,
    `content` varchar(1000) NOT NULL,
    `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '답글인지 아닌지',
    `created_at` datetime NOT NULL DEFAULT now(),
    FOREIGN KEY (`author_id`) REFERENCES `user` (`internal_id`),
    FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `reply_index` (
   `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
   `root_comment_id` bigint(20) NOT NULL,
   `to_reply_comment_id` bigint(20) NOT NULL,
   `order` int(11) NOT NULL DEFAULT 1 COMMENT '순서',
   FOREIGN KEY (`root_comment_id`) REFERENCES `comment` (`id`),
   FOREIGN KEY (`to_reply_comment_id`) REFERENCES `comment` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `attachment_index` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `original_filename` varchar(256) NOT NULL COMMENT '파일 이름 최대 256자',
    `renamed_filename` varchar(36) NOT NULL COMMENT 'UUID는 36글자로 구성',
    `article_id` bigint(20) NOT NULL,
    FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `article_like` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `user_id` bigint(20) NOT NULL,
    `article_id` bigint(20) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `user` (`internal_id`),
    FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `comment_like` (
    `id` bigint(20) NOT NULL PRIMARY KEY auto_increment,
    `user_id` bigint(20) NOT NULL,
    `comment_id` bigint(20) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `user` (`internal_id`),
    FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE VIEW `article_view` AS (
    SELECT a.id AS `id`, a.content AS `content`, a.created_at AS `created_at`,
           a.view_count AS `view_count`, a.author_id AS `author_id`, p.nickname AS `nickname`,
           (SELECT count(*) AS count FROM article_like WHERE article_like.article_id = a.id) AS `like_count`
    FROM article a
    JOIN profile p
    ON a.author_id = p.user_id
);

CREATE VIEW `comment_view` AS (
    SELECT c.id AS `id`, c.content AS `content`, c.is_reply AS `is_reply`,
           c.created_at AS `created_at`, p.nickname AS 'nickname',
           (SELECT count(*) FROM comment_like WHERE comment_like.comment_id = c.id) AS `like_count`
    FROM comment c
    JOIN profile p
    ON c.author_id = p.user_id
);