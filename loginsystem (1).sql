-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Fev-2021 às 20:11
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loginsystem`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `movie_reviews`
--

CREATE TABLE `movie_reviews` (
  `id` int(255) NOT NULL,
  `movie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `movie_review` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `movie_reviews`
--

INSERT INTO `movie_reviews` (`id`, `movie_name`, `movie_review`) VALUES
(9, 'Jumanji', 'puta jogo bom'),
(10, 'Sonic', 'Tem o tails'),
(11, 'Vingadores', 'O melhor é o 3'),
(12, 'Capitão América', 'escudo'),
(13, 'WandaVision', 'É série, não é filme'),
(14, 'Cidade Invisível', 'também é série, não é filme');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`) VALUES
(1, 'luan', '12345'),
(11, 'user5', '$2b$10$Aj8jm49XVcScjmFIsIqC3u6yAOSesdwchcGBdq96XtFG72Li5BpR.'),
(14, 'novo', '$2b$10$Es6qOKkAxOtVz6/6DqRV9OorsMwlglFAL4eWzM1P0OwkA4mk7HtDy'),
(16, 'novo3', '$2b$10$p7F72OV94TWGSILtiFhXJOOUQr0lMjK5CHBHVSto.Ryk9Er2OaIaW'),
(17, 'luan2', '$2b$10$m3EHwhbTwUzzdQUTbjwGCeIExpTaMTNKs3xJc9nkg2SSqO62L1S/G'),
(18, 'user', '$2b$10$Luv95/xSG7/cMS1coUyhKeAe.bIXexdfQ3GQYPbCGH9gX9f14M2/C'),
(19, 'luan3', '$2b$10$NBqGRxE9PqNu0N8S.aFI1eCMRzhXNKRu7lfBvsgRAvwqGkFhKy/Wa'),
(20, 'user7', '$2b$10$0fnCJS5Xq23oSpU64ucqKepGFdbqPSEWg69Ry5lqM7U2h.OMpfFS2');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `movie_reviews`
--
ALTER TABLE `movie_reviews`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `movie_reviews`
--
ALTER TABLE `movie_reviews`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
