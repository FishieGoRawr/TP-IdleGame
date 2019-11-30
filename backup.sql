-- --------------------------------------------------------
-- Hôte :                        J-C236-OL-06
-- Version du serveur:           Microsoft SQL Server 2017 (RTM-GDR) (KB4505224) - 14.0.2027.2
-- SE du serveur:                Windows 10 Education 10.0 <X64> (Build 18362: )
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Characters
CREATE TABLE IF NOT EXISTS "Characters" (
	"CharID" INT(10,0) NOT NULL,
	"CharRaceID" INT(10,0) NOT NULL,
	"CharClassID" INT(10,0) NOT NULL,
	"CharStatus" NVARCHAR(25) NOT NULL,
	"CharName" NVARCHAR(50) NULL DEFAULT NULL,
	"CharLevel" INT(10,0) NOT NULL,
	"CharExp" INT(10,0) NOT NULL,
	"CharGP" INT(10,0) NOT NULL,
	"CharQuestProgression" INT(10,0) NOT NULL,
	"CharHP" INT(10,0) NOT NULL,
	"CharMaxHP" INT(10,0) NOT NULL,
	"CharHPRegen" INT(10,0) NOT NULL,
	"CharMP" INT(10,0) NOT NULL,
	"CharMaxMP" INT(10,0) NOT NULL,
	"CharMPRegen" INT(10,0) NOT NULL,
	"CharStr" INT(10,0) NOT NULL,
	"CharCon" INT(10,0) NOT NULL,
	"CharDex" INT(10,0) NOT NULL,
	"CharInt" INT(10,0) NOT NULL,
	"CharWis" INT(10,0) NOT NULL,
	"CharLck" INT(10,0) NOT NULL,
	"CharHeadID" INT(10,0) NULL DEFAULT NULL,
	"CharTorsoID" INT(10,0) NULL DEFAULT NULL,
	"CharLegsID" INT(10,0) NULL DEFAULT NULL,
	"CharBootsID" INT(10,0) NULL DEFAULT NULL,
	"CharGlovesID" INT(10,0) NULL DEFAULT NULL,
	"CharWeap1ID" INT(10,0) NULL DEFAULT NULL,
	"CharWeap2ID" INT(10,0) NULL DEFAULT NULL,
	"CharNeckLaceID" INT(10,0) NULL DEFAULT NULL,
	"CharRing1ID" INT(10,0) NULL DEFAULT NULL,
	"CharRing2ID" INT(10,0) NULL DEFAULT NULL,
	"CharCurrHP" INT(10,0) NOT NULL DEFAULT ('100'),
	PRIMARY KEY ("CharID")
);

-- Listage des données de la table BD_IdleGame.Characters : -1 rows
/*!40000 ALTER TABLE "Characters" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. CharLoot
CREATE TABLE IF NOT EXISTS "CharLoot" (
	"CharLootID" INT(10,0) NOT NULL,
	"CharLootCharacterID" INT(10,0) NULL DEFAULT NULL,
	"CharLootLootID" INT(10,0) NULL DEFAULT NULL,
	"CharLootQty" INT(10,0) NULL DEFAULT NULL,
	PRIMARY KEY ("CharLootID")
);

-- Listage des données de la table BD_IdleGame.CharLoot : -1 rows
/*!40000 ALTER TABLE "CharLoot" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Classes
CREATE TABLE IF NOT EXISTS "Classes" (
	"ClassID" INT(10,0) NOT NULL,
	"ClassName" NVARCHAR(50) NOT NULL,
	PRIMARY KEY ("ClassID")
);

-- Listage des données de la table BD_IdleGame.Classes : -1 rows
/*!40000 ALTER TABLE "Classes" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Dungeons
CREATE TABLE IF NOT EXISTS "Dungeons" (
	"DungeonID" INT(10,0) NOT NULL,
	"DungeonLevel" INT(10,0) NOT NULL,
	"KillQty" INT(10,0) NOT NULL,
	"DungeonName" NVARCHAR(50) NOT NULL DEFAULT ('n/a'),
	"DungeonReward" INT(10,0) NOT NULL DEFAULT ('0'),
	PRIMARY KEY ("DungeonID")
);

-- Listage des données de la table BD_IdleGame.Dungeons : -1 rows
/*!40000 ALTER TABLE "Dungeons" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Encounters
CREATE TABLE IF NOT EXISTS "Encounters" (
	"EncounterID" INT(10,0) NOT NULL,
	"EncounterDungeonID" INT(10,0) NULL DEFAULT NULL,
	"EncounterMonsterID" INT(10,0) NULL DEFAULT NULL,
	"EncounterProbability" FLOAT(53) NULL DEFAULT NULL
);

-- Listage des données de la table BD_IdleGame.Encounters : -1 rows
/*!40000 ALTER TABLE "Encounters" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Equipements
CREATE TABLE IF NOT EXISTS "Equipements" (
	"EquipID" INT(10,0) NOT NULL,
	"EquipEquipTypeID" INT(10,0) NULL DEFAULT NULL,
	"EquipName" NVARCHAR(50) NULL DEFAULT NULL,
	"EquipValue" INT(10,0) NULL DEFAULT NULL,
	"EquipLevel" INT(10,0) NOT NULL DEFAULT ('0'),
	"EquipFlatAtk" INT(10,0) NOT NULL DEFAULT ('0'),
	"EquipFlatDef" INT(10,0) NOT NULL DEFAULT ('0'),
	PRIMARY KEY ("EquipID")
);

-- Listage des données de la table BD_IdleGame.Equipements : -1 rows
/*!40000 ALTER TABLE "Equipements" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. EquipType
CREATE TABLE IF NOT EXISTS "EquipType" (
	"EquipTypeID" INT(10,0) NOT NULL,
	"EquipTypeName" NVARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY ("EquipTypeID")
);

-- Listage des données de la table BD_IdleGame.EquipType : -1 rows
/*!40000 ALTER TABLE "EquipType" DISABLE KEYS */;

-- Listage de la structure de la base pour BD_IdleGame
CREATE DATABASE IF NOT EXISTS "BD_IdleGame";
USE "BD_IdleGame";

-- Listage de la structure de la table BD_IdleGame. Fights
CREATE TABLE IF NOT EXISTS "Fights" (
	"FightID" INT(10,0) NOT NULL,
	"FightCharacterID" INT(10,0) NULL DEFAULT NULL,
	"FightMonsterID" INT(10,0) NULL DEFAULT NULL,
	"MonsterCurrentHP" INT(10,0) NULL DEFAULT NULL
);

-- Listage des données de la table BD_IdleGame.Fights : -1 rows
/*!40000 ALTER TABLE "Fights" DISABLE KEYS */;
/*!40000 ALTER TABLE "Fights" ENABLE KEYS */;

-- Listage de la structure de la fonction BD_IdleGame. fnGetCharacterInfos
DELIMITER //
CREATE FUNCTION [dbo].[fnGetCharacterInfos] (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT CharCurrHP as CurrHP, CharStr AS Str, CharCon AS Con, CharDex AS Dex, CharInt AS Intel, CharWis AS Wis, CharLck AS Luck, CharName AS Name, ClassName AS Class, RaceName AS Race, CharGP AS GP, CharLevel AS Level, CharExp AS Exp
	FROM (Characters INNER JOIN Races ON CharRaceID = RaceID) INNER JOIN Classes ON CharClassID = ClassID
	WHERE CharID = @CharID//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fnGetCharacterLoot
DELIMITER //
CREATE FUNCTION fnGetCharacterLoot (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT LootName AS Name, LootValue AS Value, CharLootQty AS Qty FROM CharLoot INNER JOIN Loots ON CharLootLootID = LootID
	WHERE CharLoot.CharLootCharacterID = @CharID//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fnGetCountLoot
DELIMITER //
Create Function fnGetCountLoot(@playerId int)
Returns Integer
As
Begin
	Declare @count int
	Set @count = (Select Count(CharLootID) From CharLoot Where CharLootCharacterID = @playerId)
	Return @count
End//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fnGetFirstLoot
DELIMITER //
Create Function fnGetFirstLoot(@playerId int)
Returns Integer
As
Begin
	Declare @idFirst int
	Set @idFirst = (Select Top 1 CharLootID From CharLoot Where CharLootCharacterID = @playerId)
	Return @idFirst
End//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fnGetNameOneLoot
DELIMITER //
Create Function fnGetNameOneLoot(@playerId int, @lootId int)
Returns Table
As
Return Select LootName 
From Loots Inner Join CharLoot ON LootID = CharLootLootId 
Where CharLootLootID = @lootId AND CharLootCharacterID = @playerId
//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fnIncomeSellAllLoot
DELIMITER //
Create Function fnIncomeSellAllLoot(@playerId int)
Returns Integer
As
Begin
	Declare @income int
	Set @income = (Select Sum(LootValue) From Loots Inner Join CharLoot ON LootID = CharLootLootId Where CharLootCharacterID = @playerId)
	Return @income
End//
DELIMITER ;

-- Listage de la structure de la fonction BD_IdleGame. fn_diagramobjects
DELIMITER //

	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	//
DELIMITER ;

-- Listage de la structure de la table BD_IdleGame. Loots
CREATE TABLE IF NOT EXISTS "Loots" (
	"LootID" INT(10,0) NOT NULL,
	"LootName" NVARCHAR(50) NULL DEFAULT NULL,
	"LootValue" INT(10,0) NULL DEFAULT NULL,
	PRIMARY KEY ("LootID")
);

-- Listage des données de la table BD_IdleGame.Loots : -1 rows
/*!40000 ALTER TABLE "Loots" DISABLE KEYS */;
-- Listage de la structure de la table BD_IdleGame. Monsters
CREATE TABLE IF NOT EXISTS "Monsters" (
	"MonsterID" INT(10,0) NOT NULL,
	"MonsterName" NVARCHAR(50) NULL DEFAULT NULL,
	"MonsterLevel" INT(10,0) NOT NULL,
	"MonsterHP" INT(10,0) NOT NULL,
	"MonsterDmg" INT(10,0) NOT NULL,
	PRIMARY KEY ("MonsterID")
);

-- Listage des données de la table BD_IdleGame.Monsters : -1 rows
/*!40000 ALTER TABLE "Monsters" DISABLE KEYS */;
-- Listage de la structure de la table BD_IdleGame. QuestJournal
CREATE TABLE IF NOT EXISTS "QuestJournal" (
	"QuestJournalID" INT(10,0) NOT NULL,
	"QuestJournalCharacterID" INT(10,0) NOT NULL,
	"QuestJournalDungeonID" INT(10,0) NOT NULL,
	"QuestJournalCompletion" BIT NOT NULL,
	PRIMARY KEY ("QuestJournalID")
);

-- Listage des données de la table BD_IdleGame.QuestJournal : -1 rows
/*!40000 ALTER TABLE "QuestJournal" DISABLE KEYS */;
/*!40000 ALTER TABLE "QuestJournal" ENABLE KEYS */;

-- Listage de la structure de la table BD_IdleGame. Races
CREATE TABLE IF NOT EXISTS "Races" (
	"RaceID" INT(10,0) NOT NULL,
	"RaceName" NVARCHAR(50) NOT NULL,
	PRIMARY KEY ("RaceID")
);

-- Listage des données de la table BD_IdleGame.Races : -1 rows
/*!40000 ALTER TABLE "Races" DISABLE KEYS */;
-- Listage de la structure de la procédure BD_IdleGame. spGo
DELIMITER //
Create PROCEDURE spGo(@charID integer)

AS
BEGIN
	Declare @state int 
	Set @state = 0

	Declare @text nvarchar(250)
	
	IF @state = 0
		Begin
			Declare @income int
			Declare @gold int
			Declare @nameLoot nvarchar(50)
			Declare @count int
			Declare @limit int

			Set @count = 0
			Set @gold = 0
			Select @limit = dbo.fnGetCountLoot(@charID)


			Select @income = dbo.fnIncomeSellAllLoot(@charID)

			Set @gold = @gold + @income

			Set @text = 'Selling all loot for ' + @income + ' gold.'
		End
	ELSE IF @state = 1
		Begin
			SELECT 'Checking to buy better equipement...'
		End
	ELSE IF @state = 2
		Begin
			DECLARE @nameDungeon nvarchar(50)
			SET @nameDungeon = ''
			SELECT 'A strange old man give you the quest :' + @nameDungeon
		End
	ELSE IF @state = 3
		Begin
			SELECT 'Go to the dungeon...'
		End
	ELSE IF @state = 4
		Begin
			DECLARE @monsterName nvarchar(50) 
			SET @monsterName = ''
			SELECT 'You encounter a ' + @monsterName + '!'
		End
	ELSE IF @state = 5
		Begin
			DECLARE @damage int 
			SET @monsterName = ''
			SELECT @monsterName + 'attak and deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 6
		Begin
			SET @monsterName = ''
			SELECT 'Your attak deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 7
		Begin
			DECLARE @qty int 
			SET @qty = 0
			DECLARE @lootName nvarchar(50)  
			SET @lootName = ''
			SELECT 'You slain the monster and get ' + @qty + @lootName
		End
	ELSE IF @state = 8
		Begin
			SELECT 'Return to the village...'
		End
	ELSE
		SELECT 'Your dead!'

    Return @text
END//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_alterdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_creatediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_dropdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_helpdiagramdefinition
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_helpdiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_renamediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	//
DELIMITER ;

-- Listage de la structure de la procédure BD_IdleGame. sp_upgraddiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	//
DELIMITER ;

-- Listage de la structure de la table BD_IdleGame. sysdiagrams
CREATE TABLE IF NOT EXISTS "sysdiagrams" (
	"name" NVARCHAR(128) NOT NULL,
	"principal_id" INT(10,0) NOT NULL,
	"diagram_id" INT(10,0) NOT NULL,
	"version" INT(10,0) NULL DEFAULT NULL,
	"definition" VARBINARY(max) NULL DEFAULT NULL,
	PRIMARY KEY ("diagram_id"),
	UNIQUE KEY ("principal_id","name")
);

-- Listage des données de la table BD_IdleGame.sysdiagrams : -1 rows
/*!40000 ALTER TABLE "sysdiagrams" DISABLE KEYS */;
-- Listage de la structure de la vue BD_IdleGame. viewAllCharacters
-- Création d'une table temporaire pour palier aux erreurs de dépendances de VIEW
CREATE TABLE "viewAllCharacters" (
	"CharID" INT NOT NULL,
	"CharRaceID" INT NOT NULL,
	"CharClassID" INT NOT NULL,
	"CharStatus" INT NOT NULL,
	"CharName" NVARCHAR(50) NULL COLLATE 'French_CI_AS',
	"CharLevel" INT NOT NULL,
	"CharExp" INT NOT NULL,
	"CharGP" INT NOT NULL,
	"CharQuestProgression" INT NOT NULL,
	"CharHP" INT NOT NULL,
	"CharMaxHP" INT NOT NULL,
	"CharHPRegen" INT NOT NULL,
	"CharMP" INT NOT NULL,
	"CharMaxMP" INT NOT NULL,
	"CharMPRegen" INT NOT NULL,
	"CharStr" INT NOT NULL,
	"CharCon" INT NOT NULL,
	"CharDex" INT NOT NULL,
	"CharInt" INT NOT NULL,
	"CharWis" INT NOT NULL,
	"CharLck" INT NOT NULL,
	"CharHeadID" INT NULL,
	"CharTorsoID" INT NULL,
	"CharLegsID" INT NULL,
	"CharBootsID" INT NULL,
	"CharGlovesID" INT NULL,
	"CharWeap1ID" INT NULL,
	"CharWeap2ID" INT NULL,
	"CharNeckLaceID" INT NULL,
	"CharRing1ID" INT NULL,
	"CharRing2ID" INT NULL
) ENGINE=MyISAM;

-- Listage de la structure de la vue BD_IdleGame. viewAllCharacters
-- Suppression de la table temporaire et création finale de la structure d'une vue
DROP TABLE IF EXISTS "viewAllCharacters";
CREATE VIEW fnViewAllCharacters 
AS 
SELECT * FROM Characters;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
