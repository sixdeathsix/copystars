-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 22 2023 г., 12:00
-- Версия сервера: 5.7.33
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `copystar`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart_products`
--

CREATE TABLE `cart_products` (
  `id_cart_product` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart_products`
--

INSERT INTO `cart_products` (`id_cart_product`, `count`, `product_id`, `user_id`) VALUES
(3, 1, 13, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id_color` int(11) NOT NULL,
  `color_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id_color`, `color_name`) VALUES
(1, 'Красный'),
(2, 'Желтый'),
(3, 'Белый'),
(4, 'Черный'),
(5, 'Фиолетовый'),
(6, 'Розовый'),
(7, 'Коричневый'),
(8, 'Цветной');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id_country` int(11) NOT NULL,
  `country_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id_country`, `country_name`) VALUES
(1, 'Россия'),
(2, 'Германия'),
(3, 'Бельгия'),
(4, 'Канада'),
(5, 'Франция'),
(6, 'Швейцария');

-- --------------------------------------------------------

--
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `id_order_product` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `order_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cancel_message` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_products`
--

INSERT INTO `order_products` (`id_order_product`, `count`, `order_datetime`, `status_id`, `product_id`, `user_id`, `cancel_message`) VALUES
(15, 1, '2023-05-22 10:40:40', 3, 12, 2, NULL),
(16, 4, '2023-05-22 10:41:26', 2, 12, 2, NULL),
(17, 2, '2023-05-22 11:54:26', 1, 17, 3, NULL),
(18, 3, '2023-05-22 11:54:28', 1, 15, 3, NULL),
(19, 1, '2023-05-22 11:54:30', 1, 16, 3, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id_product`, `image`, `product_name`, `price`, `amount`, `year`, `product_type_id`, `country_id`) VALUES
(12, '/source/1684740501_c16a26e9ac15d5530395b0992f62c0f368d063c513e5bc5c37c3dc08b683d6b4.jpg.webp', 'МФУ лазерное Pantum M6502', 12899, 19, 2022, 1, 1),
(13, '/source/1684741613_0d30a3198943afb626ba54d633d76ccb70b176041cd9f231b90162b6b7c457c0.jpg.webp', 'МФУ струйное HP DeskJet 2320 All-in-One', 5499, 23, 2022, 2, 1),
(14, '/source/1684741662_b6e6d99274a709d8969ace1ea42e2df8ef6559293dfb5aa7173014886f30f475.jpg.webp', 'Принтер лазерный Pantum P2502', 8499, 43, 2021, 3, 2),
(15, '/source/1684741694_56a18bc019c55df4c472ae9d80fda88cf87fa68a4f56025068c9bc2275957793.jpg.webp', 'Принтер струйный HP OfficeJet Pro 6230', 9999, 32, 2020, 4, 5),
(16, '/source/1684741721_4959996e7337b0571a45bae718e87ec6064bb839aae238c425f57ce057ff4256.jpg.webp', 'Термопринтер Espada FilmScanner EC718', 5499, 76, 2023, 5, 6),
(17, '/source/1684745011_f082db5312333510424c8084601d0fa82928539eacabde284b5d330e0ef253b0.jpg.webp', 'Принтер лазерный Pantum P2502W', 8599, 36, 2022, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product_types`
--

CREATE TABLE `product_types` (
  `id_product_type` int(11) NOT NULL,
  `product_type_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_types`
--

INSERT INTO `product_types` (`id_product_type`, `product_type_name`) VALUES
(1, 'Лазерные мфу'),
(2, 'Струйные мфу'),
(3, 'Лазерные принтеры'),
(4, 'Струйные принтеры'),
(5, 'Термопринтеры');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id_role`, `role_name`) VALUES
(1, 'USER'),
(2, 'ADMIN');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id_status` int(11) NOT NULL,
  `status_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id_status`, `status_name`) VALUES
(1, 'Новый'),
(2, 'Завершенный'),
(3, 'Отмененный');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `surname`, `name`, `patronymic`, `email`, `login`, `password`, `role_id`) VALUES
(1, 'Камалов', 'Арслан', 'Рахмиддинович', 'admin@mail.ru', 'admin', 'admin44', 2),
(2, 'Камалов', 'Арслан', 'Рахмиддинович', 'user@mail.ru', 'user', 'user44', 1),
(3, 'Камалов', 'Арслан', 'Рахмиддинович', 'user@mail.ru', 'user1', 'user44', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id_cart_product`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id_color`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_country`);

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id_order_product`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `product_type_id` (`product_type_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id_product_type`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id_status`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id_cart_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id_order_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id_product_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `cart_products_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id_status`),
  ADD CONSTRAINT `order_products_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `order_products_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id_country`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id_product_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
