DROP DATABASE IF EXISTS `MyPet`;
CREATE DATABASE IF NOT EXISTS `MyPet`;
USE `MyPet`;


CREATE TABLE IF NOT EXISTS `User` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45)  NOT NULL,
  `Ruolo` enum('normal_user', 'pet_sitter')  NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB;


INSERT INTO `User` (`Username`, `Password`, `Ruolo`) VALUES
    ('m.bas', 'password', 'pet_sitter'),
    ('m.rossi', 'bianchetto', 'normal_user'),
    ('SegugioSeduto', '12345678', 'pet_sitter'),
    ('Tatamicio', '87654321', 'pet_sitter'),
    ('Pettino', 'pettinero', 'pet_sitter'),
    ('Amicietto', 'lilletto', 'pet_sitter'),
    ('BauBau', 'miaomiao', 'pet_sitter'),
    ('Marty93', 'picciotto', 'pet_sitter'),
    ('Croccantina', 'puntino.', 'pet_sitter'),
    ('A.ccuccia', 'cagnolino', 'pet_sitter'),
    ('Coniglietta', 'carotina', 'pet_sitter');


CREATE TABLE IF NOT EXISTS `UserProfile` (
  `Username` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Email` varchar(300) NOT NULL,
  `Region` varchar(100) NOT NULL,
  `Province` varchar(100) NOT NULL,
  `Address` varchar(200),
  `PhoneNumber` varchar(20) NOT NULL,
  `FirstPetName` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`),
  FOREIGN KEY (`Username`) REFERENCES `User` (`Username`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB;


INSERT INTO `UserProfile` (`Username`, `Name`, `Surname`, `Email`, `Region`, `Province`, `Address`, `PhoneNumber`, `FirstPetName`) VALUES
    ('m.bas', 'Matteo', 'Basili', 'matthew2000.mb@gmail.com', 'Lazio', 'Roma', null, '3888148009', 'Sole'),
    ('m.rossi', 'Mario', 'Rossi', 'mario.rossi@gmail.com', 'Lazio', 'Roma', null, '3334334563', 'Mariuccio'),
    ('SegugioSeduto', 'Sergio', 'Lino', 'segugioseduto@gmail.com', 'Lazio', 'Roma', null, '3314356227', 'Pinolo'),
    ('Tatamicio', 'Tiziana', 'Festa', 'tatamicio@gmail.com', 'Lazio', 'Roma', null, '3923923392', 'Ughetta'),
    ('Pettino', 'Rino', 'Pellino', 'tutto_ino@gmail.com', 'Lazio', 'Roma', null, '3289999990', 'Fulmine'),
    ('Amicietto', 'Luca', 'Verdi', 'verdino00@gmail.com', 'Lazio', 'Roma', null, '3696996679', 'Coal'),
    ('BauBau', 'Sofia', 'Bertino', 'sofiabertino@gmail.com', 'Lazio', 'Roma', null, '3333344567', 'Rocco'),
    ('Marty93', 'Martina', 'Basile', 'marty93@gmail.com', 'Lazio', 'Roma', null, '3888888888', 'Paris'),
    ('Croccantina', 'Laura', 'Barile', 'crick_crock@gmail.com', 'Lazio', 'Roma', null, '3991435643', 'Fido'),
    ('A.ccuccia', 'Francesco', 'Cecchino', 'cecchi.fra@gmail.com', 'Lazio', 'Roma', null, '3311133130', 'Luna'),
    ('Coniglietta', 'Giulia', 'De Vito', 'giulietta99@gmail.com', 'Lazio', 'Roma', null, '3377654388', 'Romeo');
    

CREATE TABLE IF NOT EXISTS `PetSitter` (
  `User` varchar(45) NOT NULL,
  `Dog` boolean NOT NULL,
  `Cat` boolean NOT NULL,
  `OtherPets` boolean NOT NULL,
  `AtHome` boolean NOT NULL,
  `AtPetSitHome` boolean NOT NULL,
  `HomeVisit` boolean NOT NULL,
  `Walk` boolean NOT NULL,
  `ChangeOfLitter` boolean NOT NULL,
  `Description` varchar(2048),
  `Photo` longblob,
  `Likes` integer NOT NULL,
  `Dislikes` integer NOT NULL,
  PRIMARY KEY (`User`),
  FOREIGN KEY (`User`) REFERENCES `UserProfile` (`Username`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB;


INSERT INTO `PetSitter` (`User`, `Dog`, `Cat`, `OtherPets`, `AtHome`, `AtPetSitHome`, `HomeVisit`, `Walk`, `ChangeOfLitter`, `Description`, `Photo`, `Likes`, `Dislikes`) VALUES
    ('m.bas', true, true, true, true, false, true, true, true, 'Mi chiamo Matteo, ho 22 anni, gioco a pallavolo e ho due bellissimi animali, un cane lasha apso e una gattina nera. In passato ho avuto altri animali inclusi conigli e perfino un insetto stecco. Non ho trovato foto con animali visto che ho perso la maggior parte delle foto in galleria, comunque poter lavorare con gli animali per me è un piacere. Abito a Roma sud, ma sono disponibile in tutta Roma e dintorni. Per qualsiasi informazione contattatemi pure.', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/mbas.jpeg'), 30, 1),
    ('SegugioSeduto', true, true, true, true, false, true, true, true, 'Sono sempre disponibile. Amo gli animali.', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/segugioseduto.jpg'), 0, 1),
    ('Tatamicio', false, true, true, true, false, false, true, true, 'Come tutti, sono un amante degli animali! Grandissimi amici e confidenti! Mi prendo dei cuccioli da quando sono più "giovane" ho sempre ritrovato un senso di pace che mi cambia le giornate!', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tatamicio.jpeg'), 1, 2),
    ('Pettino', true, false, false, true, false, true, false, true, 'Amo le persone e i cani.', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pettino.jpeg'), 16, 5),
    ('Amicietto', true, true, true, true, false, true, true, false, null, LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amicietto.jpeg'), 2, 0),
    ('BauBau', true, true, false, false, false, true, true, true, 'Sono una ragazza di 28 anni, studentessa di una triennale di veterinaria, sono disponibilissima per tenere compagnia ai vostri animali, sono ferrata nel comportamento animale sia di cani ma soprattutto di gatti. Non esitate a contattarmi!', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/baubau.jpeg'), 10, 1),
    ('Marty93', true, true, true, true, false, true, true, true, 'Sono stata adottata, fino ad ora, da 3 meravigliose gatte, due della stessa cucciolata e una sperduta.; una coniglia fuggitiva; una tartarughina abbandonata; un gatto libero. Sono cresciuta con un barboncino gigante, i gatti e i cani di mia nonna; due gatte, due tartarughine di acqua e una criceta quando ero a casa dei miei . Ora sono gatto e animale dipendente ma in astinenza per mancanza di spazio e per esigenze professionali.', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/marty93.jpeg'), 0, 2),
    ('Croccantina', true, false, false, true, false, false, false, true, null, LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/croccantina.jpg'), 0, 0),
    ('A.ccuccia', true, true, false, true, true, false, true, true, 'Addestratore cinofilo Enci e figura professionale di riferimento per i vostri cani e gatti. Ho un centro cinofilo, Lupo2.0. Disponibilità per: Educazione base e addestramento sportivo. Asilo/pensione/passeggiate o dog sitting giornaliero a domicilio. Qualsiasi cosa cercherò di essere disponibile e garantire il massimo della qualità. Istruttore primo soccorso veterinario e possibilità di progetti i.a.a di ogni tipo, in ecquipe con pubblico e privato. Cerco di operare soprattutto tra 7/8/9 municipio a Roma. Ardeatina/eur/ montagnola,Appia, centro, laurentina, cecchignola, Castel di leva, torricola, divin amore, ostiense, vallerano, Capannelle. Cordiali saluti Gabriele', null, 1, 3),
    ('Coniglietta', true, true, true, true, true, true, true, false, 'Ciao, sono giulia ho 16 anni e amo gli animali, frequento la scuola ma vorrei iniziare a guadagnare qualcosa occupandomi di una cosa che amo! Gli animali! Ho avuto cani, conigli, rettili, pesci, tartarughe un pò di tutto!! Ma per problemi non posso tenerne piu in casa, quindi sarei felicissima di occuparmenene, se vi interessa contattatemi!', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/coniglietta.jpg'), 21, 2);


CREATE TABLE IF NOT EXISTS `Rating` (
  `User` varchar(45) NOT NULL,
  `PetSitter` varchar(45) NOT NULL,
  `Vote` integer NOT NULL,   -- 1 Like, 2 Dislike
  PRIMARY KEY (`User`, `PetSitter`),
  FOREIGN KEY (`User`) REFERENCES `UserProfile` (`Username`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
  FOREIGN KEY (`PetSitter`) REFERENCES `PetSitter` (`User`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB;


INSERT INTO `Rating` (`User`, `PetSitter`, `Vote`) VALUES
    ('m.bas', 'A.ccuccia', 1),
    ('m.bas', 'SegugioSeduto', 2),
    ('m.bas', 'Tatamicio', 1);


CREATE TABLE IF NOT EXISTS `Favorites` (
  `User` varchar(45) NOT NULL,
  `PetSitter` varchar(45) NOT NULL,
  PRIMARY KEY (`User`, `PetSitter`),
  FOREIGN KEY (`User`) REFERENCES `UserProfile` (`Username`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
  FOREIGN KEY (`PetSitter`) REFERENCES `PetSitter` (`User`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB;



DELIMITER $$
-- Procedura per effettuare il login

CREATE PROCEDURE login (in var_username varchar(45), in var_pass varchar(45), out var_role INT)
BEGIN
	DECLARE var_user_role enum('normal_user', 'pet_sitter');
    
    SELECT `Ruolo` FROM `User`
		WHERE BINARY `Username` = var_username
        AND BINARY `Password` = var_pass
        INTO var_user_role;
        
	-- See the corresponding enum in the client
		IF var_user_role = 'normal_user' THEN
			SET var_role = 1;
		ELSEIF var_user_role = 'pet_sitter' THEN
			SET var_role = 2;
		ELSE
			SET var_role = 3;
		END IF;
END
$$

-- Procedura che restituisce la password di un utente

CREATE PROCEDURE recover_password (in var_email varchar(300), in var_pet varchar(45), out var_pwd varchar(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `Password`
		FROM `UserProfile` UP JOIN `User` U
							ON (UP.`Username` = U.`Username`)
        WHERE UP.`Email` = var_email AND BINARY UP.`FirstPetName` = var_pet
        INTO var_pwd;
        
	COMMIT;
END
$$

-- Procedura per registrare le credenziali di accesso

CREATE PROCEDURE register_credentials (in var_username varchar(45), in var_password varchar(45), in var_role enum('normal_user', 'pet_sitter'), out var_out boolean)
BEGIN
    DECLARE var_bool boolean;
    
	SET var_bool = false;
            
	INSERT INTO `User` (`Username`, `Password`, `Ruolo`) VALUES
		(var_username, var_password, var_role);
	IF (ROW_COUNT() > 0) THEN
		SET var_bool = true;
	END IF;
    
    SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura per registrare le informazioni di un utente

CREATE PROCEDURE register_user_info (in var_username varchar(45), in var_name varchar(45), in var_surname varchar(45), in var_email varchar(300),
								in var_region varchar(100), in var_province varchar(100), in var_addr varchar(200), in var_phone varchar(20),
                                in var_pet_name varchar(45), out var_out boolean)
BEGIN
    DECLARE var_bool boolean;
    DECLARE var_address varchar(200);
    
	SET var_bool = false;
	IF (var_addr = '') THEN
		SET var_address = null;
	ELSE
		SET var_address = var_addr;
    END IF;
            
	INSERT INTO `UserProfile` (`Username`, `Name`, `Surname`, `Email`, `Region`, `Province`, `Address`, `PhoneNumber`, `FirstPetName`) VALUES
		(var_username, var_name, var_surname, var_email, var_region, var_province, var_address, var_phone, var_pet_name);
	IF (ROW_COUNT() > 0) THEN
		SET var_bool = true;
	END IF;
    
    SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura per registrare un pet sitter

CREATE PROCEDURE register_pet_sitter (in var_username varchar(45), in var_dog boolean, in var_cat boolean, in var_other boolean,
                                in var_serv1 boolean, in var_serv2 boolean, in var_serv3 boolean, in var_serv4 boolean, in var_serv5 boolean,
                                in var_desc varchar(2048), out var_out boolean)
BEGIN
    DECLARE var_bool boolean;
    DECLARE var_description varchar(2048);
    
	SET var_bool = false;
    IF (var_desc = '') THEN
		SET var_description = null;
	ELSE
		SET var_description = var_desc;
    END IF;
            
	INSERT INTO `PetSitter` (`User`, `Dog`, `Cat`, `OtherPets`, `AtHome`, `AtPetSitHome`, `HomeVisit`, `Walk`, `ChangeOfLitter`, `Description`, `Likes`, `Dislikes`) VALUES
			(var_username, var_dog, var_cat, var_other, var_serv1, var_serv2, var_serv3, var_serv4, var_serv5, var_description, 0, 0);
    IF (ROW_COUNT() > 0) THEN
		SET var_bool = true;
	END IF;
    
    SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura per effettuare la registrazione di un utente

CREATE PROCEDURE register_user (in var_name varchar(45), in var_surname varchar(45), in var_username varchar(45), in var_email varchar(300), in var_pass varchar(45),
								in var_region varchar(100), in var_province varchar(100), in var_addr varchar(200), in var_phone varchar(20),
                                in var_pet_name varchar(45), in var_pet_sitter boolean, in var_dog boolean, in var_cat boolean, in var_other boolean,
                                in var_serv1 boolean, in var_serv2 boolean, in var_serv3 boolean, in var_serv4 boolean, in var_serv5 boolean,
                                in var_desc varchar(2048), out var_out boolean)
BEGIN
	DECLARE var_role enum('normal_user', 'pet_sitter');
    DECLARE var_bool boolean;
    DECLARE var_bool0 boolean;
	DECLARE var_bool1 boolean;
    DECLARE var_bool2 boolean;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
    
		SET var_bool = false;

		IF var_pet_sitter = true THEN
			SET var_role = 'pet_sitter';
		ELSE
			SET var_role = 'normal_user';
		END IF;
            
        CALL register_credentials(var_username, var_pass, var_role, var_bool0);
		IF (var_bool0 = true) THEN
			CALL register_user_info(var_username, var_name, var_surname, var_email, var_region, var_province, var_addr, var_phone, var_pet_name, var_bool1);
			IF (var_bool1 = true AND var_pet_sitter = true) THEN
				CALL register_pet_sitter(var_username, var_dog, var_cat, var_other, var_serv1, var_serv2, var_serv3, var_serv4, var_serv5, var_desc, var_bool2);
				IF (var_bool2 = false) THEN
                    SET var_bool = false;
					DELETE FROM `UserProfile`
					WHERE BINARY `Username` = var_username;
                    DELETE FROM `User`
					WHERE BINARY `Username` = var_username;
				ELSE
					SET var_bool = true;
				END IF;
			ELSEIF (var_bool1 = true AND var_pet_sitter = false) THEN
				SET var_bool = true;
			ELSE
				SET var_bool = false;
                DELETE FROM `User`
				WHERE BINARY `Username` = var_username;
			END IF;
		ELSE
			SET var_bool = false;
		END IF;
		
        SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura per salvare la foto profilo di un utente

CREATE PROCEDURE save_profile_photo (in var_user varchar(45), in var_photo longblob, out var_out boolean)
BEGIN
	DECLARE var_bool boolean;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;

		SET var_bool = false;

		UPDATE `PetSitter`
        SET `Photo` = var_photo
        WHERE BINARY `User` = var_user;
        IF (ROW_COUNT() > 0) THEN
			SET var_bool = true;
		END IF;
        
        SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura che restituisce la foto profilo di un utente

CREATE PROCEDURE load_profile (in var_user varchar(45), out var_photo longblob, out var_likes integer, out var_dislikes integer)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `Photo`, `Likes`, `Dislikes`
		FROM `PetSitter`
        WHERE BINARY `User` = var_user
        INTO var_photo, var_likes, var_dislikes;
        
	COMMIT;
END
$$

-- Procedura che recupera le informazioni personali di un utente

CREATE PROCEDURE recover_user_info (in var_user varchar(45), out var_name varchar(45), out var_surname varchar(45), out var_email varchar(300),
									out var_region varchar(100), out var_province varchar(100), out var_address varchar(200),
									out var_phone varchar(20), out var_first_pet varchar(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `Name`, `Surname`, `Email`, `Region`, `Province`, `Address`, `PhoneNumber`, `FirstPetName`
		FROM `UserProfile`
        WHERE BINARY `Username` = var_user
        INTO var_name, var_surname, var_email, var_region, var_province, var_address, var_phone, var_first_pet;
        
	COMMIT;
END
$$

-- Procedura che salva le informazioni personali di un utente

CREATE PROCEDURE save_user_info (in var_user varchar(45), in var_name varchar(45), in var_surname varchar(45), in var_email varchar(300),
									in var_region varchar(100), in var_province varchar(100), in var_addr varchar(200),
									in var_phone varchar(20), in var_first_pet varchar(45), out var_out boolean)
BEGIN
	DECLARE var_bool boolean;
    DECLARE var_address varchar(200);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
        
        SET var_bool = false;
        IF (var_addr = '') THEN
			SET var_address = null;
		ELSE
			SET var_address = var_addr;
		END IF;
        
		UPDATE `UserProfile`
        SET `Name` = var_name, `Surname` = var_surname, `Email` = var_email, `Region` = var_region, `Province` = var_province, `Address` = var_address,
			`PhoneNumber` = var_phone, `FirstPetName` = var_first_pet
        WHERE BINARY `Username` = var_user;
        IF (ROW_COUNT() > 0) THEN
			SET var_bool = true;
		END IF;
        
        SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura che restituisce gli anmimali accuditi da un pet sitter

CREATE PROCEDURE recover_pet_sit_cared_pets (in var_user varchar(45), out var_pet1 boolean, out var_pet2 boolean, out var_pet3 boolean)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `Dog`, `Cat`, `OtherPets`
		FROM `PetSitter`
        WHERE BINARY `User` = var_user
        INTO var_pet1, var_pet2, var_pet3;
        
	COMMIT;
END
$$

-- Procedura che salva gli animali accuditi da un pet sitter

CREATE PROCEDURE save_pet_sit_cared_pets (in var_user varchar(45), in var_pet1 boolean, in var_pet2 boolean, in var_pet3 boolean, out var_out boolean)
BEGIN
	DECLARE var_bool boolean;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
		
        SET var_bool = false;
        
		UPDATE `PetSitter`
        SET `Dog` = var_pet1, `Cat` = var_pet2, `OtherPets` = var_pet3
        WHERE BINARY `User` = var_user;
        IF (ROW_COUNT() > 0) THEN
			SET var_bool = true;
		END IF;
        
        SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura che restituisce i servizi di un pet sitter

CREATE PROCEDURE recover_pet_sit_services (in var_user varchar(45), out var_serv1 boolean, out var_serv2 boolean, out var_serv3 boolean,
										   out var_serv4 boolean, out var_serv5 boolean, out var_desc varchar(2048))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `AtHome`, `AtPetSitHome`, `HomeVisit`, `Walk`, `ChangeOfLitter`, `Description`
		FROM `PetSitter`
        WHERE BINARY `User` = var_user
        INTO var_serv1, var_serv2, var_serv3, var_serv4, var_serv5, var_desc;
        
	COMMIT;
END
$$

-- Procedura che salva i servizi di un pet sitter

CREATE PROCEDURE save_pet_sit_services (in var_user varchar(45), in var_serv1 boolean, in var_serv2 boolean, in var_serv3 boolean,
										in var_serv4 boolean, in var_serv5 boolean, in var_desc varchar(2048), out var_out boolean)
BEGIN
	DECLARE var_bool boolean;
    DECLARE var_description varchar(2048);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
            
        SET var_bool = false;
        IF (var_desc = '') THEN
			SET var_description = null;
		ELSE
			SET var_description = var_desc;
		END IF;
		
		UPDATE `PetSitter`
        SET `AtHome` = var_serv1, `AtPetSitHome` = var_serv2, `HomeVisit` = var_serv3, `Walk` = var_serv4, `ChangeOfLitter` = var_serv5, `Description` = var_description
        WHERE BINARY `User` = var_user;
        IF (ROW_COUNT() > 0) THEN
			SET var_bool = true;
		END IF;
        
        SET var_out = var_bool;
        
	COMMIT;
END
$$

-- Procedura per vedere se un username è stato già preso

CREATE PROCEDURE is_username_used (in var_username varchar(45), out var_used boolean)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
		
        IF EXISTS (SELECT `Username`
		           FROM `User`
		           WHERE BINARY `Username` = var_username) THEN
			SET var_used = true;
		ELSE
			SET var_used = false;
		END IF;
        
	COMMIT;
END
$$

-- Procedura per vedere se un'email è già usata, per la registrazione

CREATE PROCEDURE is_email_used_registration (in var_email varchar(300), out var_used boolean)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
		
        IF EXISTS (SELECT `Email`
		           FROM `UserProfile`
		           WHERE `Email` = var_email) THEN
			SET var_used = true;
		ELSE
			SET var_used = false;
		END IF;
        
	COMMIT;
END
$$

-- Procedura per vedere se un'email è già usata, per il cambio

CREATE PROCEDURE is_email_used_change (in var_user varchar(45), in var_email varchar(300), out var_used boolean)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
		
        IF EXISTS (SELECT `Email`
		           FROM `UserProfile`
		           WHERE `Email` = var_email AND `Username` != var_user) THEN
			SET var_used = true;
		ELSE
			SET var_used = false;
		END IF;
        
	COMMIT;
END
$$

-- Procedura che ricerca i pet sitter

CREATE PROCEDURE search_pet_sitter(in var_pet1 boolean, in var_pet2 boolean, in var_pet3 boolean, in var_region varchar(100), in var_province varchar(100))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		IF (var_pet1 = false AND var_pet2 = false AND var_pet3 = false) THEN
			
            IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
		
        ELSEIF (var_pet1 = true AND var_pet2 = true AND var_pet3 = true) THEN
			
            IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Dog` = var_pet1 AND `Cat` = var_pet2 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Dog` = var_pet1 AND `Cat` = var_pet2 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
		ELSEIF (var_pet1 = true AND var_pet2 = false AND var_pet3 = false) THEN
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Dog` = var_pet1
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Dog` = var_pet1
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
        ELSEIF (var_pet1 = false AND var_pet2 = true AND var_pet3 = false) THEN
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Cat` = var_pet2
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Cat` = var_pet2
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
        ELSEIF (var_pet1 = false AND var_pet2 = false AND var_pet3 = true) THEN
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
        ELSEIF (var_pet1 = true AND var_pet2 = true AND var_pet3 = false) THEN
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Dog` = var_pet1 AND `Cat` = var_pet2
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Dog` = var_pet1 AND `Cat` = var_pet2
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
        ELSEIF (var_pet1 = true AND var_pet2 = false AND var_pet3 = true) THEN
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Dog` = var_pet1 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Dog` = var_pet1 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
            
		ELSE
        
			IF (var_province = '') THEN
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Region` = var_region AND `Cat` = var_pet2 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			ELSE
				SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
				FROM `PetSitter` P JOIN `UserProfile` U
								ON (P.`User` = U.`Username`)
				WHERE `Province` = var_province AND `Cat` = var_pet2 AND `OtherPets` = var_pet3
                ORDER BY `Likes` DESC, `Dislikes` ASC;
			END IF;
        
        END IF;
        
	COMMIT;
END
$$

-- Procedura che restituisce se un pet sitter è nella lista dei preferiti di un utente

CREATE PROCEDURE recover_pet_sitter_favorite (in var_user varchar(45), in var_pet_sit varchar(45), out var_fav boolean)
BEGIN
		IF EXISTS (SELECT *
				   FROM `Favorites`
                   WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit) THEN
			SET var_fav = true;
		ELSE
			SET var_fav = false;
		END IF;
END
$$

-- Procedura per aggiungere/rimuovere un pet sitter dai preferiti

CREATE PROCEDURE set_favorite (in var_user varchar(45), in var_pet_sit varchar(45), out var_fav boolean)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
    
		IF EXISTS (SELECT *
				   FROM `Favorites`
                   WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit) THEN
			DELETE FROM `Favorites`
            WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit;
            SET var_fav = false;
		ELSE
			INSERT INTO `Favorites` (`User`, `PetSitter`) VALUES
				(var_user, var_pet_sit);
			SET var_fav = true;
		END IF;
        
	COMMIT;
END
$$

-- Procedura che restituisce i pet sitter preferiti di un utente

CREATE PROCEDURE load_pet_sit_favorites (in var_user varchar(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT `Photo`, `Username`, `Region`, `Province`, `Likes`, `Dislikes`
		FROM `PetSitter` P JOIN `UserProfile` U
							ON (P.`User` = U.`Username`)
		WHERE `User` IN (SELECT `PetSitter`
						 FROM `Favorites` F
                         WHERE BINARY F.`User` = var_user)
		ORDER BY `Likes` DESC, `Dislikes` ASC;
        
	COMMIT;
END
$$

-- Procedura che restituisce il rating di un pet sitter da parte di un utente

CREATE PROCEDURE recover_pet_sitter_rating (in var_user varchar(45), in var_pet_sit varchar(45), out var_rate integer)
BEGIN
		IF EXISTS (SELECT *
				   FROM `Rating`
                   WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit) THEN
			SELECT `Vote`
            FROM `Rating`
            WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit
            INTO var_rate;
		ELSE
			SET var_rate = 0;
		END IF;
END
$$

-- Procedura che restituisce i dettagli di un pet sitter

CREATE PROCEDURE load_pet_sit_details (in var_user varchar(45), in var_pet_sit varchar(45), out var_fav boolean, out var_rate integer)
BEGIN
	DECLARE var_pref boolean;
	DECLARE var_r integer;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;
    START TRANSACTION;
    
		SELECT P.*, `Name`, `Surname`, `Email`, `Province`, `PhoneNumber`
		FROM `PetSitter` P JOIN `UserProfile` U
							ON (P.`User` = U.`Username`)
		WHERE BINARY `User` = var_pet_sit;
        
        CALL recover_pet_sitter_favorite (var_user, var_pet_sit, var_pref);
        CALL recover_pet_sitter_rating (var_user, var_pet_sit, var_r);
        
        SET var_fav = var_pref;
        SET var_rate = var_r;
        
	COMMIT;
END
$$

-- Procedura per aggiungere una votazione per un pet sitter

CREATE PROCEDURE rate_pet_sitter (in var_user varchar(45), in var_pet_sit varchar(45), in var_rate integer, out var_out boolean)
BEGIN
    DECLARE var_bool boolean;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;
	END;
    
	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
	START TRANSACTION;
    
		SET var_bool = false;
    
		IF EXISTS (SELECT *
				   FROM `Rating`
                   WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit) THEN
			
            IF (var_rate = 3) THEN
				UPDATE `Rating`
                SET `Vote` = 2
                WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit;
            
				UPDATE `PetSitter`
				SET `Likes` = `Likes` - 1, `Dislikes` = `Dislikes` + 1
                WHERE `User` = var_pet_sit;
			ELSEIF (var_rate = 4) THEN
				UPDATE `Rating`
                SET `Vote` = 1
                WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit;
                
                UPDATE `PetSitter`
				SET `Dislikes` = `Dislikes` - 1, `Likes` = `Likes` + 1
                WHERE `User` = var_pet_sit;
			ELSEIF (var_rate = 5) THEN
				DELETE FROM `Rating`
				WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit;
                
                UPDATE `PetSitter`
				SET `Likes` = `Likes` - 1
                WHERE `User` = var_pet_sit;
            ELSE
				DELETE FROM `Rating`
				WHERE BINARY `User` = var_user AND BINARY `PetSitter` = var_pet_sit;
                
                UPDATE `PetSitter`
				SET `Dislikes` = `Dislikes` - 1
                WHERE `User` = var_pet_sit;
			END IF;
            
			SET var_bool = true;
		ELSE
			INSERT INTO `Rating` (`User`, `PetSitter`, `Vote`) VALUES
				(var_user, var_pet_sit, var_rate);
			
            IF (var_rate = 1) THEN
				UPDATE `PetSitter`
				SET `Likes` = `Likes` + 1
                WHERE `User` = var_pet_sit;
			ELSE
				UPDATE `PetSitter`
				SET `Dislikes` = `Dislikes` + 1
                WHERE `User` = var_pet_sit;
            END IF;
            
			SET var_bool = true;
		END IF;
        
        SET var_out = var_bool;
        
	COMMIT;
END
$$