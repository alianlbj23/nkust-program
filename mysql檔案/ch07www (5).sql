-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2022-03-08 13:30:01
-- 伺服器版本： 5.7.36
-- PHP 版本： 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `ch07www`
--

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add game', 1, 'add_game'),
(2, 'Can change game', 1, 'change_game'),
(3, 'Can delete game', 1, 'delete_game'),
(4, 'Can view game', 1, 'view_game'),
(5, 'Can add game mod', 2, 'add_gamemod'),
(6, 'Can change game mod', 2, 'change_gamemod'),
(7, 'Can delete game mod', 2, 'delete_gamemod'),
(8, 'Can view game mod', 2, 'view_gamemod'),
(9, 'Can add sort_term_memory', 3, 'add_sort_term_memory'),
(10, 'Can change sort_term_memory', 3, 'change_sort_term_memory'),
(11, 'Can delete sort_term_memory', 3, 'delete_sort_term_memory'),
(12, 'Can view sort_term_memory', 3, 'view_sort_term_memory'),
(13, 'Can add store_point', 4, 'add_store_point'),
(14, 'Can change store_point', 4, 'change_store_point'),
(15, 'Can delete store_point', 4, 'delete_store_point'),
(16, 'Can view store_point', 4, 'view_store_point'),
(17, 'Can add userdata', 5, 'add_userdata'),
(18, 'Can change userdata', 5, 'change_userdata'),
(19, 'Can delete userdata', 5, 'delete_userdata'),
(20, 'Can view userdata', 5, 'view_userdata'),
(21, 'Can add user name', 6, 'add_username'),
(22, 'Can change user name', 6, 'change_username'),
(23, 'Can delete user name', 6, 'delete_username'),
(24, 'Can view user name', 6, 'view_username'),
(25, 'Can add time store', 7, 'add_timestore'),
(26, 'Can change time store', 7, 'change_timestore'),
(27, 'Can delete time store', 7, 'delete_timestore'),
(28, 'Can view time store', 7, 'view_timestore'),
(29, 'Can add attention', 8, 'add_attention'),
(30, 'Can change attention', 8, 'change_attention'),
(31, 'Can delete attention', 8, 'delete_attention'),
(32, 'Can view attention', 8, 'view_attention'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add content type', 13, 'add_contenttype'),
(50, 'Can change content type', 13, 'change_contenttype'),
(51, 'Can delete content type', 13, 'delete_contenttype'),
(52, 'Can view content type', 13, 'view_contenttype'),
(53, 'Can add session', 14, 'add_session'),
(54, 'Can change session', 14, 'change_session'),
(55, 'Can delete session', 14, 'delete_session'),
(56, 'Can view session', 14, 'view_session'),
(57, 'Can add orientation', 15, 'add_orientation'),
(58, 'Can change orientation', 15, 'change_orientation'),
(59, 'Can delete orientation', 15, 'delete_orientation'),
(60, 'Can view orientation', 15, 'view_orientation'),
(61, 'Can add chat', 16, 'add_chat'),
(62, 'Can change chat', 16, 'change_chat'),
(63, 'Can delete chat', 16, 'delete_chat'),
(64, 'Can view chat', 16, 'view_chat'),
(65, 'Can add chat message', 17, 'add_chatmessage'),
(66, 'Can change chat message', 17, 'change_chatmessage'),
(67, 'Can delete chat message', 17, 'delete_chatmessage'),
(68, 'Can view chat message', 17, 'view_chatmessage');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$SH8awHBF9uGc6MCGkRkNBV$HEXLkADv6qA5wIx5PingRdsfPZzGLkUU53Baf/D9Gho=', '2022-02-09 21:38:59.502724', 1, 'robot', '', '', 'robot@gmial.com', 1, 1, '2021-10-26 13:08:06.198702');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `chats_chat`
--

DROP TABLE IF EXISTS `chats_chat`;
CREATE TABLE IF NOT EXISTS `chats_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `chat_messages_chatmessage`
--

DROP TABLE IF EXISTS `chat_messages_chatmessage`;
CREATE TABLE IF NOT EXISTS `chat_messages_chatmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick` varchar(120) NOT NULL,
  `text` longtext NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_messages_chatmessage_chat_id_3e8894f9` (`chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-10-26 16:24:27.244482', '3', '2', 1, '[{\"added\": {}}]', 8, 1),
(2, '2021-10-26 16:24:42.690157', '4', '8', 1, '[{\"added\": {}}]', 8, 1),
(3, '2021-10-26 16:32:01.152679', '5', '88', 1, '[{\"added\": {}}]', 8, 1),
(4, '2021-11-23 03:13:56.741427', '1', 'sort_term_memory', 3, '', 2, 1),
(5, '2021-11-23 16:01:31.957770', '3', '注意力遊戲', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 1, 1),
(6, '2021-11-23 16:02:27.278837', '1', '短期記憶遊戲', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 1, 1),
(7, '2021-11-24 22:18:23.228354', '1', '短期記憶遊戲', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 1, 1),
(8, '2021-11-27 02:28:10.179474', '2', '定向力遊戲', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 1, 1),
(9, '2021-11-27 12:43:27.370200', '6', '4', 3, '', 15, 1),
(10, '2021-11-27 12:43:27.372194', '5', '4', 3, '', 15, 1),
(11, '2021-11-27 12:43:27.372194', '4', '4', 3, '', 15, 1),
(12, '2021-11-27 12:43:27.373192', '3', '4', 3, '', 15, 1),
(13, '2021-11-27 12:43:27.373192', '2', '4', 3, '', 15, 1),
(14, '2021-11-27 12:43:27.373192', '1', '4', 3, '', 15, 1),
(15, '2021-11-27 12:59:42.641310', '6', 'Orientation', 3, '', 2, 1),
(16, '2021-11-27 12:59:42.645332', '2', 'attention', 3, '', 2, 1),
(17, '2021-11-29 13:55:38.464928', '45', '2021-11-29 13:50:13.771716+00:00', 3, '', 3, 1),
(18, '2021-11-29 13:55:38.465925', '44', '2021-11-29 13:50:13.759844+00:00', 3, '', 3, 1),
(19, '2021-11-29 13:55:38.465925', '43', '2021-11-29 13:50:13.645698+00:00', 3, '', 3, 1),
(20, '2021-11-29 13:55:38.466922', '42', '2021-11-29 13:49:46.434630+00:00', 3, '', 3, 1),
(21, '2021-11-29 13:55:38.467529', '41', '2021-11-29 13:49:46.422750+00:00', 3, '', 3, 1),
(22, '2021-11-29 13:55:38.467983', '40', '2021-11-29 13:49:46.226026+00:00', 3, '', 3, 1),
(23, '2021-11-29 13:55:38.467983', '39', '2021-11-29 13:42:25.728336+00:00', 3, '', 3, 1),
(24, '2021-11-29 13:55:38.468972', '38', '2021-11-29 13:42:25.715325+00:00', 3, '', 3, 1),
(25, '2021-11-29 13:55:38.469328', '37', '2021-11-29 13:42:25.490711+00:00', 3, '', 3, 1),
(26, '2021-11-30 04:57:26.689914', '16', '2', 3, '', 15, 1),
(27, '2021-11-30 04:57:26.693054', '15', '4', 3, '', 15, 1),
(28, '2021-11-30 04:57:26.693054', '14', '1', 3, '', 15, 1),
(29, '2021-12-07 02:59:25.985717', '2', '定向力遊戲', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 1, 1),
(30, '2021-12-20 05:13:20.519642', '2', '定向力遊戲', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'robot', 'game'),
(2, 'robot', 'gamemod'),
(3, 'robot', 'sort_term_memory'),
(4, 'robot', 'store_point'),
(5, 'robot', 'userdata'),
(6, 'robot', 'username'),
(7, 'robot', 'timestore'),
(8, 'robot', 'attention'),
(9, 'admin', 'logentry'),
(10, 'auth', 'permission'),
(11, 'auth', 'group'),
(12, 'auth', 'user'),
(13, 'contenttypes', 'contenttype'),
(14, 'sessions', 'session'),
(15, 'robot', 'orientation'),
(16, 'chats', 'chat'),
(17, 'chat_messages', 'chatmessage');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-26 13:07:18.946591'),
(2, 'auth', '0001_initial', '2021-10-26 13:07:19.023589'),
(3, 'admin', '0001_initial', '2021-10-26 13:07:19.290876'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-26 13:07:19.358960'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-26 13:07:19.364938'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-26 13:07:19.411990'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-26 13:07:19.436708'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-26 13:07:19.458851'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-26 13:07:19.464834'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-26 13:07:19.486932'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-26 13:07:19.488793'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-26 13:07:19.496725'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-26 13:07:19.519833'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-26 13:07:19.543768'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-26 13:07:19.570884'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-26 13:07:19.578863'),
(17, 'robot', '0001_initial', '2021-10-26 13:07:19.708325'),
(18, 'sessions', '0001_initial', '2021-10-26 13:07:19.815933'),
(19, 'robot', '0002_auto_20211026_2243', '2021-10-26 14:43:35.767461'),
(20, 'robot', '0003_auto_20211123_1137', '2021-11-23 03:37:32.230497'),
(21, 'robot', '0004_auto_20211125_1405', '2021-11-25 06:05:42.099425'),
(22, 'robot', '0005_orientation', '2021-11-27 08:19:26.929332'),
(23, 'robot', '0006_orientation_costtime', '2021-11-27 12:41:22.610537'),
(24, 'robot', '0007_auto_20211129_2214', '2021-11-29 14:14:57.325942'),
(25, 'robot', '0008_auto_20211129_2223', '2021-11-29 14:23:19.569888'),
(26, 'auth', '0012_alter_user_first_name_max_length', '2021-12-13 14:13:53.584515'),
(27, 'robot', '0009_alter_attention_id_alter_game_id_alter_gamemod_id_and_more', '2021-12-13 14:13:54.664358'),
(28, 'robot', '0010_orientation_memorytime', '2022-01-19 16:14:42.294959'),
(29, 'robot', '0011_sort_term_memory_memorytime', '2022-01-20 10:19:18.358720'),
(30, 'chats', '0001_initial', '2022-01-21 11:26:22.531566'),
(31, 'chat_messages', '0001_initial', '2022-01-21 11:26:22.660608');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4k7ddq5p0js4g8vbtnpfs9i9k40lgbnd', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-11-09 13:08:12.771865'),
('qeh5ztxhdt32jrywt6pqbu2gqao7r8x7', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-06 16:17:06.188917'),
('nfumuu81pi486wgbw3vps4vquc94de3j', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-08 12:33:30.944962'),
('yj8k5g650qfl7kvdezy6qtig3jwsx57j', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-08 09:07:20.011059'),
('sv81t5rshaeo1ou027a5nlkaq0kfxr8n', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-11 02:27:05.470582'),
('i36kmwtj1gkgg5u74y5izg5ipdro0an1', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-14 04:57:15.030961'),
('dz5vri48pheujk5n757verlabwevxkct', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-20 07:33:16.762200'),
('9kuvgox48yjqjqryidbsuvvn8e0yitm2', 'Yzc1NGNkMDQwZWFlZGY2Y2ZjYjhmMmEzNzFhNmYyNjI2NThjYzYzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmIwNDRjYWE3ODg4ZjViMDk5MGQzZGYwZDNmZGMwMTI5MmEzYmM3In0=', '2021-12-21 02:52:22.361059'),
('2k5cy4oprcbw82hae88v60tq4hlfs7b3', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1mx41l:_7MtM_priRk2fxfPaPcH16pE5mTxKXUAvma9CG6Cbn4', '2021-12-28 09:23:17.587650'),
('1goxjs0g3vb7hpu9on0vhlf7nnf4vl0k', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1mzAfa:A0r2CRyA0Yaj2ooPwQUMUVZ4EXT3-3xDx4FexLlc6X4', '2022-01-03 04:53:06.651017'),
('oq7obj1snx7uv1you62sn1i89wirdug2', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1n1jwH:ge9vooIHtRxjK-bsGe75AKwZtB2l3ALCn5guiegyz-Y', '2022-01-10 14:56:57.166829'),
('o07u8ece3yjdq32dw7mdjbqz8hzhr7cv', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1n217M:6wGJ7AI_WFq2aWgfsmXcyxd8evJvFIV-1Gs6l0c_UoU', '2022-01-11 09:17:32.369771'),
('rfhnoqmkfla939yy6vugj10wce8tksbd', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1n4bzz:V-XIFqPLZ7tOPUyfCRPG551Rw6l6uRlPaLpjrbx_3xI', '2022-01-18 13:04:39.677400'),
('5g4e4yz7t44p9nwsx8iew0ij8hn6nhlr', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1nA68P:fOusn1EWDr4KcZzM6MsxwA2X147ZxpR1KntQcIUioKo', '2022-02-02 16:16:01.100221'),
('01jczzpbrjikks3mo7q49r0inequu8gx', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1nAkZh:m6ajEZZrz4_2bhtNTyq7Pn_9e8Oc7AZskiE-OjhQyuc', '2022-02-04 11:26:53.790450'),
('lo35weaiug4vu5fixueqtjzwz35373d7', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWWpx-N8L0yG0HfMd2m2Wa27pMJHdFHrTL68z5eTncv4OKvX7rYok9eLYjGKsgFaU9IwVnnMHiFAPoDJjy6DjBQARBJ8vGI2MYrBPvD-PaN_8:1nHnBT:xn88-Jr_rph7kZAGVbXpiZOV6ZYJzgzqhXeC-cS8oSc', '2022-02-23 21:38:59.510734');

-- --------------------------------------------------------

--
-- 資料表結構 `robot_attention`
--

DROP TABLE IF EXISTS `robot_attention`;
CREATE TABLE IF NOT EXISTS `robot_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_rate` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `mod_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_attention_mod_id_14121720` (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_attention`
--

INSERT INTO `robot_attention` (`id`, `correct_rate`, `add_time`, `mod_id`) VALUES
(52, 100, '2022-01-04 17:16:16.255095', 5),
(24, 66, '2021-12-01 06:19:38.369469', 5),
(23, 100, '2021-12-01 04:44:38.145255', 5),
(22, 100, '2021-12-01 04:33:11.073311', 5),
(21, 100, '2021-11-30 18:49:59.840308', 14),
(20, 66, '2021-11-30 16:25:36.700322', 9),
(19, 33, '2021-11-30 16:17:02.512145', 5),
(9, 100, '2021-11-23 15:00:31.106076', 5),
(10, 100, '2021-11-23 15:08:17.297066', 5),
(11, 66, '2021-11-23 15:08:37.677979', 5),
(12, 33, '2021-11-23 15:09:20.160276', 5),
(13, 33, '2021-11-23 15:09:45.133021', 5),
(14, 66, '2021-11-23 15:10:12.436216', 5),
(15, 66, '2021-11-23 17:16:31.197249', 5),
(16, 33, '2021-11-23 17:19:29.919363', 5),
(17, 100, '2021-11-23 17:31:56.220917', 5),
(18, 100, '2021-11-24 09:17:01.845802', 5),
(26, 100, '2021-12-06 07:21:00.335931', 5),
(27, 66, '2021-12-07 03:09:50.046928', 21),
(28, 0, '2021-12-07 03:38:30.454984', 5),
(29, 0, '2021-12-07 03:42:17.750673', 5),
(30, 0, '2021-12-07 03:58:20.906119', 5),
(31, 56, '2021-12-07 13:49:08.223449', 5),
(32, 89, '2021-12-07 13:50:35.295363', 5),
(33, 100, '2021-12-07 13:50:54.585495', 5),
(34, 89, '2021-12-07 16:20:43.428373', 5),
(35, 89, '2021-12-07 16:21:50.784044', 5),
(36, 66, '2021-12-07 16:22:12.139717', 5),
(37, 89, '2021-12-08 02:55:26.503190', 21),
(38, 66, '2021-12-08 02:56:37.911063', 21),
(39, 89, '2021-12-08 02:57:13.521284', 21),
(51, 100, '2022-01-04 17:15:56.534283', 5),
(50, 100, '2022-01-04 17:12:17.521353', 5),
(49, 56, '2021-12-28 09:30:19.436941', 34),
(48, 89, '2021-12-28 09:18:46.384832', 31),
(45, 100, '2021-12-20 06:23:54.832599', 5),
(46, 0, '2021-12-27 14:37:56.453329', 5),
(47, 0, '2021-12-27 14:40:38.998938', 5),
(53, 79, '2022-01-04 17:16:36.472872', 5);

-- --------------------------------------------------------

--
-- 資料表結構 `robot_game`
--

DROP TABLE IF EXISTS `robot_game`;
CREATE TABLE IF NOT EXISTS `robot_game` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_game`
--

INSERT INTO `robot_game` (`id`, `title`, `text`) VALUES
(1, '短期記憶遊戲', '等等會出現3張圖片5秒，請依接下來的指示操作'),
(2, '定向力遊戲', '首先會有四個範例色塊出現5秒，請將接下來出現的圖形依照對應的顏色，放入對的格子。'),
(3, '注意力遊戲', '發現音頻中有異音時，請按下按鈕'),
(4, '老歌懷舊搶答遊戲', '首先會先聽10秒鐘的副歌，聽完後請點擊按鈕');

-- --------------------------------------------------------

--
-- 資料表結構 `robot_gamemod`
--

DROP TABLE IF EXISTS `robot_gamemod`;
CREATE TABLE IF NOT EXISTS `robot_gamemod` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_mod` varchar(30) NOT NULL,
  `username_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_gamemod_username_id_5259caab` (`username_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_gamemod`
--

INSERT INTO `robot_gamemod` (`id`, `game_mod`, `username_id`) VALUES
(5, 'AttentionGame', 2),
(4, 'SortTermMemoryGame', 2),
(8, 'SortTermMemoryGame', 35),
(7, 'OrientationGame', 2),
(9, 'AttentionGame', 35),
(10, 'OrientationGame', 35),
(11, 'SortTermMemoryGame', 34),
(12, 'SortTermMemoryGame', 37),
(13, 'OrientationGame', 37),
(14, 'AttentionGame', 37),
(33, 'OrientationGame', 53),
(32, 'SortTermMemoryGame', 53),
(19, 'SortTermMemoryGame', 45),
(20, 'OrientationGame', 45),
(21, 'AttentionGame', 45),
(29, 'SortTermMemoryGame', 52),
(30, 'OrientationGame', 52),
(31, 'AttentionGame', 52),
(34, 'AttentionGame', 53),
(35, 'SortTermMemoryGame', 54),
(36, 'OrientationGame', 54),
(37, 'AttentionGame', 54),
(38, 'OrientationGame', 48);

-- --------------------------------------------------------

--
-- 資料表結構 `robot_orientation`
--

DROP TABLE IF EXISTS `robot_orientation`;
CREATE TABLE IF NOT EXISTS `robot_orientation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_rate` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `mod_id` bigint(20) NOT NULL,
  `costTime` int(11) NOT NULL,
  `memoryTime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_orientation_mod_id_e99f8f7e` (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `robot_orientation`
--

INSERT INTO `robot_orientation` (`id`, `correct_rate`, `add_time`, `mod_id`, `costTime`, `memoryTime`) VALUES
(23, 66, '2021-11-30 14:13:15.858977', 7, 11, 1),
(22, 4, '2021-11-30 14:10:47.235191', 7, 6, 1),
(21, 4, '2021-11-30 04:59:21.676340', 7, 6, 1),
(20, 4, '2021-11-30 04:58:55.260887', 7, 6, 1),
(19, 4, '2021-11-30 04:58:54.307981', 7, 5, 1),
(18, 4, '2021-11-30 04:58:08.395317', 7, 4, 1),
(17, 1, '2021-11-30 04:57:43.035770', 7, 5, 1),
(24, 4, '2021-11-30 14:13:50.939955', 7, 5, 1),
(25, 4, '2021-11-30 14:13:51.374264', 7, 6, 1),
(26, 0, '2021-11-30 14:16:16.209018', 7, 6, 1),
(27, 0, '2021-11-30 14:18:32.863932', 7, 5, 1),
(28, 100, '2021-11-30 14:20:12.264766', 7, 5, 1),
(29, 66, '2021-11-30 14:26:19.017049', 7, 8, 1),
(30, 100, '2021-11-30 14:29:39.366318', 7, 6, 1),
(31, 100, '2021-11-30 14:29:41.397865', 7, 8, 1),
(32, 66, '2021-11-30 16:15:47.010670', 7, 9, 1),
(33, 66, '2021-11-30 16:15:49.046377', 7, 11, 1),
(34, 66, '2021-11-30 16:26:49.041676', 10, 27, 1),
(35, 100, '2021-11-30 16:27:11.351134', 7, 5, 1),
(36, 100, '2021-11-30 16:31:06.854206', 7, 6, 1),
(37, 100, '2021-11-30 16:38:00.213701', 7, 5, 1),
(38, 100, '2021-11-30 16:42:38.206386', 10, 11, 1),
(39, 100, '2021-11-30 16:43:52.427703', 10, 17, 1),
(40, 100, '2021-11-30 16:47:43.583866', 10, 11, 1),
(41, 100, '2021-11-30 16:48:49.789735', 10, 14, 1),
(42, 100, '2021-11-30 16:50:35.788542', 10, 8, 1),
(43, 100, '2021-11-30 16:51:02.739502', 10, 7, 1),
(44, 100, '2021-11-30 18:49:11.742836', 13, 8, 1),
(45, 100, '2021-11-30 18:57:10.541680', 13, 9, 1),
(46, 100, '2021-11-30 18:57:12.677064', 13, 11, 1),
(47, 100, '2021-11-30 18:57:13.276005', 13, 12, 1),
(48, 100, '2021-11-30 19:10:05.068634', 13, 9, 1),
(49, 100, '2021-11-30 19:10:06.596676', 13, 11, 1),
(50, 33, '2021-12-01 04:29:06.569632', 7, 18, 1),
(51, 100, '2021-12-01 04:30:23.724243', 7, 17, 1),
(52, 100, '2021-12-01 05:32:19.514360', 7, 13, 1),
(53, 100, '2021-12-01 05:33:04.879409', 7, 14, 1),
(56, 100, '2021-12-01 06:26:11.651172', 7, 12, 1),
(55, 100, '2021-12-01 06:18:56.986754', 7, 5, 1),
(57, 66, '2021-12-01 06:31:28.971034', 7, 6, 1),
(61, 100, '2021-12-06 07:22:29.871799', 7, 6, 1),
(62, 66, '2021-12-06 10:27:16.647076', 20, 17, 1),
(63, 100, '2021-12-06 10:27:46.950391', 20, 7, 1),
(64, 100, '2021-12-07 03:09:14.883843', 20, 6, 1),
(65, 100, '2021-12-07 03:09:19.157624', 20, 10, 1),
(123, 66, '2022-01-18 16:45:54.622924', 36, 10, 1),
(122, 100, '2022-01-04 15:14:58.850168', 7, 5, 1),
(121, 100, '2022-01-04 15:11:33.180312', 7, 10, 1),
(120, 66, '2022-01-04 15:05:51.829333', 7, 17, 1),
(119, 33, '2022-01-04 15:05:23.262157', 7, 4, 1),
(118, 33, '2022-01-04 15:05:21.884532', 7, 3, 1),
(117, 0, '2022-01-04 15:01:41.246334', 7, 2, 1),
(116, 0, '2022-01-04 14:55:51.853981', 7, 29, 1),
(115, 100, '2022-01-04 13:38:14.731591', 7, 7, 1),
(114, 100, '2022-01-04 13:38:12.252486', 7, 4, 1),
(113, 100, '2022-01-04 13:37:56.593514', 7, 5, 1),
(112, 66, '2022-01-04 13:32:49.158662', 7, 9, 1),
(111, 100, '2022-01-04 13:32:26.380366', 7, 6, 1),
(110, 0, '2022-01-04 13:27:09.385720', 7, 6, 1),
(109, 100, '2022-01-04 13:23:04.331459', 7, 8, 1),
(108, 100, '2021-12-29 02:46:27.805285', 7, 10, 1),
(107, 33, '2021-12-28 09:29:56.490309', 33, 9, 1),
(97, 66, '2021-12-20 05:10:16.344991', 7, 10, 1),
(106, 100, '2021-12-28 09:18:24.066203', 30, 5, 1),
(99, 66, '2021-12-20 06:23:13.404376', 7, 12, 1),
(100, 33, '2021-12-22 12:32:31.877201', 7, 8, 1),
(101, 33, '2021-12-22 12:35:45.240504', 7, 6, 1),
(102, 100, '2021-12-27 14:36:35.385390', 7, 4, 1),
(103, 100, '2021-12-27 14:36:54.540187', 7, 5, 1),
(104, 100, '2021-12-27 14:37:10.832759', 7, 4, 1),
(105, 100, '2021-12-27 14:37:27.444015', 7, 6, 1),
(124, 0, '2022-01-19 16:15:45.052017', 36, 8, 12),
(125, 100, '2022-01-19 16:22:39.216059', 36, 5, 3),
(126, 100, '2022-01-19 16:22:41.049326', 36, 7, 3),
(127, 100, '2022-01-19 16:22:42.049483', 36, 8, 3),
(128, 100, '2022-01-19 16:22:42.721583', 36, 9, 3),
(129, 100, '2022-01-19 16:22:42.815188', 36, 9, 3),
(130, 100, '2022-01-19 16:22:42.981491', 36, 9, 3),
(131, 100, '2022-01-19 16:22:43.131744', 36, 9, 3),
(132, 100, '2022-01-19 16:22:45.541148', 36, 12, 3),
(133, 100, '2022-01-19 16:22:45.678630', 36, 12, 3),
(134, 100, '2022-01-19 16:22:45.804365', 36, 12, 3),
(135, 100, '2022-01-19 16:22:45.912653', 36, 12, 3),
(136, 100, '2022-01-19 16:22:46.022916', 36, 12, 3),
(137, 100, '2022-01-19 16:22:46.587964', 36, 13, 3),
(138, 100, '2022-01-19 16:22:46.745971', 36, 13, 3),
(139, 100, '2022-01-19 16:22:46.884293', 36, 13, 3),
(140, 100, '2022-01-19 16:22:47.013553', 36, 13, 3),
(141, 100, '2022-01-19 16:22:47.139333', 36, 13, 3),
(142, 100, '2022-01-19 16:22:47.264017', 36, 14, 3),
(143, 100, '2022-01-19 16:22:47.387856', 36, 14, 3),
(144, 100, '2022-01-19 16:22:47.497925', 36, 14, 3),
(145, 100, '2022-01-19 16:23:00.746014', 36, 5, 1),
(146, 100, '2022-01-19 16:23:01.306736', 36, 6, 1),
(147, 100, '2022-01-19 16:23:01.445347', 36, 6, 1),
(148, 100, '2022-01-19 16:23:01.585613', 36, 6, 1),
(149, 100, '2022-01-19 16:23:01.679995', 36, 6, 1),
(150, 100, '2022-01-19 16:23:01.788782', 36, 6, 1),
(151, 100, '2022-01-19 16:23:01.912239', 36, 6, 1),
(152, 100, '2022-01-19 16:23:02.425629', 36, 7, 1),
(153, 100, '2022-01-19 16:23:02.596717', 36, 7, 1),
(154, 100, '2022-01-19 16:23:02.739153', 36, 7, 1),
(155, 100, '2022-01-19 16:23:05.129043', 36, 10, 1),
(156, 100, '2022-01-19 16:23:05.443619', 36, 10, 1),
(157, 100, '2022-01-19 16:23:05.613771', 36, 10, 1),
(158, 100, '2022-01-19 16:23:05.704537', 36, 10, 1),
(159, 100, '2022-01-19 16:23:05.812666', 36, 10, 1),
(160, 100, '2022-01-19 16:23:05.923709', 36, 10, 1),
(161, 100, '2022-01-19 16:23:06.049121', 36, 10, 1),
(162, 100, '2022-01-19 16:23:06.156089', 36, 11, 1),
(163, 100, '2022-01-19 16:23:06.281305', 36, 11, 1),
(164, 100, '2022-01-19 16:23:06.390738', 36, 11, 1),
(165, 100, '2022-01-19 16:23:23.954942', 36, 5, 4),
(166, 0, '2022-01-19 16:24:35.495550', 36, 7, 4),
(167, 100, '2022-01-19 16:24:51.161094', 36, 4, 2),
(168, 100, '2022-01-19 16:25:03.525542', 36, 5, 2),
(169, 0, '2022-01-19 21:36:22.664498', 36, 28, 2),
(170, 0, '2022-01-19 21:36:23.651063', 36, 29, 2),
(171, 0, '2022-01-19 21:36:24.281534', 36, 30, 2),
(172, 0, '2022-01-19 21:36:24.420208', 36, 30, 2),
(173, 0, '2022-01-19 21:36:24.557527', 36, 30, 2),
(174, 0, '2022-01-19 21:36:24.704302', 36, 30, 2),
(175, 0, '2022-01-19 21:36:25.305816', 36, 31, 2),
(176, 0, '2022-01-19 21:36:25.559809', 36, 31, 2),
(177, 0, '2022-01-19 21:36:25.792149', 36, 31, 2),
(178, 0, '2022-01-19 21:36:26.118849', 36, 32, 2),
(179, 0, '2022-01-19 21:36:26.406652', 36, 32, 2),
(180, 0, '2022-01-19 21:36:26.744780', 36, 32, 2),
(181, 0, '2022-01-19 21:36:27.036145', 36, 32, 2),
(182, 0, '2022-01-19 21:36:37.999532', 36, 43, 2),
(183, 0, '2022-01-19 21:36:38.288292', 36, 44, 2),
(184, 0, '2022-01-19 21:36:38.490050', 36, 44, 2),
(185, 0, '2022-01-19 21:36:38.734620', 36, 44, 2),
(186, 0, '2022-01-19 21:36:38.916610', 36, 44, 2),
(187, 0, '2022-01-19 21:36:39.096820', 36, 45, 2),
(188, 0, '2022-01-19 21:36:39.339713', 36, 45, 2),
(189, 0, '2022-01-19 21:36:39.547090', 36, 45, 2),
(190, 0, '2022-01-19 21:36:39.746785', 36, 45, 2),
(191, 0, '2022-01-19 21:36:39.981716', 36, 45, 2),
(192, 0, '2022-01-19 21:36:40.194553', 36, 46, 2),
(193, 0, '2022-01-19 21:36:40.405766', 36, 46, 2),
(194, 0, '2022-01-19 21:36:42.179534', 36, 48, 2),
(195, 33, '2022-01-19 21:37:17.078622', 36, 28, 1),
(196, 100, '2022-01-26 00:32:16.025379', 36, 15, 3),
(197, 100, '2022-01-26 00:32:36.394572', 36, 9, 3),
(198, 100, '2022-01-26 00:33:35.947000', 36, 5, 3),
(199, 100, '2022-01-26 00:33:53.631718', 7, 4, 3),
(200, 100, '2022-01-26 00:35:09.975799', 36, 15, 32),
(201, 100, '2022-01-26 00:35:10.833736', 36, 16, 32),
(202, 100, '2022-01-26 00:35:10.988225', 36, 16, 32),
(203, 100, '2022-01-26 00:35:11.126701', 36, 16, 32),
(204, 100, '2022-01-26 00:35:11.529390', 36, 17, 32);

-- --------------------------------------------------------

--
-- 資料表結構 `robot_sort_term_memory`
--

DROP TABLE IF EXISTS `robot_sort_term_memory`;
CREATE TABLE IF NOT EXISTS `robot_sort_term_memory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct_rate` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `mod_id` bigint(20) NOT NULL,
  `costTime` int(11) NOT NULL,
  `memoryTime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_sort_term_memory_mod_id_18025e47` (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_sort_term_memory`
--

INSERT INTO `robot_sort_term_memory` (`id`, `correct_rate`, `add_time`, `mod_id`, `costTime`, `memoryTime`) VALUES
(46, 100, '2021-11-30 00:50:35.730198', 4, 3, 1),
(47, 0, '2021-11-30 05:11:21.314114', 4, 1, 1),
(48, 0, '2021-11-30 05:15:02.983043', 4, 6, 1),
(49, 66, '2021-11-30 05:15:20.225541', 4, 3, 1),
(50, 33, '2021-11-30 05:15:36.555555', 4, 2, 1),
(51, 66, '2021-11-30 14:22:27.393174', 4, 1, 1),
(52, 0, '2021-11-30 14:35:30.572202', 4, 1, 1),
(53, 100, '2021-11-30 15:15:45.264617', 4, 6, 1),
(54, 100, '2021-11-30 15:19:34.885871', 4, 3, 1),
(55, 100, '2021-11-30 16:16:29.613780', 4, 5, 1),
(56, 100, '2021-11-30 16:24:06.923752', 8, 8, 1),
(57, 100, '2021-11-30 16:45:38.164011', 4, 1, 1),
(58, 100, '2021-11-30 16:46:47.686413', 8, 2, 1),
(59, 100, '2021-11-30 16:47:10.495747', 8, 2, 1),
(60, 100, '2021-11-30 18:14:04.460865', 11, 2, 1),
(61, 100, '2021-11-30 18:48:49.175659', 12, 3, 1),
(62, 100, '2021-11-30 18:49:20.071043', 4, 3, 1),
(63, 66, '2021-11-30 18:56:32.758518', 12, 6, 1),
(64, 66, '2021-11-30 18:59:03.492045', 4, 5, 1),
(65, 100, '2021-12-01 04:22:13.270563', 4, 8, 1),
(66, 0, '2021-12-01 04:22:58.739437', 4, 18, 1),
(67, 66, '2021-12-01 04:24:52.050622', 4, 38, 1),
(68, 100, '2021-12-01 05:31:46.021563', 4, 5, 1),
(69, 100, '2021-12-01 06:18:38.054218', 4, 3, 1),
(70, 100, '2021-12-01 06:25:39.942033', 4, 4, 1),
(95, 66, '2022-01-03 01:29:15.378113', 4, 2, 1),
(72, 100, '2021-12-06 10:26:19.611081', 19, 5, 1),
(73, 100, '2021-12-07 03:08:26.863782', 4, 3, 1),
(74, 100, '2021-12-07 03:08:51.191711', 19, 2, 1),
(75, 0, '2021-12-14 10:31:41.149513', 4, 1, 1),
(76, 100, '2021-12-20 01:15:42.928538', 4, 7, 1),
(77, 100, '2021-12-20 01:15:55.961859', 4, 3, 1),
(78, 66, '2021-12-20 01:16:15.050448', 4, 5, 1),
(94, 33, '2021-12-29 02:44:18.674305', 4, 5, 1),
(93, 0, '2021-12-28 16:13:27.148426', 4, 0, 1),
(92, 0, '2021-12-28 16:13:14.657192', 4, 50, 1),
(91, 0, '2021-12-28 09:29:35.035755', 32, 1, 1),
(90, 66, '2021-12-28 09:18:05.327329', 29, 3, 1),
(85, 33, '2021-12-20 06:22:13.750301', 4, 3, 1),
(86, 66, '2021-12-20 06:24:31.216832', 4, 7, 1),
(87, 66, '2021-12-20 06:25:10.823106', 4, 6, 1),
(88, 100, '2021-12-20 06:52:27.737765', 4, 4, 1),
(89, 66, '2021-12-27 14:36:16.610682', 4, 3, 1),
(96, 0, '2022-01-03 01:32:05.549102', 4, 1, 1),
(97, 33, '2022-01-03 12:30:31.350740', 4, 1, 1),
(98, 0, '2022-01-04 12:22:23.986635', 4, 2, 1),
(99, 100, '2022-01-18 16:44:12.581251', 35, 7, 1),
(100, 66, '2022-01-19 21:33:28.352375', 35, 4, 1),
(101, 100, '2022-01-20 10:23:03.091935', 35, 2, 7),
(102, 0, '2022-02-11 11:11:03.632845', 4, 1, 1),
(103, 0, '2022-02-11 11:26:48.871594', 4, 3, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `robot_store_point`
--

DROP TABLE IF EXISTS `robot_store_point`;
CREATE TABLE IF NOT EXISTS `robot_store_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic` varchar(10) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `ans` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `robot_userdata`
--

DROP TABLE IF EXISTS `robot_userdata`;
CREATE TABLE IF NOT EXISTS `robot_userdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `year` int(10) UNSIGNED NOT NULL,
  `month` int(10) UNSIGNED NOT NULL,
  `day` int(10) UNSIGNED NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_userdata`
--

INSERT INTO `robot_userdata` (`id`, `name`, `year`, `month`, `day`, `gender`, `password`, `image`) VALUES
(2, 'C108110231', 1910, 1, 1, 'MAN', '191011', 'headshot/1.jpg'),
(48, '美女', 2003, 8, 7, 'WOMAN', '200387', 'headshot/IMG_2751.JPG'),
(53, 'robot', 1910, 1, 1, 'MAN', '191011', 'headshot/unnamed.jpg'),
(54, 'xxx', 1910, 1, 1, 'MAN', '191011', 'headshot/短期記憶.jpg'),
(45, '老師', 1910, 1, 1, 'MAN', '191011', 'headshot/blob_http___172.20.10.10_8000_24d264bf-db25-4ef0-bc94-5dc5bcb4da72.jpg'),
(52, 'test', 1910, 1, 1, 'MAN', '191011', 'headshot/777777777777777.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `robot_username`
--

DROP TABLE IF EXISTS `robot_username`;
CREATE TABLE IF NOT EXISTS `robot_username` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `robot_username`
--

INSERT INTO `robot_username` (`id`, `name`) VALUES
(1, 'billy'),
(2, 'C108110231'),
(3, 'root'),
(4, 'aaaa'),
(5, '曾裕翔');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
