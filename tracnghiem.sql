-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 13, 2024 lúc 07:08 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 1,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chats`
--

CREATE TABLE `chats` (
  `ID` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_sent` datetime NOT NULL,
  `chat_content` text NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `grade_id` int(10) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Cấu trúc bảng cho bảng `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(1) NOT NULL,
  `gender_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_detail`) VALUES
(1, 'Chưa Xác Định'),
(2, 'Nam'),
(3, 'Nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `detail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `grades`
--

INSERT INTO `grades` (`grade_id`, `detail`) VALUES
(1, 'Công Nghệ Thông Tin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `level_detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `levels`
--

INSERT INTO `levels` (`level_id`, `level_detail`) VALUES
(1, 'Dễ'),
(2, 'Trung Bình'),
(3, 'Khó');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `notification_title` text NOT NULL,
  `notification_content` text NOT NULL,
  `time_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `permission` int(11) NOT NULL,
  `permission_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`permission`, `permission_detail`) VALUES
(1, 'Admin'),
(2, 'Giáo Viên'),
(3, 'Học Sinh'),
(4, 'Trưởng bộ môn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `practice`
--

CREATE TABLE `practice` (
  `practice_code` int(11) NOT NULL,
  `grade_id` int(1) NOT NULL,
  `subject_id` int(1) NOT NULL,
  `level_id` int(1) NOT NULL,
  `time_to_do` int(11) NOT NULL DEFAULT 30,
  `total_questions` int(11) NOT NULL DEFAULT 30,
  `student_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Cấu trúc bảng cho bảng `practice_scores`
--

CREATE TABLE `practice_scores` (
  `student_id` int(11) NOT NULL,
  `practice_code` int(11) NOT NULL,
  `score_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score_detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `grade_id` int(10) NOT NULL,
  `unit` int(2) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_a` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_b` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_c` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_d` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL DEFAULT 1,
  `teacher_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `suggest` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



--
-- Cấu trúc bảng cho bảng `quest_of_practice`
--

CREATE TABLE `quest_of_practice` (
  `practice_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Cấu trúc bảng cho bảng `quest_of_test`
--

CREATE TABLE `quest_of_test` (
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



--
-- Cấu trúc bảng cho bảng `scores`
--

CREATE TABLE `scores` (
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `score_number` varchar(10) DEFAULT NULL,
  `score_detail` varchar(50) NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(1) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `statuses`
--

INSERT INTO `statuses` (`status_id`, `detail`) VALUES
(1, 'Đóng'),
(2, 'Mở'),
(3, 'Chờ duyệt'),
(4, 'Đã duyệt'),
(5, 'Không duyệt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 3,
  `class_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `doing_exam` int(11) DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `time_remaining` varchar(11) DEFAULT NULL,
  `doing_practice` int(11) DEFAULT NULL,
  `practice_time_remaining` varchar(11) DEFAULT NULL,
  `practice_starting_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



--
-- Cấu trúc bảng cho bảng `student_notifications`
--

CREATE TABLE `student_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_practice_detail`
--

CREATE TABLE `student_practice_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `practice_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `student_answer` text DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_test_detail`
--

CREATE TABLE `student_test_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `student_answer` text DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject_head`
--

CREATE TABLE `subject_head` (
  `subject_head_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permission` int(1) NOT NULL DEFAULT 4,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `last_login` datetime NOT NULL,
  `subject_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 2,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher_notifications`
--

CREATE TABLE `teacher_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tests`
--

CREATE TABLE `tests` (
  `test_code` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `grade_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `time_to_do` int(11) NOT NULL,
  `note` text NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n4` (`permission`),
  ADD KEY `admins_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `class_id` (`class_id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_name` (`class_name`),
  ADD KEY `n7` (`teacher_id`),
  ADD KEY `k4` (`grade_id`);

--
-- Chỉ mục cho bảng `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Chỉ mục cho bảng `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Chỉ mục cho bảng `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission`);

--
-- Chỉ mục cho bảng `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`practice_code`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `practice_scores`
--
ALTER TABLE `practice_scores`
  ADD PRIMARY KEY (`student_id`,`practice_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `practice_code` (`practice_code`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `k9` (`grade_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `subjects_key` (`subject_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Chỉ mục cho bảng `quest_of_practice`
--
ALTER TABLE `quest_of_practice`
  ADD PRIMARY KEY (`practice_code`,`question_id`) USING BTREE,
  ADD KEY `question_id` (`question_id`),
  ADD KEY `practice_code` (`practice_code`) USING BTREE;

--
-- Chỉ mục cho bảng `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD PRIMARY KEY (`test_code`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Chỉ mục cho bảng `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`student_id`,`test_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n9` (`class_id`),
  ADD KEY `n11` (`permission`),
  ADD KEY `students_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Chỉ mục cho bảng `student_practice_detail`
--
ALTER TABLE `student_practice_detail`
  ADD PRIMARY KEY (`student_id`,`practice_code`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `practice_id` (`practice_code`);

--
-- Chỉ mục cho bảng `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD PRIMARY KEY (`student_id`,`test_code`,`question_id`),
  ADD KEY `fk4` (`test_code`),
  ADD KEY `fk6` (`question_id`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Chỉ mục cho bảng `subject_head`
--
ALTER TABLE `subject_head`
  ADD PRIMARY KEY (`subject_head_id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n2` (`permission`),
  ADD KEY `teachers_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Chỉ mục cho bảng `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_code`),
  ADD KEY `fk1` (`subject_id`),
  ADD KEY `fk2` (`status_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chats`
--
ALTER TABLE `chats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `practice`
--
ALTER TABLE `practice`
  MODIFY `practice_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=975641;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1978;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `subject_head`
--
ALTER TABLE `subject_head`
  MODIFY `subject_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tests`
--
ALTER TABLE `tests`
  MODIFY `test_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=981591;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `n4` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`);

--
-- Các ràng buộc cho bảng `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chat_classes_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);

--
-- Các ràng buộc cho bảng `practice_scores`
--
ALTER TABLE `practice_scores`
  ADD CONSTRAINT `pracetice_scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `pracetice_scores_ibfk_2` FOREIGN KEY (`practice_code`) REFERENCES `practice` (`practice_code`);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `k9` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `subjects_key` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Các ràng buộc cho bảng `quest_of_practice`
--
ALTER TABLE `quest_of_practice`
  ADD CONSTRAINT `quest_of_pratice_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Các ràng buộc cho bảng `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD CONSTRAINT `quest_of_test_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `quest_of_test_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Các ràng buộc cho bảng `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `n11` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `n9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Các ràng buộc cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD CONSTRAINT `student_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `student_notifications_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Các ràng buộc cho bảng `student_practice_detail`
--
ALTER TABLE `student_practice_detail`
  ADD CONSTRAINT `practice_fk4` FOREIGN KEY (`practice_code`) REFERENCES `practice` (`practice_code`),
  ADD CONSTRAINT `practice_fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `practice_fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `n2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `teachers_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Các ràng buộc cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD CONSTRAINT `teacher_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `teacher_notifications_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Các ràng buộc cho bảng `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
