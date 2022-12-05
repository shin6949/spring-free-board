CREATE TABLE `user` (
    `internal_id` bigint(11) NOT NULL COMMENT '내부 분류 아이디' PRIMARY KEY auto_increment,
    `username` varchar(50) NOT NULL COMMENT '로그인 할 때 사용할 것' UNIQUE,
    `name` varchar(20) NOT NULL,
    `password` varchar(150) NOT NULL,
    `email` varchar(150) unique
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `profile`
    `id` bigint(11) NOT NULL PRIMARY KEY auto_increment,
    `user_id` bigint(11) NOT NULL,
    `nickname` varchar(100) NOT NULL UNIQUE,
    `profile_image` varchar(150) NULL DEFAULT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `user` (`internal_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `article` (
    `id` bigint(11) NOT NULL PRIMARY KEY auto_increment,
    `author_id` bigint(11) NOT NULL,
    `content` text NOT NULL,
    `created_at` datetime NOT NULL DEFAULT now(),
    `view_count` int(9) NOT NULL DEFAULT 0 COMMENT '조회수',
    FOREIGN KEY (`author_id`) REFERENCES `user` (`internal_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `comment` (
    `id` bigint(11) NOT NULL PRIMARY KEY auto_increment,
    `author_id` bigint(11) NOT NULL,
    `article_id` bigint(11) NOT NULL,
    `content` varhcar(1000) NOT NULL,
    `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '답글인지 아닌지',
    `created_at` datetime NOT NULL DEFAULT now(),
    FOREIGN KEY (`author_id`) REFERENCES `user` (`internal_id`),
    FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;