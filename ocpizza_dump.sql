-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: ocpizza
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`name`),
  KEY `category_category_fk` (`parent_category_id`),
  CONSTRAINT `category_category_fk` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'étudier',NULL),(2,'frère',1),(3,'vue',NULL),(4,'voix',NULL),(5,'montrer',3),(6,'sein',3),(7,'simple',6),(8,'marier',NULL),(9,'noire',NULL),(10,'depuis',NULL),(11,'près',NULL),(12,'figurer',11),(13,'détail',NULL),(14,'emmener',NULL),(15,'décrire',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `password` char(64) NOT NULL,
  `address_street_number` varchar(10) DEFAULT NULL,
  `address_street_name` varchar(200) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_postal_code` varchar(6) DEFAULT NULL,
  `address_additional_details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Océane','Gros','oceane.gros@robin.fr','+33 (0)8 09 00 12 29','$2b$12$4/ttl1/1PzKXwOZ0gwSCc.b/8dnnVyYEkkuoynnbEVyU16GkLB5hq','','','','','Réserver poids ramener voile troisième santé.'),(2,'Madeleine','Pons','madeleine.pons@normand.com','+33 (0)4 06 94 73 19','$2b$12$neSjMz8sMLbnSe0RVzPuSO7DO3l0Zw2sLtU8kJjVu3zdruxEbnR/2','','','','',''),(3,'Alain','Mendes','alain.mendes@dijoux.org','0228577219','$2b$12$kaeeJmPHAL.HtM1/DxhVgOYmAQPFcjnlhWjwMLCWCHe8wKka7f9Iq','','','','',''),(4,'Thierry','Barre','thierry.barre@coste.com','0809701341','$2b$12$.hd8foJY1rqT14z2eLun8uqPShNnRTUMhizxw5bXyx8Vp7ysyY0Tu','','','','',''),(5,'Claudine','Marques','claudine.marques@albert.com','01 71 86 55 51','$2b$12$SLNUe96uw2Ay55bsOmjI5OwWVmeG2GY0QagG78okibzBNNtLGIM32','19','avenue Thibault Benoit','Leveque','81120',''),(6,'Georges','Lebreton','georges.lebreton@faivre.net','+33 1 04 77 85 13','$2b$12$VTqwcWwbXmVxdyZe6QaDRei.BCd/ctKkv.k7iDlTuwsu.FdmHoPVS','','','','','Paysage distance bureau long soin agir briller.'),(7,'daisy','Bruneau','daisy.bruneau@boulay.net','01 62 13 36 78','$2b$12$DHLlN/nKSlBc4mW.wwzuuObpkjg/KYWVLWH108V4TLxjNhQwXFqt2','98','avenue Gérard Georges','Saint Anouk','37090','D\'Autres bureau distinguer respirer etc masse terme décider. Voisin agent pauvre.'),(8,'Élodie','Ollivier','elodie.ollivier@bonnet.net','+33 8 04 91 14 62','$2b$12$Obe8nEW2sxCvgDnckZ0reeSgQHYfa9CGSg57SAKidQJdaFlQ0XdqO','274','rue de Klein','Carpentier','76381',''),(9,'Hortense','Pierre','hortense.pierre@mallet.fr','+33 6 80 48 69 83','$2b$12$7RGtP5gz682k2B26I9iDJOeaDm6fDaJQg4ve8U98f5Ss6nHW0qE/2','','','','','Devenir monter million à.'),(10,'Nicolas','Paris','nicolas.paris@dupont.com','+33 8 05 17 00 40','$2b$12$cO1Pv0MjfsGHK1Zqp.RVaO.ViaRSdtp7BI4shloC5GWU1l91kQrfe','540','rue Morel','BaudryBourg','47767','Français permettre apercevoir construire chaise. Quartier lui certain par.'),(11,'Luce','Lefevre','luce.lefevre@delaunay.fr','+33 (0)6 17 50 11 88','$2b$12$RkBlYgVX7a5G6Jt3J3P0L.1RiN3vMk9bBbGbCOxgK.IACKqo61Et.','','','','',''),(12,'Élise','Fischer','elise.fischer@huet.fr','+33 (0)1 31 83 40 61','$2b$12$mcrP9P1SUQgVO25FykMhX.Rz5nyEiI68VfN7sgdXlZYvA5xiRSeC2','','','','',''),(13,'Claire','Roger','claire.roger@briand.com','+33 1 40 58 80 91','$2b$12$zFQFveM5BYIg2dYX4U0XIeAiH0FzJOK5ryvac85PdTgxxSGPTAX6O','93','avenue de Lenoir','Paul','81643',''),(14,'Céline','Nicolas','celine.nicolas@guerin.com','0120450180','$2b$12$.y/kyBOQ7PraumYmjq1xYOnxLwcNHrWkkHrnG5ASJrFgnbugdhhcW','3','avenue Adrien Lucas','Georges','10177','Mort escalier ancien bas. Atteindre petit souvent apprendre.'),(15,'Adèle','Bourdon','adele.bourdon@chauvet.fr','+33 (0)6 06 05 19 58','$2b$12$iooxI7OWTVZ5i0HfmZrZvuCUiPQNiEsUI1nKz5jX8g6QVBAbT2xF2','9','chemin de Monnier','Sainte Arnaudenec','41654',''),(16,'Agnès','Barbier','agnes.barbier@martineau.net','02 60 60 93 68','$2b$12$Ifgdyt1Q8dhNnpqXkUrIQ.4nnuHMU9fkEbU1eq5xf.KtVM/lLnIfK','','','','','Inquiétude résultat erreur garçon mal seulement.'),(17,'Dominique','Pires','dominique.pires@fleury.org','+33 6 86 01 60 06','$2b$12$YpL595jZaGlc9j32h5JGVeuZO0n0Hvrs0s.AZOi60FWLw2168gpZm','','','','','Obéir prier prévenir. Savoir vol droit d\'abord mince.'),(18,'Danielle','Maillard','danielle.maillard@buisson.fr','+33 (0)1 32 62 71 34','$2b$12$I/281EgD40cfercxObJJj.XPcDI45sHKdG2yA/OQtmnl3NOa2BjTC','','','','','Dame science amour résultat mille fruit. Franc épais franchir attendre déjà.'),(19,'Benjamin','Fleury','benjamin.fleury@jacob.org','+33 6 91 56 06 40','$2b$12$1BFS8pVUfoTvbCp7bMZlSOa8FnadQodgCR0NTGSUaD.qVAjL/Woo2','','','','',''),(20,'Édouard','Morel','edouard.morel@pruvost.com','0404977437','$2b$12$oU.ufRn02lHI0fE3Q6BGJOcEL5XkV9cDKbR5Tj5zGw16OjSrHqO.K','636','chemin de Morin','HernandezVille','86268','Diriger nation attitude juger chose arbre. Chasse cause parent ça conscience résister membre.'),(21,'Daniel','Meunier','daniel.meunier@paul.com','+33 (0)1 29 67 84 49','$2b$12$9xzfWi4rLu9rjSWJN9G3lusSFYnmxL8ay2FUBKdF9Ba0NJ0qBgIlC','','','','','Valoir assister poids tendre fil. Sens quart naître quand.'),(22,'Adrien','Leroy','adrien.leroy@leger.org','06 97 95 43 62','$2b$12$nPm6I0..lVS0bqjXhTHfRek/T.ybFM9WXdIIfNbWTtQlv1u74rYj2','','','','','Étranger hors partout jusque apprendre. Odeur figure réalité mari.'),(23,'Audrey','Marie','audrey.marie@becker.fr','0314750331','$2b$12$FM9YBa0NH9sFOps0.IKM7eeRf6Qfizoro0Br9aTq6gwBo6HlQ.uCC','335','rue Denis','Saint Alix-sur-Mer','22837',''),(24,'Nathalie','Dijoux','nathalie.dijoux@begue.com','+33 (0)6 75 27 90 79','$2b$12$LlOgu.onqQAE6Wnf8Aa37OK4ibM1Tsd5BPM6s7xFHfDLxlKlgmLCW','71','chemin de Pichon','Lucas-sur-Normand','14404','Empêcher examiner attirer installer spectacle vers officier.'),(25,'Matthieu','Etienne','matthieu.etienne@pons.fr','01 30 96 67 81','$2b$12$ClRxECoPEg97hT1jxydC5eZE/5jsliqP82LPVPFVl3HO.4RSZ7Qam','5','avenue Aurore Picard','Lebrun','73453','Accorder donc perdu vouloir. En causer monde maison chaque terre.'),(26,'David','Allain','david.allain@leblanc.com','02 78 66 55 34','$2b$12$W7lf6NaANtOiN/v1mAwnRObuGPakGO3hn8RwRSogrGymKGi3rIU5W','67','avenue Anne Morel','Chartier','10251','Armer bleu pauvre sol nombreux facile pour. Pas pouvoir espoir jour retrouver public enfant.'),(27,'Françoise','Brun','francoise.brun@le.com','+33 1 18 31 72 13','$2b$12$5e0KckLVPDZkbC69qBi/1ud81Bqx.3p2lGU1KpU7GEMFnbBQu30vK','953','boulevard de Torres','Marienec','71070',''),(28,'Philippine','Delaunay','philippine.delaunay@delmas.com','+33 (0)2 29 34 96 56','$2b$12$a46EioAa0KnursWTJMrMOuIv4hlX45On6DHSZh37p06UzIPj2f2qe','60','chemin Maury','Picardboeuf','88620',''),(29,'Céline','Chartier','celine.chartier@robin.com','0312841873','$2b$12$M.81qrSfte/hyI0JwztKSO4HAXzyV/R4pyURdJng2Y8XMvI8evWk2','77','chemin Marianne Michaud','Massenec','08131','Prix fait horizon obéir. Bande roman paysan pourtant fête voiture.'),(30,'Aimé','Charpentier','aime.charpentier@simon.com','0806435968','$2b$12$DFQOt3Vd61kc4BxhkATF9OIeZ9eGFdMntNTktNMy0T8YpjQqn9wvK','','','','',''),(31,'David','Thomas','david.thomas@blanchard.com','0378419760','$2b$12$8qz2gnSr7ScrTzwEOHR9DeIlEIb4tcrWl/Z/0QUR.aS0NHop3KHrq','40','chemin de Lesage','Meyernec','78712','Mon sorte tour fonder.'),(32,'Marc','Chauvet','marc.chauvet@colas.fr','03 11 58 66 69','$2b$12$p6TcL0fAPINFIoG8ad5ogectuUwSVc9Ep/IcZ8S9VnN6lg4Ba1eFG','41','rue Weiss','Chretien','50815',''),(33,'Clémence','Parent','clemence.parent@dubois.fr','08 06 97 01 86','$2b$12$VP/ghizQ2GnhUyhFKT.ZhefCbyxA9sYxJfVn1jrt4G1pBD4rpTXWG','','','','','Politique on recommencer mettre oeil taire. Arrivée manger ainsi haïr simple.'),(34,'Eugène','Auger','eugene.auger@berthelot.fr','+33 4 78 38 58 22','$2b$12$QHgZJTgIems6M2yI55dRBuq4s79Z1t8AxFyGuIop2ScKlKVHWtRnG','788','chemin Bouvier','Saint Véronique','83986',''),(35,'Christelle','Joubert','christelle.joubert@simon.com','+33 (0)4 76 10 95 38','$2b$12$4nFZGsHx8hEZO7iSdssnDuBaM7vwJVNmOpR/Bacxfh1.yIV3Bm60i','','','','',''),(36,'Emmanuelle','Gros','emmanuelle.gros@arnaud.fr','02 38 68 57 19','$2b$12$lYjqXT8I3NtZFQe/h/tMC.PdkB2wjbzruZAUX5rIL0v/50lLu8QmO','35','avenue Nicole Pinto','Sainte Astriddan','30570','Parfaitement réflexion désormais vue haut acte goût. Petit souffler différent garçon.'),(37,'Patrick','Marechal','patrick.marechal@besson.com','02 38 43 05 08','$2b$12$4PYYaA8UvkdqHFCY/3CTWuKVVlerGcIiKBuoOKfXipeUlSyXFd4ZS','48','avenue de Bonnet','Blotdan','85157','Peau bien animal plaire. Fonder papier vieux argent mériter dieu chasser ailleurs.'),(38,'Christelle','Morel','christelle.morel@lecomte.org','+33 4 99 77 11 02','$2b$12$9QCsg8OGI1tZZoLpCrotmuBWsQ14eW88fsHk6nLXwJRD.p/J5MJZi','','','','','Doux école souffrance salut.'),(39,'Margot','Raynaud','margot.raynaud@fontaine.com','01 56 02 31 67','$2b$12$Zsu5Ktzevp3XVSL3x00wYO.pvEcPybhVyVaesDL4E.DgJU.0ApB5W','','','','','Quitter gris frapper créer étranger aussi. Cabinet bonheur lien genre comment casser donc.'),(40,'Céline','Mendes','celine.mendes@remy.org','+33 1 47 09 53 26','$2b$12$zbPtXJ2AcGb2JZf56xnUFO1Y79N64Nzrh8T0BB24B0iaBAuE1iayq','','','','','Position droite aile docteur.'),(41,'Thibaut','Ramos','thibaut.ramos@riviere.fr','+33 1 08 40 60 66','$2b$12$qe5A9f9YH8w6ccAJbx5tHeJzMTnoBm4ktYoP5caX2ZiLHB3kqWMt6','72','avenue de Loiseau','Sainte Lorraine','87906',''),(42,'Marie','Laroche','marie.laroche@muller.com','+33 1 18 09 34 31','$2b$12$3H0f9OLnZxPXvSbq6p.JeOtpGUs7Sp3ct3Mknl49XkwaUhOrfX5xC','24','boulevard Perrier','Laporte','89387','Jamais serrer troisième confier.'),(43,'Gérard','Maillot','gerard.maillot@camus.com','+33 (0)4 59 30 64 39','$2b$12$RECVBIAqtUlZhxCuftpoheZXnxlX/B694O5G.lgOohI2reLYbUOnu','','','','',''),(44,'Patricia','Letellier','patricia.letellier@rossi.com','0163111216','$2b$12$ScmBIYn7PoWG/gMJ5WMhzeT4dIgGD03XacTysN/epB0SpOHKgAqsu','','','','','Vif nombreux faim battre.'),(45,'Paulette','Pierre','paulette.pierre@prevost.fr','06 23 24 27 83','$2b$12$Y2FBx5.EELde9d5j3FfXxeyC1Qa7S3CvdrHLnPygypaxkCfmukxMy','','','','',''),(46,'Virginie','Le Roux','virginie.le roux@guillou.org','+33 8 04 06 80 94','$2b$12$YbRnx3EB.lS3xtC13YiIlOT7GGNHeSyBYuG63cQfoKYAhWLm8eY56','','','','',''),(47,'Jérôme','Philippe','jerome.philippe@lopes.org','+33 8 05 55 28 23','$2b$12$1rqmCrMy/3REnzH5Qy.rTO9XtutUvaGLYn7iTVU5iCuwm146v4/Li','53','rue Morel','LesageVille','50027',''),(48,'daisy','Morel','daisy.morel@garcia.fr','+33 (0)1 07 18 29 12','$2b$12$uxno7JB8qZFdVydtZYsBaextkt.K8ZNAMLC.NIx7.4TVt1hDI1dmO','','','','',''),(49,'Richard','Lelievre','richard.lelievre@marin.fr','0189806996','$2b$12$s4odE37BLgb1y//Nn17b.e33A8/PAFxVyUMllxmFPFArRfv1F173K','325','avenue de Maillard','Barbe','09379','Officier mouvement ton toile court. Exposer pleurer inquiétude parce que.'),(50,'Anaïs','Hardy','anais.hardy@pereira.com','+33 6 90 63 84 03','$2b$12$lmZS7dzNtAwPffVxOyAXHuTjRbVk6NNXAEPOx/VXQHFs5Z5Tvr8Xu','33','avenue Arnaud','Cohen-les-Bains','42901','Unique naître forcer jeune creuser l\'un tout. Oiseau réussir bonheur prendre unique briller ami.'),(51,'Denise','Foucher','denise.foucher@bourgeois.com','0364855532','$2b$12$MJQAs6jLxLCJx6tbrkectuqyhSAcYQvKkLeJB5eqSQG0qE2YqY0mq','','','','',''),(52,'Élisabeth','Carre','elisabeth.carre@de.com','0342943513','$2b$12$1lY4k.WD4Ts..PpJjGQEQ.JMULQetxvnqX7BuPC49yNnX/LDUidZ.','54','rue de Simon','Torres','65430',''),(53,'Clémence','Joly','clemence.joly@simon.fr','+33 (0)3 87 13 05 70','$2b$12$URA5sfm4rV.LnNz7x128xegxga1Xox/Y6R9fZGGp7UIYrzYigP2om','70','avenue Pierre Letellier','Guillot','84425',''),(54,'Margaret','Mendes','margaret.mendes@pineau.fr','+33 (0)4 51 62 10 59','$2b$12$kQBXfEXqQi41Z6qgYzjtleayKgn9fFLMvY6ULOUTuVKYl72BwaiQO','','','','','Robe rose devoir inquiéter précéder après. Moins que surprendre joue rose immobile.'),(55,'Josette','Potier','josette.potier@nicolas.fr','+33 3 55 74 92 96','$2b$12$zvHnaIxZSTvoC56UeMqLy.AZxJKvNKrDbwkFU7vI3zG0oSyP01hgW','611','chemin de Barbier','Noel','44245',''),(56,'Frédérique','Letellier','frederique.letellier@baudry.org','0146286027','$2b$12$gHdOY28Y6nV83bLPiNrlEeqObmRJwwbD2iEJjcVGAGOpvW8NtcU5a','','','','','Premier abattre troisième temps. Partout éviter gris noir.'),(57,'Benoît','Dupuis','benoit.dupuis@boucher.com','+33 (0)6 12 39 14 96','$2b$12$bSPi.J.LT8c4s6D1eKVL2uYh2bGqmIO6YOWdJmWSF19GXTAs1TUaa','','','','','Lier pont mot roi croire combat après.'),(58,'Marc','Neveu','marc.neveu@gomez.com','+33 6 01 21 77 76','$2b$12$8eBQGRqVMq6zYGiqbQAQreUeaIYQ720/ZA/lRd.rydQvGYfd035Ly','67','avenue Colas','BarthelemyBourg','59846','Quart garçon défendre. Cinquante madame gauche.'),(59,'Joseph','Laroche','joseph.laroche@carre.fr','0314438927','$2b$12$Lhd3CZIeJtieAUvzprq2AOKiNGOoscRCLxLFQ2NMsWkWD5abs4yw2','1','rue de Girard','Le GoffBourg','65573',''),(60,'Arthur','Renaud','arthur.renaud@adam.fr','03 29 39 86 15','$2b$12$RE7HIY66vrtMAWTLcp3jV.yt5XEil9mtJ5FnPZhpu5VrHd4gHU1TG','','','','','Billet gauche appartement placer.'),(61,'Aurore','Henry','aurore.henry@le.fr','+33 (0)5 17 64 49 86','$2b$12$tDzOJI2dzBfuSBAAbFG6H.oNRoVihsO1ulEPFIib4Y.vr3tQWB4EG','','','','','Signe eau payer. Rêve inviter vérité personne humide homme.'),(62,'Catherine','Leclercq','catherine.leclercq@muller.com','+33 (0)2 10 77 66 02','$2b$12$ok5L42Yuzd/zpvryo77i/.CGmCXLYpYCyxV16YPGfpqAuyN6hnnFG','','','','',''),(63,'Stéphanie','Klein','stephanie.klein@henry.fr','+33 1 75 41 49 54','$2b$12$CYKDqoFOr5ZHE9ZF76.84OFhIlVgOVc4b7SAARPOQQ1sU75umDfXS','','','','',''),(64,'Adélaïde','Pierre','adelaide.pierre@ramos.fr','+33 8 05 34 41 03','$2b$12$Mr6hpvIlDyqKdewALwQIkeZh4Pkytn2.vbxhz9TNTDeZrxgpkNMNi','','','','',''),(65,'Sophie','Lebon','sophie.lebon@thomas.org','0203923877','$2b$12$xzWwyRDsuCVJ7T2dNCU1g.zEyUBAs8welFRY.gaof6wnc3WzQQGJm','','','','','Camarade aujourd\'hui différent nuit ensuite agir.'),(66,'Philippe','Devaux','philippe.devaux@bertrand.com','05 67 74 80 15','$2b$12$6tHxkIljkXTRQ4YgW2umRO0YPw0gnHan6.pTmZCTxHw.5W2Rocp02','60','rue Vincent Blanc','Giraud','06000',''),(67,'Catherine','Denis','catherine.denis@lemoine.com','+33 (0)5 51 26 43 69','$2b$12$trCh1Nq/dqZDqQa6UWkQj.KdX5uD5sB6i4yhgw82LdCMVzx55IdQG','46','avenue Élodie Hamon','Bousquetboeuf','36837','Général supposer âge maladie réveiller lit. Cause ancien partager désespoir.');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `address_street_number` varchar(10) NOT NULL,
  `address_street_name` varchar(200) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_postal_code` varchar(6) NOT NULL,
  `address_additional_details` varchar(200) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `payment_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_status_customer_order_fk` (`payment_status_id`),
  KEY `payment_order_fk` (`payment_id`),
  KEY `status_order_fk1` (`status_id`),
  KEY `pizzeria_order_fk` (`restaurant_id`),
  KEY `customer_order_fk` (`customer_id`),
  CONSTRAINT `customer_order_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `payment_order_fk` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `payment_status_customer_order_fk` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`),
  CONSTRAINT `pizzeria_order_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `status_order_fk1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,'2016-10-11 22:02:53','93','chemin Célina Marty','Devaux','01265','',1,4,1,2,1),(2,'2015-07-07 23:50:16','88','boulevard Navarro','Legros-la-Forêt','04440','',1,3,2,2,1),(3,'2019-09-10 00:23:17','83','rue Herve','Ramos-sur-Mer','15956','',1,2,2,2,1),(4,'2019-01-07 03:42:17','93','boulevard de Laroche','Grenier','33045','',2,4,2,3,2),(5,'2018-02-01 01:01:37','9','avenue Leconte','TessierBourg','56219','',2,2,2,4,1),(6,'2018-05-29 13:08:24','2','chemin Michel Rey','Imbert','82723','',3,1,2,4,2),(7,'2019-02-06 02:15:58','7','chemin Emmanuelle Thibault','Durand','59818','',4,3,2,1,1),(8,'2018-06-02 08:23:00','182','rue Rémy Becker','Sainte Suzanne','44302','',4,3,2,2,2),(9,'2017-02-15 06:20:48','5','boulevard Pierre','Vaillant','28173','',4,4,1,1,2),(10,'2019-11-03 00:54:20','19','avenue Thibault Benoit','Leveque','81120','',5,1,1,1,2),(11,'2017-09-02 00:28:27','39','rue de Gauthier','Rey-les-Bains','49355','',6,3,1,2,2),(12,'2018-12-27 09:04:41','98','avenue Gérard Georges','Saint Anouk','37090','D\'Autres bureau distinguer respirer etc masse terme décider. Voisin agent pauvre.',7,4,1,2,2),(13,'2016-02-29 15:55:02','98','avenue Gérard Georges','Saint Anouk','37090','D\'Autres bureau distinguer respirer etc masse terme décider. Voisin agent pauvre.',7,1,2,3,1),(14,'2016-11-10 23:19:47','98','avenue Gérard Georges','Saint Anouk','37090','D\'Autres bureau distinguer respirer etc masse terme décider. Voisin agent pauvre.',7,1,1,3,2),(15,'2015-04-28 07:43:46','274','rue de Klein','Carpentier','76381','',8,3,1,4,1),(16,'2018-05-28 02:13:20','274','rue de Klein','Carpentier','76381','',8,3,1,4,1),(17,'2018-10-18 06:39:37','77','boulevard Thibaut Chevallier','Mathieu','77434','',9,4,2,4,2),(18,'2015-02-26 12:42:58','43','boulevard de Delaunay','Benard','63968','',11,1,2,1,2),(19,'2018-10-14 21:20:27','2','rue de Masse','Colas','33818','',11,4,2,4,2),(20,'2019-09-08 09:08:59','504','rue Patricia Colin','Saint Daniel','43019','',12,1,1,4,1),(21,'2015-12-20 07:00:40','188','boulevard David','Moreno','76980','',12,4,2,1,1),(22,'2019-10-08 20:49:44','9','rue de Begue','Blondel','19865','',12,2,1,3,2),(23,'2019-03-04 18:45:23','22','boulevard Gilles Benoit','Pires-sur-David','28358','',13,1,2,3,2),(24,'2018-01-04 14:01:53','93','avenue de Lenoir','Paul','81643','',13,3,1,2,1),(25,'2017-05-11 01:28:19','3','avenue Adrien Lucas','Georges','10177','Mort escalier ancien bas. Atteindre petit souvent apprendre.',14,4,2,3,2),(26,'2015-08-15 17:45:44','3','avenue Adrien Lucas','Georges','10177','Mort escalier ancien bas. Atteindre petit souvent apprendre.',14,4,1,3,2),(27,'2018-06-15 10:19:39','3','avenue Adrien Lucas','Georges','10177','Mort escalier ancien bas. Atteindre petit souvent apprendre.',14,4,1,4,2),(28,'2016-02-27 21:10:02','328','rue Remy','Sainte Moniquenec','19368','',16,3,1,3,1),(29,'2019-05-28 07:43:09','42','rue Leconte','Camus','46321','',16,1,2,4,2),(30,'2018-04-20 13:52:29','20','rue de Rey','Peltier','74466','',17,4,2,4,2),(31,'2018-08-29 17:12:57','9','avenue Margaret Leblanc','Ollivierdan','03164','',18,3,1,2,2),(32,'2015-08-03 16:32:02','574','boulevard de Lemaire','HuetVille','74542','',18,2,2,4,1),(33,'2019-02-27 06:03:03','53','chemin de Hamon','Sainte Michelle','96783','',21,3,1,1,2),(34,'2019-06-12 22:58:34','69','rue Goncalves','Vasseurboeuf','40380','',21,2,1,4,1),(35,'2016-04-23 11:21:00','71','chemin de Pichon','Lucas-sur-Normand','14404','Empêcher examiner attirer installer spectacle vers officier.',24,4,1,1,1),(36,'2020-02-03 11:31:34','5','avenue Aurore Picard','Lebrun','73453','Accorder donc perdu vouloir. En causer monde maison chaque terre.',25,3,2,3,1),(37,'2015-04-19 17:17:03','6','rue de Le Gall','Saint Andrée-la-Forêt','13666','',26,4,1,3,2),(38,'2016-08-30 10:42:25','67','avenue Anne Morel','Chartier','10251','Armer bleu pauvre sol nombreux facile pour. Pas pouvoir espoir jour retrouver public enfant.',26,1,1,2,1),(39,'2020-02-10 18:46:56','67','avenue Anne Morel','Chartier','10251','Armer bleu pauvre sol nombreux facile pour. Pas pouvoir espoir jour retrouver public enfant.',26,1,1,3,1),(40,'2018-12-23 08:43:01','953','boulevard de Torres','Marienec','71070','',27,3,2,1,2),(41,'2015-11-09 01:12:54','847','boulevard Michelle Guyon','Weber-la-Forêt','17203','',27,1,1,3,1),(42,'2016-03-30 10:03:49','17','boulevard Pages','Benoit','47983','',27,1,2,4,2),(43,'2019-09-05 21:49:15','77','chemin Marianne Michaud','Massenec','08131','Prix fait horizon obéir. Bande roman paysan pourtant fête voiture.',29,3,1,1,1),(44,'2016-06-09 00:25:46','559','rue de Gauthier','Huet','10373','',30,2,2,4,2),(45,'2016-02-02 08:09:31','40','rue Wagner','Morvan','65700','',30,3,2,3,2),(46,'2019-08-08 12:49:30','59','chemin de Perrier','Seguin-la-Forêt','88584','',30,2,2,3,1),(47,'2016-07-03 03:25:58','46','rue de Maillard','Lemaire','45882','',31,2,1,2,2),(48,'2020-01-07 02:54:42','420','rue de Guibert','Gregoirenec','04361','',31,2,1,3,2),(49,'2018-03-06 15:20:38','40','chemin de Lesage','Meyernec','78712','Mon sorte tour fonder.',31,1,1,1,2),(50,'2015-12-19 00:37:58','41','rue Weiss','Chretien','50815','',32,3,2,1,1),(51,'2017-01-09 04:35:35','41','rue Weiss','Chretien','50815','',32,2,2,3,2),(52,'2015-09-15 12:16:51','3','rue Bouchet','Gaudin','64641','',33,4,2,3,2),(53,'2017-04-08 21:43:09','65','rue Laetitia Dumont','Meyer-sur-Ramos','44385','',33,1,1,3,2),(54,'2017-11-28 21:57:24','9','avenue de Bouvet','Paris-sur-Jourdan','63751','',33,2,2,2,1),(55,'2018-03-31 08:36:57','788','chemin Bouvier','Saint Véronique','83986','',34,1,1,2,1),(56,'2019-06-10 13:04:12','798','rue de Diallo','Mathieu-sur-De Oliveira','80529','',34,1,2,3,2),(57,'2018-01-09 13:59:44','45','rue de Dijoux','Saint Noël-les-Bains','89735','',34,2,2,4,1),(58,'2015-10-24 10:05:39','82','avenue Astrid Gomes','Chartierdan','85721','',35,1,2,4,2),(59,'2019-11-26 00:15:46','509','chemin Sylvie Dos Santos','Bonnin','69413','',35,2,2,3,1),(60,'2015-03-09 19:39:49','81','boulevard de Roy','Mary','89751','',36,2,2,4,2),(61,'2019-04-27 20:08:59','35','avenue Nicole Pinto','Sainte Astriddan','30570','Parfaitement réflexion désormais vue haut acte goût. Petit souffler différent garçon.',36,1,1,3,1),(62,'2018-12-29 03:16:59','35','avenue Nicole Pinto','Sainte Astriddan','30570','Parfaitement réflexion désormais vue haut acte goût. Petit souffler différent garçon.',36,1,1,2,1),(63,'2015-07-17 03:54:31','48','avenue de Bonnet','Blotdan','85157','Peau bien animal plaire. Fonder papier vieux argent mériter dieu chasser ailleurs.',37,3,2,1,2),(64,'2016-07-12 03:48:35','32','boulevard Martin Joseph','Sainte Aurélie','75819','',38,4,1,2,1),(65,'2017-12-25 08:20:58','25','avenue de Laurent','Gauthier-sur-Mer','76951','',38,4,2,3,2),(66,'2018-07-28 08:16:57','82','avenue de Pruvost','RenaudBourg','95790','',38,2,1,4,2),(67,'2018-11-21 07:01:30','736','rue de Gilles','Sainte Frédéric','89288','',39,4,2,1,1),(68,'2015-06-07 07:09:58','99','boulevard de Dumont','Valentin','30537','',40,3,2,1,1),(69,'2017-07-10 09:13:43','18','avenue Frédérique Schmitt','Saint Valentinenec','99970','',42,4,2,1,2),(70,'2019-06-27 00:25:38','24','boulevard Perrier','Laporte','89387','Jamais serrer troisième confier.',42,3,1,4,2),(71,'2015-08-19 07:34:55','24','boulevard Perrier','Laporte','89387','Jamais serrer troisième confier.',42,3,2,3,2),(72,'2016-03-17 21:06:54','18','avenue de Dupuy','Legros','38427','',43,1,1,3,2),(73,'2015-12-03 21:32:58','51','rue de Mendes','Petitboeuf','35938','',43,4,1,4,1),(74,'2018-02-26 20:57:09','51','rue Leroy','Saint Hélène','33065','',44,4,1,2,1),(75,'2017-01-05 07:50:22','62','boulevard de Muller','Normand-sur-Martin','53597','',46,3,2,2,1),(76,'2019-02-16 09:19:09','1','chemin de Caron','Texier-sur-Auger','27231','',49,4,1,1,1),(77,'2020-02-09 10:50:15','325','avenue de Maillard','Barbe','09379','Officier mouvement ton toile court. Exposer pleurer inquiétude parce que.',49,1,1,3,1),(78,'2016-02-25 10:49:38','325','avenue de Maillard','Barbe','09379','Officier mouvement ton toile court. Exposer pleurer inquiétude parce que.',49,3,2,3,2),(79,'2018-11-08 14:49:01','5','avenue Cécile Ferrand','Sainte Michelle','14739','',50,4,2,1,1),(80,'2017-10-23 06:09:56','33','avenue Arnaud','Cohen-les-Bains','42901','Unique naître forcer jeune creuser l\'un tout. Oiseau réussir bonheur prendre unique briller ami.',50,1,2,2,1),(81,'2016-03-02 01:50:40','93','boulevard Michel','Sainte Grégoire-les-Bains','97066','',51,3,2,4,2),(82,'2018-01-23 22:56:08','999','boulevard de Baron','Dubois-les-Bains','90080','',51,1,2,2,1),(83,'2016-08-11 16:09:19','70','avenue Pierre Letellier','Guillot','84425','',53,3,1,3,2),(84,'2018-05-11 02:40:40','611','chemin de Barbier','Noel','44245','',55,4,2,1,1),(85,'2017-10-02 16:15:58','611','chemin de Barbier','Noel','44245','',55,4,1,4,1),(86,'2018-01-14 12:22:51','3','boulevard Laurence Marques','Leclercq','01269','',56,3,2,1,1),(87,'2018-12-27 05:26:03','6','rue Vincent','Caron','90196','',57,3,2,3,1),(88,'2016-11-27 04:50:38','45','rue Baron','Sainte Hugues','47824','',57,3,2,3,2),(89,'2016-05-19 07:21:34','67','avenue Colas','BarthelemyBourg','59846','Quart garçon défendre. Cinquante madame gauche.',58,2,2,3,2),(90,'2018-01-18 12:41:33','1','rue de Girard','Le GoffBourg','65573','',59,3,1,3,2),(91,'2019-10-12 02:42:09','14','boulevard de Lemaitre','Marques','89370','',59,1,1,2,2),(92,'2019-08-10 06:12:22','1','rue de Girard','Le GoffBourg','65573','',59,2,1,4,2),(93,'2016-08-03 17:47:04','8','rue de Lebrun','JacquetBourg','24796','',60,4,1,3,2),(94,'2015-10-16 21:10:14','85','avenue Guibert','Launay-sur-Fischer','72448','',61,4,1,3,2),(95,'2018-06-29 01:15:12','91','avenue Clerc','Sainte Alexandrie','24316','',62,3,1,1,2),(96,'2015-06-19 08:42:45','1','avenue de Nicolas','Lefevre-sur-Meyer','81122','',64,3,2,3,1),(97,'2015-04-09 15:55:14','39','avenue Dominique Bouvier','Saint Aurorenec','79367','',64,1,2,3,2),(98,'2016-07-08 16:09:02','68','chemin Hortense Berthelot','FontaineBourg','60666','',64,3,2,4,1),(99,'2016-07-05 06:52:51','76','chemin de Rodriguez','LeblancBourg','48127','',66,1,1,1,1),(100,'2019-12-23 13:47:24','338','rue Margot Arnaud','Collet','05560','',66,3,1,1,1);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` char(64) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_email` (`email`),
  KEY `role_employee_fk` (`role_id`),
  KEY `pizzeria_employee_fk` (`restaurant_id`),
  CONSTRAINT `pizzeria_employee_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `role_employee_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Marcelle','Le Goff','marcelle.le goff@rocher.com','$2b$12$oNcITSLJULyDPS1LADN/w.u8JnqZR/DHPCImvCz7onWPN7D8NZgB6',1),(2,3,'Christiane','Carlier','christiane.carlier@delahaye.fr','$2b$12$PBkC4uMrbhhCh92uG/gpRO2ELVPdYe74zBrt6.1gLjqvWR.2G6kWy',1),(3,1,'Olivie','Chevallier','olivie.chevallier@rodriguez.com','$2b$12$eFQIHUaMlQFQchS/jmQfP.5QHJJ08/Kq3v1UfDeTESqewO8qN6xxe',1),(4,1,'Anaïs','Girard','anais.girard@parent.fr','$2b$12$9R2IrDNb6ZnD8CV8kGihS.fOKmkwqAm29Lfn/g.Vna0XR.sM/KpNq',2),(5,1,'Christophe','Delaunay','christophe.delaunay@lopes.fr','$2b$12$a3kg/L06vO22kSpVBlsvAuavsWQPvnHS8qAlty09mGzYXfEdSgXeG',2),(6,3,'Audrey','Pierre','audrey.pierre@gomez.fr','$2b$12$I18.anDvITWSlVmLVIIOC.lKtBBb9VFBFuFccuOfJnNubKQk7qteK',2),(7,3,'Clémence','Pineau','clemence.pineau@lamy.com','$2b$12$KrkZHg4g4HCvy3AW4exTFO1K/d2fNPAvGDnUuMhU.ISVEzOORvmPm',2),(8,1,'Pénélope','Delattre','penelope.delattre@brunet.fr','$2b$12$BQnL2nNY0DVc7MqAJWt//usCUuKwPQVgANQ6vYE05dj0cuo/8TS4y',3),(9,3,'Roger','Jacquet','roger.jacquet@michel.com','$2b$12$KJPtpZYUYYcGDphqU/5a6uPwch0lMmsqvGVPr6cC3VWW2Yd6u.MPa',3),(10,2,'Jean','Weiss','jean.weiss@blanchard.fr','$2b$12$Yrmb9S.pFGtIFQ3xKuohmOeukbpa19R5vvnTB0DzJ8VEdY19yafHG',3),(11,1,'Laetitia','Morvan','laetitia.morvan@pelletier.net','$2b$12$MdCRQWm80BWg/FIpmfo8hOFtZyC0rgo1yURhtJikAXWt3wsN6uqDi',4),(12,2,'Bertrand','Michel','bertrand.michel@chauveau.fr','$2b$12$uYuMbdZH0GhEVNlhQjWjT.0FxnQ3S.uG1bI8Brx1MU6.Gp7f601ga',4),(13,3,'Aimé','Roy','aime.roy@delorme.fr','$2b$12$U5pGci5ECqZziuvmDyAsMutMxhbI13UHzZJ7iSxrzMzvRUWo0yjpS',4),(14,3,'Andrée','Vincent','andree.vincent@pineau.com','$2b$12$yC.f4oOlx7K89sc6X8BrFuGvLVw4fuauIG5fgRW0btvLg9vwwR2iC',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unit` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ingredient_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'NCC-7100','l'),(2,'NCC-3907','g'),(3,'NCC-6203','cl'),(4,'NCC-1764','ml'),(5,'XCV-330','l'),(6,'NCC-45167','u'),(7,'NCC-2019','cl'),(8,'NCC-2048','g'),(9,'NCC-71809','l'),(10,'NCC-81623','g'),(11,'NCC-178','l'),(12,'NCC-1623','kg'),(13,'NX-04','cl'),(14,'NCC-19002','l'),(15,'NCC-57418','l');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `order_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax_free_unit_price` decimal(6,4) NOT NULL,
  `vat_rate_100` decimal(6,4) NOT NULL,
  PRIMARY KEY (`order_id`,`pizza_id`,`size_id`),
  KEY `vat_rate_order_line_fk` (`vat_rate_100`),
  KEY `size_order_line_fk` (`size_id`),
  KEY `pizza_order_line_fk` (`pizza_id`),
  CONSTRAINT `order_order_line_fk` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `pizza_order_line_fk` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`),
  CONSTRAINT `size_order_line_fk` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `vat_rate_order_line_fk` FOREIGN KEY (`vat_rate_100`) REFERENCES `vat_rate` (`vat_rate_100`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,4,3,2,14.3400,0.0550),(1,15,1,2,14.8700,0.0550),(2,1,3,2,14.4800,0.0550),(2,7,1,2,14.3500,0.0550),(3,5,1,2,14.4800,0.0550),(3,10,2,2,12.2200,0.0550),(4,7,1,1,14.3500,0.0550),(5,2,1,1,13.6200,0.0550),(5,3,1,1,14.6900,0.0550),(5,9,3,2,13.8200,0.0550),(5,17,2,1,14.2000,0.0550),(6,4,3,2,14.3400,0.0550),(6,13,1,2,12.7300,0.0550),(6,18,2,1,12.6400,0.0550),(7,1,3,2,14.4800,0.0550),(7,9,1,1,12.8200,0.0550),(7,11,1,1,14.2600,0.0550),(7,14,3,2,14.8900,0.0550),(8,9,1,2,12.8200,0.0550),(9,3,2,2,14.6900,0.0550),(9,5,3,2,15.4800,0.0550),(9,11,1,1,14.2600,0.0550),(9,18,1,2,12.6400,0.0550),(9,19,3,1,13.9800,0.0550),(10,16,3,2,14.4200,0.0550),(11,3,2,2,14.6900,0.0550),(11,6,2,1,12.8300,0.0550),(11,11,1,2,14.2600,0.0550),(11,15,2,1,14.8700,0.0550),(11,18,1,1,12.6400,0.0550),(12,1,2,2,13.4800,0.0550),(12,3,3,1,15.6900,0.0550),(12,7,3,2,15.3500,0.0550),(12,12,2,2,14.1100,0.0550),(12,16,1,1,13.4200,0.0550),(13,3,1,1,14.6900,0.0550),(13,17,3,1,15.2000,0.0550),(14,1,3,2,14.4800,0.0550),(14,6,3,2,13.8300,0.0550),(14,10,2,1,12.2200,0.0550),(14,11,1,2,14.2600,0.0550),(14,20,3,2,14.6600,0.0550),(15,1,2,1,13.4800,0.0550),(15,5,1,1,14.4800,0.0550),(15,7,1,1,14.3500,0.0550),(15,13,1,1,12.7300,0.0550),(15,18,3,2,13.6400,0.0550),(16,9,3,2,13.8200,0.0550),(16,12,3,1,15.1100,0.0550),(16,19,2,1,12.9800,0.0550),(17,16,3,2,14.4200,0.0550),(18,1,3,1,14.4800,0.0550),(18,5,3,1,15.4800,0.0550),(18,8,3,1,15.4400,0.0550),(18,14,1,2,13.8900,0.0550),(18,17,3,2,15.2000,0.0550),(19,4,1,1,13.3400,0.0550),(19,11,2,2,14.2600,0.0550),(19,13,1,1,12.7300,0.0550),(19,16,2,1,13.4200,0.0550),(19,17,1,2,14.2000,0.0550),(20,14,3,1,14.8900,0.0550),(21,12,2,2,14.1100,0.0550),(22,18,1,1,12.6400,0.0550),(23,10,1,2,12.2200,0.0550),(23,11,2,2,14.2600,0.0550),(23,14,2,2,13.8900,0.0550),(23,17,1,2,14.2000,0.0550),(24,5,2,1,14.4800,0.0550),(24,13,1,1,12.7300,0.0550),(24,20,1,1,13.6600,0.0550),(25,3,1,2,14.6900,0.0550),(25,7,1,2,14.3500,0.0550),(25,10,3,1,13.2200,0.0550),(25,17,1,1,14.2000,0.0550),(26,7,3,2,15.3500,0.0550),(27,12,2,1,14.1100,0.0550),(27,14,2,2,13.8900,0.0550),(27,19,3,2,13.9800,0.0550),(28,16,1,2,13.4200,0.0550),(29,19,2,1,12.9800,0.0550),(30,7,3,1,15.3500,0.0550),(30,11,2,1,14.2600,0.0550),(30,13,2,1,12.7300,0.0550),(30,14,1,2,13.8900,0.0550),(30,17,1,1,14.2000,0.0550),(31,1,1,1,13.4800,0.0550),(31,2,1,1,13.6200,0.0550),(31,12,1,2,14.1100,0.0550),(31,20,2,2,13.6600,0.0550),(32,4,1,2,13.3400,0.0550),(32,5,2,2,14.4800,0.0550),(32,13,1,2,12.7300,0.0550),(33,4,2,2,13.3400,0.0550),(33,5,3,1,15.4800,0.0550),(33,10,3,1,13.2200,0.0550),(34,10,1,1,12.2200,0.0550),(35,7,1,2,14.3500,0.0550),(35,8,1,2,14.4400,0.0550),(35,15,3,1,15.8700,0.0550),(35,16,2,1,13.4200,0.0550),(36,9,3,2,13.8200,0.0550),(36,20,3,1,14.6600,0.0550),(37,10,1,2,12.2200,0.0550),(37,20,1,2,13.6600,0.0550),(38,3,3,1,15.6900,0.0550),(39,8,3,2,15.4400,0.0550),(40,2,3,2,14.6200,0.0550),(40,8,2,2,14.4400,0.0550),(40,11,2,2,14.2600,0.0550),(41,14,1,1,13.8900,0.0550),(41,19,3,2,13.9800,0.0550),(42,1,3,1,14.4800,0.0550),(42,3,2,2,14.6900,0.0550),(42,5,3,1,15.4800,0.0550),(42,12,2,1,14.1100,0.0550),(43,6,2,2,12.8300,0.0550),(43,13,2,1,12.7300,0.0550),(44,12,1,1,14.1100,0.0550),(44,15,1,1,14.8700,0.0550),(44,18,1,1,12.6400,0.0550),(45,17,2,1,14.2000,0.0550),(46,2,1,1,13.6200,0.0550),(46,6,2,1,12.8300,0.0550),(46,13,2,1,12.7300,0.0550),(46,18,1,1,12.6400,0.0550),(47,2,2,2,13.6200,0.0550),(47,7,2,1,14.3500,0.0550),(47,13,3,2,13.7300,0.0550),(47,16,2,1,13.4200,0.0550),(48,4,2,1,13.3400,0.0550),(48,7,3,2,15.3500,0.0550),(48,8,3,2,15.4400,0.0550),(49,1,2,2,13.4800,0.0550),(49,13,1,2,12.7300,0.0550),(50,2,3,1,14.6200,0.0550),(50,15,1,2,14.8700,0.0550),(50,18,1,1,12.6400,0.0550),(50,20,3,2,14.6600,0.0550),(51,1,2,1,13.4800,0.0550),(51,14,3,1,14.8900,0.0550),(52,5,2,1,14.4800,0.0550),(52,15,3,1,15.8700,0.0550),(53,20,3,1,14.6600,0.0550),(54,5,1,2,14.4800,0.0550),(55,4,1,1,13.3400,0.0550),(55,8,3,2,15.4400,0.0550),(55,12,2,1,14.1100,0.0550),(55,18,2,1,12.6400,0.0550),(55,20,1,1,13.6600,0.0550),(56,15,2,2,14.8700,0.0550),(56,19,1,1,12.9800,0.0550),(56,20,2,1,13.6600,0.0550),(57,1,2,2,13.4800,0.0550),(58,4,2,1,13.3400,0.0550),(58,14,1,1,13.8900,0.0550),(59,4,3,2,14.3400,0.0550),(60,3,1,1,14.6900,0.0550),(60,13,1,1,12.7300,0.0550),(61,5,2,1,14.4800,0.0550),(61,11,3,1,15.2600,0.0550),(62,5,3,2,15.4800,0.0550),(62,12,3,2,15.1100,0.0550),(62,16,3,1,14.4200,0.0550),(63,1,2,1,13.4800,0.0550),(63,2,3,2,14.6200,0.0550),(63,13,1,2,12.7300,0.0550),(63,16,1,2,13.4200,0.0550),(63,18,1,1,12.6400,0.0550),(64,3,2,1,14.6900,0.0550),(64,10,3,1,13.2200,0.0550),(65,3,1,1,14.6900,0.0550),(65,8,2,2,14.4400,0.0550),(65,9,1,1,12.8200,0.0550),(65,14,3,2,14.8900,0.0550),(65,20,3,1,14.6600,0.0550),(66,7,2,2,14.3500,0.0550),(66,8,1,2,14.4400,0.0550),(66,12,2,2,14.1100,0.0550),(66,15,3,2,15.8700,0.0550),(67,1,1,1,13.4800,0.0550),(67,2,1,1,13.6200,0.0550),(67,15,3,2,15.8700,0.0550),(67,18,3,1,13.6400,0.0550),(68,3,2,1,14.6900,0.0550),(68,5,2,1,14.4800,0.0550),(68,6,1,1,12.8300,0.0550),(68,16,3,2,14.4200,0.0550),(69,1,1,1,13.4800,0.0550),(69,5,3,2,15.4800,0.0550),(69,8,1,2,14.4400,0.0550),(69,17,1,1,14.2000,0.0550),(69,20,1,2,13.6600,0.0550),(70,7,2,2,14.3500,0.0550),(70,8,2,1,14.4400,0.0550),(70,15,3,1,15.8700,0.0550),(70,16,3,2,14.4200,0.0550),(70,18,1,1,12.6400,0.0550),(71,12,1,2,14.1100,0.0550),(72,5,3,2,15.4800,0.0550),(72,10,3,2,13.2200,0.0550),(72,12,1,2,14.1100,0.0550),(72,13,2,2,12.7300,0.0550),(72,14,3,1,14.8900,0.0550),(73,12,1,2,14.1100,0.0550),(73,14,1,1,13.8900,0.0550),(74,17,1,2,14.2000,0.0550),(75,1,1,1,13.4800,0.0550),(75,2,1,1,13.6200,0.0550),(75,7,1,1,14.3500,0.0550),(75,16,2,1,13.4200,0.0550),(76,3,3,1,15.6900,0.0550),(76,5,3,1,15.4800,0.0550),(76,16,3,2,14.4200,0.0550),(77,3,2,2,14.6900,0.0550),(77,4,1,2,13.3400,0.0550),(77,18,1,2,12.6400,0.0550),(77,19,3,2,13.9800,0.0550),(78,4,3,1,14.3400,0.0550),(78,5,1,2,14.4800,0.0550),(79,5,1,2,14.4800,0.0550),(80,4,1,1,13.3400,0.0550),(80,7,1,1,14.3500,0.0550),(80,9,3,2,13.8200,0.0550),(80,16,2,2,13.4200,0.0550),(80,17,3,1,15.2000,0.0550),(81,2,3,2,14.6200,0.0550),(81,6,2,2,12.8300,0.0550),(81,7,3,1,15.3500,0.0550),(81,10,3,2,13.2200,0.0550),(82,11,3,1,15.2600,0.0550),(83,1,2,2,13.4800,0.0550),(83,12,3,2,15.1100,0.0550),(83,13,2,1,12.7300,0.0550),(83,15,1,2,14.8700,0.0550),(83,18,2,1,12.6400,0.0550),(84,6,3,1,13.8300,0.0550),(84,10,3,1,13.2200,0.0550),(84,11,2,1,14.2600,0.0550),(84,13,2,2,12.7300,0.0550),(84,18,3,2,13.6400,0.0550),(85,13,1,2,12.7300,0.0550),(86,4,3,2,14.3400,0.0550),(86,11,1,2,14.2600,0.0550),(86,20,2,2,13.6600,0.0550),(87,1,2,1,13.4800,0.0550),(87,17,3,2,15.2000,0.0550),(87,18,3,1,13.6400,0.0550),(87,20,3,1,14.6600,0.0550),(88,1,3,1,14.4800,0.0550),(88,6,3,2,13.8300,0.0550),(89,1,1,2,13.4800,0.0550),(89,5,2,1,14.4800,0.0550),(89,6,2,2,12.8300,0.0550),(90,3,1,1,14.6900,0.0550),(90,14,1,1,13.8900,0.0550),(90,18,3,2,13.6400,0.0550),(90,19,3,1,13.9800,0.0550),(91,10,2,1,12.2200,0.0550),(91,12,1,2,14.1100,0.0550),(91,15,2,1,14.8700,0.0550),(91,18,2,2,12.6400,0.0550),(91,19,3,1,13.9800,0.0550),(92,2,3,2,14.6200,0.0550),(92,8,1,1,14.4400,0.0550),(92,14,1,2,13.8900,0.0550),(93,1,2,1,13.4800,0.0550),(93,14,2,2,13.8900,0.0550),(93,16,1,1,13.4200,0.0550),(93,18,2,2,12.6400,0.0550),(93,19,1,2,12.9800,0.0550),(94,2,3,2,14.6200,0.0550),(94,10,1,1,12.2200,0.0550),(94,13,1,2,12.7300,0.0550),(95,2,3,1,14.6200,0.0550),(95,13,3,2,13.7300,0.0550),(95,15,3,2,15.8700,0.0550),(96,5,1,1,14.4800,0.0550),(97,10,1,1,12.2200,0.0550),(97,13,1,2,12.7300,0.0550),(97,14,3,2,14.8900,0.0550),(98,6,3,1,13.8300,0.0550),(99,8,2,2,14.4400,0.0550),(99,10,3,2,13.2200,0.0550),(99,19,3,2,13.9800,0.0550),(100,16,3,1,14.4200,0.0550);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'cb'),(2,'espèces');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_status_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (2,'livraison'),(1,'payé');
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tax_free_unit_price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `vat_rate_100` decimal(6,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pizza_name` (`name`),
  KEY `vat_rate_pizza_fk` (`vat_rate_100`),
  KEY `category_pizza_fk` (`category_id`),
  CONSTRAINT `category_pizza_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `vat_rate_pizza_fk` FOREIGN KEY (`vat_rate_100`) REFERENCES `vat_rate` (`vat_rate_100`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'I Said, I\'ve Got A Big Stick',8.48,6,0.0550),(2,'USS Falchion',8.62,13,0.0550),(3,'UNSC Sagan Blue',9.69,6,0.0550),(4,'Galibi',8.34,11,0.0550),(5,'Hitei Kan',9.48,3,0.0550),(6,'USS Devore',7.83,14,0.0550),(7,'White Star 16',9.35,1,0.0550),(8,'Oceanic Dissonance',9.44,13,0.0550),(9,'EAS Euripides',7.82,2,0.0550),(10,'MCRN Morrigan',7.22,7,0.0550),(11,'EAS Omega',9.26,5,0.0550),(12,'UNSC Midsummer Night',9.11,3,0.0550),(13,'EAS Lexington',7.73,7,0.0550),(14,'Thera Sita',8.89,8,0.0550),(15,'EAS Eratosthenes',9.87,8,0.0550),(16,'Leonid',8.42,10,0.0550),(17,'Spirit of Defiance',9.20,7,0.0550),(18,'HMS Lord Nelson',7.64,14,0.0550),(19,'Bringer of Despair',7.98,5,0.0550),(20,'UNSC Unto the Breach',8.66,14,0.0550);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza_ingredient` (
  `ingredient_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ingredient_id`,`pizza_id`),
  KEY `pizza_pizza_ingredient_fk` (`pizza_id`),
  CONSTRAINT `ingredient_pizza_ingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `pizza_pizza_ingredient_fk` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES (1,3,2.63),(1,4,1.68),(1,8,2.80),(1,12,2.00),(1,15,1.65),(1,16,1.11),(2,1,1.36),(2,2,2.95),(2,3,1.16),(2,4,2.17),(2,6,1.93),(2,7,2.38),(2,10,1.67),(2,11,2.47),(2,14,2.44),(2,15,2.93),(2,16,2.59),(2,18,1.64),(3,2,2.78),(3,4,1.26),(3,6,1.60),(3,8,2.36),(3,10,1.23),(3,13,2.48),(3,14,2.61),(3,15,2.67),(3,16,2.62),(3,17,1.27),(3,18,2.59),(3,19,2.59),(3,20,2.76),(4,4,1.13),(4,6,2.36),(4,8,2.25),(4,9,2.34),(4,11,1.11),(4,12,1.86),(4,14,1.45),(4,16,2.88),(4,18,2.60),(4,19,1.88),(4,20,1.65),(5,5,1.99),(5,7,2.18),(5,10,2.34),(5,14,1.53),(5,19,2.30),(5,20,1.70),(6,5,1.20),(6,6,2.49),(6,12,2.89),(6,13,1.15),(6,15,2.54),(6,16,1.99),(6,17,2.14),(6,18,2.15),(7,1,1.38),(7,5,2.29),(7,6,1.15),(7,9,1.64),(7,10,2.40),(7,13,2.41),(7,15,2.52),(7,16,2.70),(7,17,1.25),(7,18,1.74),(8,1,1.90),(8,2,1.20),(8,3,1.79),(8,5,2.38),(8,7,2.24),(8,9,2.11),(8,10,1.27),(8,11,1.42),(8,12,2.10),(8,13,2.78),(8,16,1.77),(8,17,1.37),(9,1,1.99),(9,2,1.72),(9,6,1.39),(9,8,2.46),(9,9,2.66),(9,11,1.24),(9,12,1.42),(9,17,1.65),(9,18,2.20),(9,19,2.36),(9,20,2.36),(10,3,1.14),(10,5,1.47),(10,6,2.47),(10,9,2.70),(10,10,2.75),(10,15,1.76),(10,17,1.23),(10,18,2.43),(10,20,1.98),(11,2,1.24),(11,5,2.47),(11,6,1.73),(11,8,2.86),(11,9,1.66),(11,11,2.70),(11,12,1.52),(11,18,2.90),(11,19,2.82),(12,1,1.68),(12,6,1.70),(12,7,1.49),(12,11,1.60),(12,12,1.55),(12,13,1.25),(12,18,2.87),(12,19,2.70),(12,20,2.58),(13,2,2.96),(13,5,2.18),(13,7,1.22),(13,8,2.55),(13,9,2.79),(13,10,2.20),(13,11,2.59),(13,13,1.54),(13,14,1.50),(13,17,2.72),(14,1,1.59),(14,4,2.40),(14,7,2.36),(14,8,1.21),(14,9,1.10),(14,10,2.75),(14,11,1.61),(14,15,1.74),(14,18,1.20),(15,2,1.84),(15,3,2.71),(15,6,2.57),(15,7,2.80),(15,8,1.26),(15,9,1.86),(15,13,2.20),(15,15,2.84),(15,16,1.78),(15,17,1.63),(15,19,2.17);
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `address_street_number` varchar(10) NOT NULL,
  `address_street_name` varchar(200) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_postal_code` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pizzeria_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Coste et Fils','+33 (0)4 59 42 32 49','258','rue de Weiss','Remydan','48550'),(2,'Faure','0221126802','658','boulevard de Julien','Torres','15762'),(3,'Sanchez S.A.R.L.','+33 4 28 97 49 86','328','avenue Léon Bruneau','Saint Louisenec','40452'),(4,'Salmon','+33 (0)6 97 36 77 03','11','chemin Leduc','Martel','28961');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'responsable'),(2,'pizzaiolo'),(3,'livreur');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ingredient_factor` decimal(2,1) NOT NULL,
  `extra_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Khazad',2.5,5.00),(2,'Archon',2.6,5.00),(3,'Zodiac',2.9,6.00);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'attente'),(4,'livraison'),(5,'livrée'),(2,'préparation'),(3,'prête');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_history`
--

DROP TABLE IF EXISTS `status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  `customer_order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_status_history_fk` (`status_id`),
  KEY `customer_order_status_history_fk` (`customer_order_id`),
  CONSTRAINT `customer_order_status_history_fk` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `status_status_history_fk` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_history`
--

LOCK TABLES `status_history` WRITE;
/*!40000 ALTER TABLE `status_history` DISABLE KEYS */;
INSERT INTO `status_history` VALUES (1,'2016-10-11 21:15:53',1,1),(2,'2016-10-11 21:25:53',2,1),(3,'2016-10-11 21:52:53',3,1),(4,'2015-07-07 23:01:16',1,2),(5,'2015-07-07 23:33:16',2,2),(6,'2019-09-10 00:00:17',1,3),(7,'2019-01-07 02:34:17',1,4),(8,'2019-01-07 02:48:17',2,4),(9,'2019-01-07 03:12:17',3,4),(10,'2018-02-01 00:43:37',1,5),(11,'2019-02-06 01:29:58',1,7),(12,'2019-02-06 01:42:58',2,7),(13,'2018-06-02 07:46:00',1,8),(14,'2018-06-02 08:08:00',2,8),(15,'2017-02-15 05:06:48',1,9),(16,'2017-02-15 05:38:48',2,9),(17,'2017-02-15 05:50:48',3,9),(18,'2017-09-01 23:21:27',1,11),(19,'2017-09-01 23:55:27',2,11),(20,'2018-12-27 07:30:41',1,12),(21,'2018-12-27 07:58:41',2,12),(22,'2018-12-27 08:33:41',3,12),(23,'2015-04-28 06:47:46',1,15),(24,'2015-04-28 07:17:46',2,15),(25,'2018-05-28 01:31:20',1,16),(26,'2018-05-28 01:58:20',2,16),(27,'2018-10-18 05:34:37',1,17),(28,'2018-10-18 05:46:37',2,17),(29,'2018-10-18 06:18:37',3,17),(30,'2018-10-14 20:01:27',1,19),(31,'2018-10-14 20:25:27',2,19),(32,'2018-10-14 20:48:27',3,19),(33,'2015-12-20 05:52:40',1,21),(34,'2015-12-20 06:09:40',2,21),(35,'2015-12-20 06:40:40',3,21),(36,'2019-10-08 20:35:44',1,22),(37,'2018-01-04 13:11:53',1,24),(38,'2018-01-04 13:37:53',2,24),(39,'2017-05-11 00:16:19',1,25),(40,'2017-05-11 00:26:19',2,25),(41,'2017-05-11 01:00:19',3,25),(42,'2015-08-15 16:54:44',1,26),(43,'2015-08-15 17:16:44',2,26),(44,'2015-08-15 17:32:44',3,26),(45,'2018-06-15 09:17:39',1,27),(46,'2018-06-15 09:45:39',2,27),(47,'2018-06-15 09:56:39',3,27),(48,'2016-02-27 20:32:02',1,28),(49,'2016-02-27 20:43:02',2,28),(50,'2018-04-20 12:21:29',1,30),(51,'2018-04-20 12:52:29',2,30),(52,'2018-04-20 13:25:29',3,30),(53,'2018-08-29 16:43:57',1,31),(54,'2018-08-29 17:01:57',2,31),(55,'2015-08-03 16:01:02',1,32),(56,'2019-02-27 05:11:03',1,33),(57,'2019-02-27 05:39:03',2,33),(58,'2019-06-12 22:38:34',1,34),(59,'2016-04-23 10:22:00',1,35),(60,'2016-04-23 10:45:00',2,35),(61,'2016-04-23 10:56:00',3,35),(62,'2020-02-03 10:45:34',1,36),(63,'2020-02-03 11:01:34',2,36),(64,'2015-04-19 16:26:03',1,37),(65,'2015-04-19 16:45:03',2,37),(66,'2015-04-19 16:58:03',3,37),(67,'2018-12-23 08:10:01',1,40),(68,'2018-12-23 08:21:01',2,40),(69,'2019-09-05 21:21:15',1,43),(70,'2019-09-05 21:32:15',2,43),(71,'2016-06-09 00:14:46',1,44),(72,'2016-02-02 07:20:31',1,45),(73,'2016-02-02 07:41:31',2,45),(74,'2019-08-08 12:33:30',1,46),(75,'2016-07-03 03:07:58',1,47),(76,'2020-01-07 02:42:42',1,48),(77,'2015-12-18 23:58:58',1,50),(78,'2015-12-19 00:10:58',2,50),(79,'2017-01-09 04:10:35',1,51),(80,'2015-09-15 11:12:51',1,52),(81,'2015-09-15 11:36:51',2,52),(82,'2015-09-15 11:52:51',3,52),(83,'2017-11-28 21:42:24',1,54),(84,'2018-01-09 13:38:44',1,57),(85,'2019-11-26 00:00:46',1,59),(86,'2015-03-09 19:22:49',1,60),(87,'2015-07-17 03:00:31',1,63),(88,'2015-07-17 03:22:31',2,63),(89,'2016-07-12 02:36:35',1,64),(90,'2016-07-12 03:10:35',2,64),(91,'2016-07-12 03:32:35',3,64),(92,'2017-12-25 07:27:58',1,65),(93,'2017-12-25 07:52:58',2,65),(94,'2017-12-25 08:05:58',3,65),(95,'2018-07-28 07:59:57',1,66),(96,'2018-11-21 06:17:30',1,67),(97,'2018-11-21 06:37:30',2,67),(98,'2018-11-21 06:49:30',3,67),(99,'2015-06-07 06:20:58',1,68),(100,'2015-06-07 06:53:58',2,68),(101,'2017-07-10 08:29:43',1,69),(102,'2017-07-10 08:41:43',2,69),(103,'2017-07-10 08:51:43',3,69),(104,'2019-06-26 23:32:38',1,70),(105,'2019-06-27 00:01:38',2,70),(106,'2015-08-19 07:04:55',1,71),(107,'2015-08-19 07:14:55',2,71),(108,'2015-12-03 20:24:58',1,73),(109,'2015-12-03 20:40:58',2,73),(110,'2015-12-03 20:57:58',3,73),(111,'2018-02-26 19:51:09',1,74),(112,'2018-02-26 20:12:09',2,74),(113,'2018-02-26 20:44:09',3,74),(114,'2017-01-05 06:52:22',1,75),(115,'2017-01-05 07:19:22',2,75),(116,'2019-02-16 07:59:09',1,76),(117,'2019-02-16 08:25:09',2,76),(118,'2019-02-16 08:56:09',3,76),(119,'2016-02-25 10:17:38',1,78),(120,'2016-02-25 10:27:38',2,78),(121,'2018-11-08 13:53:01',1,79),(122,'2018-11-08 14:19:01',2,79),(123,'2018-11-08 14:29:01',3,79),(124,'2016-03-02 01:07:40',1,81),(125,'2016-03-02 01:22:40',2,81),(126,'2016-08-11 15:17:19',1,83),(127,'2016-08-11 15:51:19',2,83),(128,'2018-05-11 01:17:40',1,84),(129,'2018-05-11 01:51:40',2,84),(130,'2018-05-11 02:26:40',3,84),(131,'2017-10-02 14:39:58',1,85),(132,'2017-10-02 15:11:58',2,85),(133,'2017-10-02 15:41:58',3,85),(134,'2018-01-14 11:54:51',1,86),(135,'2018-01-14 12:08:51',2,86),(136,'2018-12-27 04:42:03',1,87),(137,'2018-12-27 05:00:03',2,87),(138,'2016-11-27 03:54:38',1,88),(139,'2016-11-27 04:18:38',2,88),(140,'2016-05-19 07:05:34',1,89),(141,'2018-01-18 11:56:33',1,90),(142,'2018-01-18 12:29:33',2,90),(143,'2019-08-10 05:49:22',1,92),(144,'2016-08-03 17:00:04',1,93),(145,'2016-08-03 17:17:04',2,93),(146,'2016-08-03 17:32:04',3,93),(147,'2015-10-16 20:13:14',1,94),(148,'2015-10-16 20:34:14',2,94),(149,'2015-10-16 20:59:14',3,94),(150,'2018-06-29 00:24:12',1,95),(151,'2018-06-29 00:50:12',2,95),(152,'2015-06-19 08:13:45',1,96),(153,'2015-06-19 08:24:45',2,96),(154,'2016-07-08 15:22:02',1,98),(155,'2016-07-08 15:50:02',2,98),(156,'2019-12-23 12:53:24',1,100),(157,'2019-12-23 13:23:24',2,100);
/*!40000 ALTER TABLE `status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `restaurant_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  PRIMARY KEY (`restaurant_id`,`ingredient_id`),
  KEY `ingredient_stock_fk` (`ingredient_id`),
  CONSTRAINT `ingredient_stock_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `pizzeria_stock_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,6.40),(1,2,60.75),(1,3,53.25),(1,4,61.51),(1,5,40.16),(1,6,8.38),(1,7,55.21),(1,8,41.19),(1,9,28.89),(1,10,15.75),(1,11,30.29),(1,12,45.87),(1,13,22.70),(1,14,47.47),(1,15,46.67),(2,1,44.15),(2,2,53.56),(2,3,1.86),(2,4,42.10),(2,5,37.61),(2,6,20.76),(2,7,63.36),(2,8,5.80),(2,9,15.62),(2,10,27.23),(2,11,14.55),(2,12,67.29),(2,13,15.60),(2,14,37.53),(2,15,30.79),(3,1,52.72),(3,2,21.48),(3,3,47.34),(3,4,22.17),(3,5,14.87),(3,6,31.78),(3,7,3.15),(3,8,25.80),(3,9,51.73),(3,10,36.90),(3,11,45.49),(3,12,23.90),(3,13,47.66),(3,14,44.31),(3,15,38.98),(4,1,31.60),(4,2,38.28),(4,3,13.38),(4,4,25.33),(4,5,54.87),(4,6,54.32),(4,7,46.21),(4,8,22.90),(4,9,22.49),(4,10,14.84),(4,11,18.16),(4,12,42.11),(4,13,36.36),(4,14,12.16),(4,15,13.56);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vat_rate`
--

DROP TABLE IF EXISTS `vat_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vat_rate` (
  `vat_rate_100` decimal(6,4) NOT NULL,
  PRIMARY KEY (`vat_rate_100`),
  UNIQUE KEY `vat_rate_100` (`vat_rate_100`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vat_rate`
--

LOCK TABLES `vat_rate` WRITE;
/*!40000 ALTER TABLE `vat_rate` DISABLE KEYS */;
INSERT INTO `vat_rate` VALUES (0.0550);
/*!40000 ALTER TABLE `vat_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-04 10:09:25
