------------------------------------------------------------------------------------------------------------------------
-- ADDING DEPARTMENT
insert into departement values
(42,'Génie Informatique'),
(69,'Génie mécanique'),
(0,'Génie robotique'),
(23,'Génie électrique'),
(24,'Génie biotechnologie'),
(12,'Génie chimique'),
(6,'Génie civil'),
(3,'Administration-de-la-faculté');
------------------------------------------------------------------------------------------------------------------------
-- ADDING SOME STUDENTS
INSERT INTO usager VALUES
('gaue3012', 42, 'Gauthier', 'Etienne'),
('najy2001', 42, 'Najmaoui', 'Yassir'),
('beab9999', 42, 'Beaulieu', 'Bernard');
-- ADDING A BUNCH OF STUDENTS
INSERT INTO usager VALUES
('trej2334',42,'Trembla','Jordan Prince'    ),
('traa2306',42,'Tra','Austin-Didier'        ),
('slia3201',42,'Sliman','Aida'              ),
('sera1901',42,'Sermaxha','Adriatik'        ),
('saun2403',42,'Saudrai','Nicolas'          ),
('sanj2302',42,'Santerr','Jonathan'         ),
('royb2006',42,'Ro','Benjamin'              ),
('ricn1501',42,'Richar','Nicolas'           ),
('rica2507',42,'Ricard Lalond','Alexandre'  ),
('poum2319',42,'Pouli','Marc-Antoine'       ),
('perj2324',42,'Perron-Langloi','Joël'      ),
('mera2411',42,'Mercier-Nico','Antoine'     ),
('mate2002',42,'Matt','Eric'                ),
('marq2901',42,'Mariennea','Quentin'        ),
('marf3402',42,'Martel-Deni','Félix'        ),
('maia2604',42,'Maisonneuv','Alex'          ),
('lusf1702',42,'Lussie','Francis'           ),
('lixz2201',42,'L','Zi Long'                ),
('libv2001',42,'Libioull','Valentin'        ),
('leta1602',42,'Létournea','Adam'           ),
('lemc2223',42,'Lemond','Christopher'       ),
('leca2312',42,'Lecler','Alexandre'         ),
('lapf2312',42,'Lapalm','Félix'             ),
('laci2103',42,'Lachanc','Ian'              ),
('jutj2701',42,'Jutea','Jean-Michel'        ),
('janp1702',42,'Janell','Philippe'          ),
('jale1402',42,'Jalber','Etienne'           ),
('hepm1701',42,'Heppel','Marc-Olivier'      ),
('goud2703',42,'Goule','David'              ),
('gosa3202',42,'Gosseli','Alexandra'        ),
('godj2407',42,'Godi','Jérôme'              ),
('frem2110',42,'Frenett','Marc-André'       ),
('fouf2305',42,'Fournier-Gaumon','Frédérick'),
('fonp2402',42,'Fontain','Philippe'         ),
('dupm2216',42,'Dupui','Maxime'             ),
('dror2204',42,'Droui','Raphaël'            ),
('dorh2301',42,'Dorio','Hugo'               ),
('dioj2117',42,'Dionn','Joey'               ),
('diaa2116',42,'Diall','Alex Brian'         ),
('desa2924',42,'Desloge','Anne-Marie'       ),
('desa2727',42,'Desnoyers','Alexandre'	  	),
('cota1810',42,'Côté','Alexandre'           ),
('cord1701',42,'Corbeil Stroomberge','David'),
('comb2301',42,'Compagna','Brian'           ),
('colp2502',42,'Colli','Philippe'           ),
('choj2705',42,'Chouinard-Beaupré','Julien' ),
('cars2019',42,'Carrie','Simon'             ),
('buca2201',23,'Buch','Alexandre'           ),
('brid2302',23,'Brian','Danik'              ),
('brem2104',23,'Breto','Maxime'             ),
('bouv1906',23,'Bougi','Vincent'            ),
('bouj2249',23,'Bouche','Jonathan'          ),
('boug2128',23,'Bouche','Gabriel'           ),
('bouf1819',23,'Bourbonnai','Félix'         ),
('bosb3201',23,'Bossé','Bianca'             ),
('bonp2402',23,'Boni','Philippe'            ),
('bonj2006',23,'Bonsan','Jérémie'           ),
('bolb2201',23,'Bolduc-Meilleu','Benjamin'  ),
('bise2103',23,'Bisso','Éric'               ),
('bert2204',23,'Bernar','Thomas'            ),
('bers3019',23,'Bernier-Ouelle','Simon'     ),
('bena2215',23,'Benoi','Alexandre'          ),
('belo2302',23,'Bellavanc','Olivier'        ),
('beln2109',23,'Bélan','Nicolas'            ),
('becj2903',23,'Béchard Marinie','Joseph'   ),
('beam2039',23,'Beaudoi','Marc-Antoine'     ),
('beal2726',23,'Beaulie','Louis'            ),
('balp2101',23,'Balthaza','Philippe'        ),
('bali1801',23,'Balafre','Ismaël'           ),
('arse1503',23,'Arseneaul','Emile'          ),
('alle2004',23,'Allar','Emeri'              ),
('allb2701',23,'Allaire-Lema','Bruno'       );
------------------------------------------------------------------------------------------------------------------------
-- ADDING STATUS
insert into statut values(1, 'Professeur');
insert into statut values(2, 'Personnel-De-Soutien');
insert into statut values(3, 'Administrateur');
insert into statut values(4, 'Etudiant');
------------------------------------------------------------------------------------------------------------------------
-- ADDING PAVILLONS
-- ASSIGNING STATUS
insert into est_de_statut values(4,'najy2001');
insert into est_de_statut values(4,'gaue3012');
insert into est_de_statut values(1,'beab9999');
------------------------------------------------------------------------------------------------------------------------
-- ADDING ROOMS
-- PAVILLON
insert into pavillon values('C1', 'Genie supérieur');
insert into pavillon values('C2', 'Genie inférieur');
insert into pavillon values('D7', 'Marie-Victorin');
-- FONCTIONS
insert into fonction values
('0110','Salle de classe générale'),
('0111','Salle de classe spécialisée'),
('0120','Salle de séminaire'),
('0121','Cubicules'),
('0210','Laboratoire informatique'),
('0211','Laboratoire d’enseignement spécialisé'),
('0212','Atelier'),
('0213','Salle à dessin'),
('0214','Atelier (civil)'),
('0215','Salle de musique'),
('0216','Atelier sur 2 étages, conjoint avec autre local'),
('0217','Salle de conférence'),
('0372','Salle de réunion'),
('0373','Salle d’entrevue et de tests'),
('0510','Salle de lecture ou de consultation'),
('0620','Auditorium'),
('0625','Salle de concert'),
('0640','Salle d’audience'),
('0930','Salon du personnel'),
('1030','Studio d’enregistrement'),
('1260','Hall d’entrée');
-- CATEGORIES
insert into caracteristique values
(0, 'Connexion à Internet'),
(1, 'Tables fixes en U et chaises mobiles'),
(2, 'Monoplaces'),
(3, 'Tables fixes et chaises fixes'),
(6, 'Tables pour 2 ou + et chaises mobiles'),
(7, 'Tables mobiles et chaises mobiles'),
(8, 'Tables hautes et chaises hautes'),
(9, 'Tables fixes et chaises mobiles'),
(11,'Écran'),
(14,'Rétroprojecteur'),
(15,'Gradins'),
(16,'Fenêtres'),
(17,'1 piano'),
(18,'2 pianos'),
(19,'Autres instruments'),
(20,'Système de son'),
(21,'Salle réservée (spéciale)'),
(22,'Ordinateurs PC'),
(23,'Ordinateurs SUN pour génie électrique'),
(24,'Console multimédia'),
(25,'Ordinateurs(oscillomètre et multimètre)'),
(26,'Ordinateursmodélisation des structures'),
(27,'Ordinateurs PC'),
(28,'Équipementpour microélectronique'),
(29,'Équipementpour génie électrique'),
(30,'Ordinateurset équipement pour mécatroni'),
(31,'Équipementmétrologie'),
(32,'Équipementde machinerie'),
(33,'Équipementde géologie'),
(34,'Équipementpour la caractérisation'),
(35,'Équipementpour la thermodynamique'),
(36,'Équipementpour génie civil'),
(37,'Télévision'),
(38,'VHS'),
(39,'Hauts parleurs'),
(40,'Micro'),
(41,'Magnétophone à cassette'),
(42,'Amplificateur audio'),
(43,'Local barré'),
(44,'Prise réseau');
-- ROOMS

insert into piece values
('C1','5127','0110',39,'Smoking Allowed'),
('C1','5128','0111',39,'No smoking'),
('C1','5129','0111',39,'Help E.T.'),
('C1','5130','0111',39,'No smoking'),
('C1','2018','0212',10,'Matériaux composites'),
('C1','2055','0211',24,''),
('C1','3014','0211',25,'Laboratoire mécatronique'),
('C1','3027','0211',15,'Petit laboratoire de élect'),
('C1','3016','0210',50,''),
('C1','3018','0211',50,''),
('C1','3024','0211',50,''),
('C1','3035','0210',50,''),
('C1','3041','0210',50,''),
('C1','3007','0620',106,'Avec console multi-média'),
('C1','3010','0211',30,'Laboratoire de conception VLSI'),
('C1','4016','0620',91,''),
('C1','4018','0212',10,'Métallurgie'),
('C1','4019','0212',8,'Laboratoire accessoire Atelier'),
('C1','4021','0210',28,''),
('C1','4023','0620',108,''),
('C1','4030','0211',25,'Équipement photoélasticité'),
('C1','4028','0210',14,''),
('C1','4008','0620',106,''),
('C1','5012','0121',35,'8 cubicules'),
('C1','5026','0210',38,'Ordinateurs'),
('C1','5028','0210',50,'Ordinateurs'),
('C1','5001','0620',198,'Avec console multi-média'),
('C1','5009','0111',50,'Avec console multi-média'),
('C1','5006','0620',110,'Avec console multi-média'),
('C2','0009','0214',100,'Grand et équipé'),
('C2','1004','0212',30,'Atelier géologie équipement'),
('C2','1015','0211',40,'Laboratoire d’hydraulique'),
('C2','1042','0211',21,'Laboratoire chimie-physique'),
('C2','2040','0211',40,'Laboratoire sans instrument'),
('D7','2018','0111',57,''),
('D7','3001','0110',35,''),
('D7','3002','0110',22,''),
('D7','3007','0110',54,''),
('D7','3009','0110',45,''),
('D7','3010','0110',21,''),
('D7','3011','0110',50,''),
('D7','3012','0110',54,''),
('D7','3013','0110',44,''),
('D7','3014','0110',40,''),
('D7','3015','0110',48,''),
('D7','3016','0620',125,'Avec console multi-média'),
('D7','3017','0110',45,''),
('D7','3019','0110',48,''),
('D7','3020','0110',35,'Un mur est en fenêtre'),
('C2','251-4','0211',10,'');
insert into piece values
('C1', '5128A', '0121', 5, 'No smoking',null,null, 'C1', '5128'),
('C1', '5128B', '0121', 5, 'No smoking',null,null, 'C1', '5128'),
('C1', '5128C', '0121', 5, 'No smoking',null,null, 'C1', '5128'),
('C1', '5129A', '0121', 5, 'No smoking',null,null, 'C1', '5129'),
('C1', '5129B', '0121', 5, 'No smoking',null,null, 'C1', '5129'),
('C1', '5129C', '0121', 5, 'No smoking',null,null, 'C1', '5129');
insert into piece values
('C1','1007','0212',21,'Grand', time '8:00', time '17:00');
-- ASSIGNING TIME ALLOWED FOR EACH ROOM
insert into temps_avance values(42, 4, '0110', interval '48 hours');
insert into temps_avance values(42, 4, '0111', interval '48 hours');
insert into temps_avance values(42, 4, '0121', interval '48 hours');
insert into temps_avance values(42, 4, '0120', interval '48 hours');
insert into temps_avance values(42, 1, '0110', interval '120 hours');
insert into temps_avance values(42, 1, '0111', interval '120 hours');
insert into temps_avance values(42, 1, '0120', interval '120 hours');
insert into temps_avance values(42, 1, '0217', interval '2 days');
insert into temps_avance values(42, 1, '0212', interval '5 days');
insert into temps_avance values(42, 1, '0121', interval '48 hours');
------------------------------------------------------------------------------------------------------------------------
-- SCHEDULING
insert into reservation values('C1', '5128', 'gaue3012', '2001-09-11 09:00:00', '2001-09-11 09:15:00', 'For eating and watching movies');
insert into reservation values('C1', '5128', 'beab9999', '2001-09-11 09:30:00', '2001-09-11 10:00:00', 'Tutorat APP9 S15');
insert into reservation values('C1', '5128', 'najy2001', '2001-09-11 10:15:00', '2001-09-11 11:00:00', 'RKO by Randy Orton');
insert into reservation values('C1', '5128', 'gaue3012', '2001-09-11 11:15:00', '2001-09-11 12:30:00', 'Watch out Watch out ! Randy Orton');
insert into reservation values('C1', '5128', 'najy2001', '2001-09-11 13:15:00', '2001-09-11 13:30:00', 'Watch out Watch out ! Randy Orton');
insert into reservation values('C1', '5129A','najy2001', '2001-09-11 10:15:00', '2001-09-11 10:30:00', 'Watch out Watch out ! Randy Orton');
insert into reservation values('C1', '5129B','najy2001', '2001-09-11 10:15:00', '2001-09-11 10:30:00', 'Watch out Watch out ! Randy Orton');
insert into reservation values('C1', '5129C','najy2001', '2001-09-11 10:15:00', '2001-09-11 10:30:00', 'Watch out Watch out ! Randy Orton');
insert into reservation values('C1', '1007', 'beab9999', '2001-09-11 08:00:00', '2001-09-11 09:15:00', 'Watch out Watch out ! Randy Orton');

insert into reservation values('C1', '5129', 'beab9999', '2001-09-11 10:00:00', '2001-09-11 10:45:00', 'Watch out Watch out ! Randy Horton');
	-- Devrait pas marcher car cubicules sont reserves à cette plage
insert into reservation values('C1', '5128', 'najy2001', '2001-09-11 08:00:00', '2001-09-11 09:45:00', 'Watch out Watch out ! Randy Horton');
	-- Devrait pas marcher car parent est deja reserve à cette plage
insert into reservation values('C1', '5001', 'beab9999', '2001-09-11 10:45:00', '2001-09-11 11:30:00', 'Watch out Watch out ! Randy Horton');
	-- Devrait pas marcher car 5001 (catégorie 0620) ne peut être réservé par un professeur (statut 1)
insert into reservation values('C1', '5129A','beab9999', '2019-05-20 10:15:00', '2019-05-20 10:30:00', 'Watch out Watch out ! Randy Horton');
	-- Devrait pas marcher car cubicules (catégorie 0121) ne peuvent être reservés que 48 heures à l'avance par un professeur (statut 1)
insert into reservation values('C1', '1007', 'najy2001', '2001-09-11 15:30:00', '2001-09-11 17:45:00', 'Watch out Watch out ! Randy Horton');
	-- Devrait pas marcher car le C1-1007 ne peut être reservé qu'entre 8h et 17h

update reservation
set reserv_deb = '2001-09-11 12:15'
WHERE
		pav_id = 'C1'           AND
		piece_id = '5128'       AND
		usager_cip = 'najy2001' AND
		reserv_deb = '2001-09-11 13:15:00';
	-- Devrait pas marcher char créerait un conflit avec une autre réservation (ligne 253)
------------------------------------------------------------------------------------------------------------------------

/***************************** Tests for logging the reservation delete/update ****************************************/

insert into reservation values('C1', '5127', 'gaue3012', '2001-09-11 9:15:00', '2001-09-11 10:30:00');

-- UPDATING SCHEDULING TEST
update reservation
set reserv_fin = '2001-09-11 11:00'
WHERE
    pav_id = 'C1'           AND
    piece_id = '5127'       AND
    usager_cip = 'gaue3012' AND
    reserv_deb = '2001-09-11 09:15:00';

-- DELETING SCHEDULING TEST
delete from reservation
WHERE
        pav_id = 'C1'           AND
        piece_id = '5127'       AND
        usager_cip = 'gaue3012' AND
        reserv_deb = '2001-09-11 09:15:00';
/**********************************************************************************************************************/

/***************************** Tests pour le tableau de réservation ***************************************************/
select * from TABLEAU(timestamp '2001-09-11 08:00:00', timestamp '2001-09-11 13:45:00', '0121'); -- Pour voir cubicules
select * from TABLEAU(timestamp '2001-09-11 08:00:00', timestamp '2001-09-11 13:45:00', '0111'); -- Pour voir 5128
/**********************************************************************************************************************/
