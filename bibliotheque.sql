-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 mars 2024 à 13:31
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `idUser` int(11) NOT NULL,
  `idLivre` int(11) NOT NULL,
  `delais` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunter`
--

INSERT INTO `emprunter` (`idUser`, `idLivre`, `delais`) VALUES
(1, 1, '2024-03-12'),
(2, 2, '2024-03-11');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `idLivre` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Auteur` varchar(100) NOT NULL,
  `Categorie` varchar(100) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Image` text NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idLivre`, `Titre`, `Auteur`, `Categorie`, `Quantite`, `Image`, `Status`) VALUES
(1, 'orgueil et préjugés', 'Jane Austen', 'Romantique', 1, 'https://www.livredepoche.com/sites/default/files/images/livres/couv/9782253259787-001-T.jpeg', 'disponible'),
(2, 'Roméo et Juliette ', 'Shakespeare', 'Romantique', 1, 'https://th.bing.com/th/id/R.9deffb5acc0f3e04bee99fcacc455b69?rik=8%2fiBP%2bPxYi5tQQ&pid=ImgRaw&r=0', 'disponible'),
(3, 'Avant toi', 'Jojo Moyes', 'Romantique', 1, 'https://th.bing.com/th/id/R.3f7857a87a41590a3297448e57706d10?rik=mCG0drch%2blL8hQ&pid=ImgRaw&r=0', 'disponible'),
(4, 'Foundation', 'Isaac Asimov', 'Science-Fiction', 1, 'https://images.renaud-bray.com/images/PG/1009/1009672-gf.jpg?404=404RB.gif', 'disponible'),
(7, 'La route de Los Angeles', 'John Fante', 'Aventure', 1, 'https://m.media-amazon.com/images/I/611JEs86mUL._SL1311_.jpg', 'disponible'),
(20, 'Wild', 'Cheryl Strayed', 'Aventure', 1, 'https://th.bing.com/th/id/R.d561b02c74532730cc64ac62c763bd6e?rik=86UhcYKTRa7o3g&pid=ImgRaw&r=0', 'disponible'),
(22, 'Un été dans l\'Ouest', 'Philippe Labro', 'Aventure', 1, 'https://www.babelio.com/couv/CVT_C_Un-Ete-dans-lOuest_9671.jpg', 'disponible');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Mail` text NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Login` varchar(200) NOT NULL,
  `Pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `Nom`, `Prenom`, `Mail`, `Role`, `Login`, `Pass`) VALUES
(1, 'Ayadi', 'Lamia', 'lamia@gmail.com', 'utilisateur', 'lamia.ayadi@gmail.com', 'lamia123'),
(2, 'Masmoudi', 'Dorra', 'dorra@gmail.com', 'utilisateur', 'dorra.masmoudi@gmail.com', 'dorra123');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idLivre` (`idLivre`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`idLivre`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `idLivre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`idLivre`) REFERENCES `livre` (`idLivre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
