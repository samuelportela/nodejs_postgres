-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2018 at 10:19 PM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.27-0+deb9u1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: "ethstarterDB"
--

-- --------------------------------------------------------

--
-- Table structure for table "campagnes"
--

CREATE TABLE "campagnes" (
  "idCampagne" SERIAL NOT NULL,
  "idEntrepreneur" INTEGER NOT NULL,
  "nomCampagne" varchar(200) NOT NULL,
  "but" float NOT NULL,
  "montantActuel" float NOT NULL,
  "montantMax" INTEGER NOT NULL,
  "dateLimite" date NOT NULL,
  "description" text NOT NULL,
  "descriptionCourte" text NOT NULL,
  "image" text NOT NULL,
  "estEnCours" BOOLEAN NOT NULL,
  "validated" BOOLEAN NOT NULL,
  "descriptionValidation" varchar(1000) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "commentaires"
--

CREATE TABLE "commentaires" (
  "idContributeur" INTEGER NOT NULL,
  "idCampagne" INTEGER NOT NULL,
  "commentaire" varchar(500) NOT NULL,
  " DATE"  DATE NOT NULL,
  "liked" INTEGER NOT NULL,
  "unliked" INTEGER NOT NULL,
  "idComm" SERIAL NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "contrepartiesCampagne"
--

CREATE TABLE "contrepartiesCampagne" (
  "idContrepartie" SERIAL NOT NULL,
  "idCampagne" INTEGER NOT NULL,
  "descriptionCP" varchar(1000) NOT NULL,
  "montant" INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "contrepartiesContributeur"
--

CREATE TABLE "contrepartiesContributeur" (
  "idCampagne" INTEGER NOT NULL,
  "idContributeur" INTEGER NOT NULL,
  "idContrepartie" INTEGER NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "dm"
--

CREATE TABLE "dm" (
  "idDM" SERIAL NOT NULL,
  "sender" INTEGER NOT NULL,
  "title" varchar(500) NOT NULL,
  "message" varchar(5000) NOT NULL,
  " DATE"  DATE NOT NULL,
  "recipient" INTEGER NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "entrepreneur"
--

CREATE TABLE "entrepreneur" (
  "idUtilisateur" INTEGER NOT NULL,
  "nomEntreprise" varchar(30) NOT NULL,
  "pieceIdentide" varchar(200) NOT NULL,
  "validated" INTEGER NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "favoris"
--

CREATE TABLE "favoris" (
  "idUtilisateur" INTEGER NOT NULL,
  "idCampagne" INTEGER NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "likeComm"
--

CREATE TABLE "likeComm" (
  "idComm" INTEGER NOT NULL,
  "idUtilisateur" INTEGER NOT NULL,
  "statutLike" INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "notifications"
--

CREATE TABLE "notifications" (
  "idNotification" SERIAL NOT NULL,
  "idUtilisateur" INTEGER NOT NULL,
  "text" varchar(1000) NOT NULL,
  "date"  DATE NOT NULL,
  "viewed" BOOLEAN NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "participation"
--

CREATE TABLE "participation" (
  "idParticipation" SERIAL NOT NULL,
  "idContributeur" INTEGER NOT NULL,
  "montant" float NOT NULL,
  "idCampagne" INTEGER NOT NULL,
  "date" date NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "utilisateur"
--

CREATE TABLE "utilisateur" (
  "id" SERIAL NOT NULL,
  "nom" varchar(30) NOT NULL,
  "prenom" varchar(30) NOT NULL,
  "mail" varchar(60) NOT NULL,
  "login" varchar(30) NOT NULL,
  "password" varchar(100) NOT NULL,
  "addrPubliqueEth" varchar(60) NOT NULL,
  "type" INTEGER NOT NULL
) ;

CREATE TABLE "visits" (
  "username" varchar(30) NOT NULL,
  "date" TIMESTAMP NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table "campagnes"
--
--
-- AUTO_INCREMENT for table "commentaires"
--
--
-- AUTO_INCREMENT for table "contrepartiesCampagne"
--
-- AUTO_INCREMENT for table "dm"
--
--
-- AUTO_INCREMENT for table "notifications"
--
--
-- AUTO_INCREMENT for table "participation"
--
--
-- AUTO_INCREMENT for table "utilisateur"
--
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
