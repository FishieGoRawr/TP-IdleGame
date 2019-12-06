--CREATING DATA BASE
CREATE DATABASE BD_IdleGame
 CONTAINMENT = NONE
 ON PRIMARY
 (NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
 (NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 GO

 USE BD_IdleGame
 --DONE CREATING DB

--CREATING TABLES
 CREATE TABLE Characters --This table creates characters with stats, equipment, level, etc...
(
   CharID int IDENTITY(1,1), 
   CharRaceID int NOT NULL,
   CharClassID int NOT NULL,
   CharStatus nvarchar(50) NOT NULL,
   CharName nvarchar(50) NOT NULL,
   CharLevel int NOT NULL,
   CharExp int NOT NULL,
   CharGP int NOT NULL,
   CharQuestProgression int NOT NULL,
   CharCurrentHP int NOT NULL,
   CharMaxHP int NOT NULL,
   CharHPRegen int NOT NULL,
   CharStr int NOT NULL,
   CharCon int NOT NULL,
   CharDex int NOT NULL,
   CharInt int NOT NULL,
   CharWis int NOT NULL,
   CharLck int NOT NULL,
   CharHeadID int,
   CharTorsoID int,
   CharLegsID int,
   CharBootsID int,
   CharGlovesID int,
   CharWeapID int,
   CharNeckLaceID int,
   CharRingID int,
   CharCurrHP INT,
   CharMaxLoot INT
)
GO

CREATE TABLE Events --This table keep all possible events
(
	EventID int IDENTITY(1,1),
	EventName nvarchar(50) NOT NULL,
	EventValue int NOT NULL
)
GO

 CREATE TABLE Races --This table set the character's race
(
   RaceID int IDENTITY(1,1),
   RaceName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Classes --This table set the character's class
(
   ClassID int IDENTITY(1,1),
   ClassName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Monsters --This table keeps all possible monsters
(
   MonsterID int IDENTITY(1,1),
   MonsterName NVARCHAR(50),
   MonsterLevel int NOT NULL,
   MonsterHP int NOT NULL,
   MonsterDmg int NOT NULL,
   MonsterExp int NOT NULL
)
GO

CREATE TABLE Encounters --Possible monsters to meet during dungeon
(
EncounterID int IDENTITY(1,1),
EncounterDungeonID int,
EncounterMonsterID int
)
GO

CREATE TABLE Fights --Currently fighting monster in this table
(
FightID int IDENTITY(1,1),
FightCharacterID int,
FightMonsterID int,
MonsterCurrentHP int
)
GO

 CREATE TABLE QuestJournal --This table keep track of which quest is done
(
   QuestJournalID int IDENTITY(1,1),
   QuestJournalCharacterID int NOT NULL,
   QuestJournalDungeonID int NOT NULL,
   QuestJournalCompletion bit NOT NULL,
   KillQty INT
)
GO

 CREATE TABLE Dungeons --This table keeps track of dungeon and which "MonsterBundle" is associated with it
(
   DungeonID int IDENTITY(1,1),
   DungeonLevel int NOT NULL,
   KillQty int NOT NULL,
   DungeonName NVARCHAR(50) NOT NULL,
   DungeonReward int NOT NULL
)
GO

CREATE TABLE Loots --This table has all possible loot
(
   LootID int IDENTITY(1,1),
   LootName nvarchar(50),
   LootValue int
)
GO

CREATE TABLE CharLoot --This table has the character loot inventory
(
   CharLootID int IDENTITY(1,1),
   CharLootCharacterID int,
   CharLootLootID int,
   CharLootQty int
)
GO

CREATE TABLE EquipType --This table keeps the possible equipment type
(
   EquipTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Equipements --This table keeps all possible equipment
(
   EquipID int IDENTITY(1,1),
   EquipEquipTypeID int,
   EquipName nvarchar(50),
   EquipValue int NOT NULL,
   EquipLevel int NOT NULL,
   EquipFlatAtk int NOT NULL,
   EquipFlatDef int NOT NULL
)
GO
--DONE CREATING TABLES

--ADDING PRIMARY KEYS
ALTER TABLE Loots ADD PRIMARY KEY (LootID)
GO
ALTER TABLE Events ADD PRIMARY KEY (EventID)
GO
ALTER TABLE CharLoot ADD PRIMARY KEY (CharLootID)
GO
ALTER TABLE Characters ADD PRIMARY KEY (CharID)
GO
ALTER TABLE EquipType ADD PRIMARY KEY (EquipTypeID)
GO
ALTER TABLE Equipements ADD PRIMARY KEY (EquipID)
GO
ALTER TABLE QuestJournal ADD PRIMARY KEY (QuestJournalID)
GO
ALTER TABLE Dungeons ADD PRIMARY KEY (DungeonID)
GO
ALTER TABLE Races ADD PRIMARY KEY (RaceID)
GO
ALTER TABLE Classes ADD PRIMARY KEY (ClassID)
GO
ALTER TABLE Monsters ADD PRIMARY KEY (MonsterID)
GO
--DONE ADDING PRIMARY KEYS

--ADDING FOREIN KEYS CONSTRAINT
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Characters FOREIGN KEY (CharLootCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Loot FOREIGN KEY (CharLootLootID) REFERENCES Loots(LootID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Characters FOREIGN KEY (QuestJournalCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Dungeons FOREIGN KEY (QuestJournalDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Encounters ADD CONSTRAINT FK_Encounter_Dungeons FOREIGN KEY (EncounterDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Encounters ADD CONSTRAINT FK_Encounter_Monsters FOREIGN KEY (EncounterMonsterID) REFERENCES Monsters(MonsterID)
GO
ALTER TABLE Fights ADD CONSTRAINT FK_Fight_Characters FOREIGN KEY (FightCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE Fights ADD CONSTRAINT FK_Fight_Monsters FOREIGN KEY (FightMonsterID) REFERENCES Monsters(MonsterID)
GO
ALTER TABLE Equipements ADD CONSTRAINT FK_Equip_EquipType FOREIGN KEY (EquipEquipTypeID) REFERENCES EquipType(EquipTypeID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Race FOREIGN KEY (CharRaceID) REFERENCES Races(RaceID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Class FOREIGN KEY (CharClassID) REFERENCES Classes(ClassID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersHead_Equip FOREIGN KEY (CharHeadID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersTorso_Equip FOREIGN KEY (CharTorsoID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersLegs_Equip FOREIGN KEY (CharLegsID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersBoots_Equip FOREIGN KEY (CharBootsID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersGloves_Equip FOREIGN KEY (CharGlovesID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersWeap_Equip FOREIGN KEY (CharWeapID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersNeck_Equip FOREIGN KEY (CharNeckLaceID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersRing_Equip FOREIGN KEY (CharRingID) REFERENCES Equipements(EquipID)
GO

--DONE ADDING FOREIGN KEY CONSTRAINT

--ADDING DATA TO TABLES
INSERT INTO Events VALUES ('Thief Goblin', 10)
INSERT INTO Events VALUES ('Leprechaun', 10)
INSERT INTO Events VALUES ('Trap', 25)
INSERT INTO Events VALUES ('Treasure', 15)
GO

INSERT INTO Races VALUES ('Human')
INSERT INTO Races VALUES ('Dwarf')
INSERT INTO Races VALUES ('Orc')
INSERT INTO Races VALUES ('Elf')
INSERT INTO Races VALUES ('Half-elf')
INSERT INTO Races VALUES ('Dragonborn')
GO

INSERT INTO Classes VALUES ('Warrior')
INSERT INTO Classes VALUES ('Paladin')
INSERT INTO Classes VALUES ('Archer')
INSERT INTO Classes VALUES ('Thief')
INSERT INTO Classes VALUES ('Priest')
INSERT INTO Classes VALUES ('Mage')
GO

INSERT INTO Loots VALUES ('Goblin''s testicles', 15)
INSERT INTO Loots VALUES ('Feather', 1)
INSERT INTO Loots VALUES ('Bones', 5)
INSERT INTO Loots VALUES ('Minautor''s Hoof', 15)
INSERT INTO Loots VALUES ('Basilik head', 25)
INSERT INTO Loots VALUES ('Hydra''s heart', 50)
INSERT INTO Loots VALUES ('Rat teeth', 5)
INSERT INTO Loots VALUES ('Dragon scales', 150)
INSERT INTO Loots VALUES ('Merfolk''s soul', 100)
INSERT INTO Loots VALUES ('Rotten flesh', 10)
GO

--Monsters: Name, Level, HP, Damage
INSERT INTO Monsters VALUES ('Chicken', 1, 5, 10, 6)
INSERT INTO Monsters VALUES ('Rat', 2, 10, 15, 12)
INSERT INTO Monsters VALUES ('Giant Rat', 3, 20, 20, 18)
INSERT INTO Monsters VALUES ('Goblin', 4, 30, 30, 24)
INSERT INTO Monsters VALUES ('Undead', 5, 35, 50, 30)
INSERT INTO Monsters VALUES ('Minautor', 6, 35, 75, 36)
INSERT INTO Monsters VALUES ('Lost Merfolk', 7, 50, 100, 42)
INSERT INTO Monsters VALUES ('Basilik', 8, 80, 125, 48)
INSERT INTO Monsters VALUES ('Hydra', 9, 200, 150, 54)
INSERT INTO Monsters VALUES ('Dragon', 10, 350, 200, 60)
GO

INSERT INTO EquipType VALUES ('Head')
INSERT INTO EquipType VALUES ('Torso')
INSERT INTO EquipType VALUES ('Legs')
INSERT INTO EquipType VALUES ('Boots')
INSERT INTO EquipType VALUES ('Gloves')
INSERT INTO EquipType VALUES ('Ring')
INSERT INTO EquipType VALUES ('Necklace')
INSERT INTO EquipType VALUES ('WeaponSword')
INSERT INTO EquipType VALUES ('WeaponBow')
INSERT INTO EquipType VALUES ('WeaponStaff')
GO

INSERT Dungeons VALUES (1, 25, N'Plain', 5)
INSERT Dungeons VALUES (3, 25, N'Cave', 10)
INSERT Dungeons VALUES (5, 25, N'Old Mine', 15)
INSERT Dungeons VALUES (7, 25, N'Graveyard', 20)
INSERT Dungeons VALUES (10, 25, N'Dark Fortress', 5)
INSERT Dungeons VALUES (2, 25, N'Large Plain', 10)
INSERT Dungeons VALUES (4, 25, N'Cave', 15)
INSERT Dungeons VALUES (6, 25, N'Foundry', 20)
INSERT Dungeons VALUES (8, 25, N'Undead Pit', 5)
INSERT Dungeons VALUES (9, 25, N'Volcanic Cave', 10)
INSERT Dungeons VALUES (11, 25, N'Forest', 5)
INSERT Dungeons VALUES (12, 25, N'Cave', 10)
INSERT Dungeons VALUES (13, 25, N'Swamp', 15)
INSERT Dungeons VALUES (14, 25, N'Sand Fortress', 20)
INSERT Dungeons VALUES (15, 25, N'Magic Cavern', 25)
GO

INSERT Encounters VALUES (1, 1)
INSERT Encounters VALUES (1, 2)
INSERT Encounters VALUES (1, 3)
INSERT Encounters VALUES (2, 5)
INSERT Encounters VALUES (2, 2)
INSERT Encounters VALUES (2, 3)
INSERT Encounters VALUES (2, 4)
INSERT Encounters VALUES (2, 5)
INSERT Encounters VALUES (2, 6)
INSERT Encounters VALUES (3, 2)
INSERT Encounters VALUES (3, 3)
INSERT Encounters VALUES (3, 4)
INSERT Encounters VALUES (3, 5)
INSERT Encounters VALUES (3, 6)
INSERT Encounters VALUES (4, 4)
INSERT Encounters VALUES (4, 5)
INSERT Encounters VALUES (4, 6)
INSERT Encounters VALUES (4, 7)
INSERT Encounters VALUES (5, 6)
INSERT Encounters VALUES (5, 8)
INSERT Encounters VALUES (5, 9)
INSERT Encounters VALUES (5, 10)
INSERT Encounters VALUES (8, 1)
INSERT Encounters VALUES (9, 2)
INSERT Encounters VALUES (10, 3)
INSERT Encounters VALUES (11, 5)
INSERT Encounters VALUES (12, 9)
INSERT Encounters VALUES (13, 2)
INSERT Encounters VALUES (14, 4)
INSERT Encounters VALUES (15, 4)
INSERT Encounters VALUES (6, 2)
INSERT Encounters VALUES (7, 2)
GO

INSERT Equipements VALUES (1, N'Leather Headcover', 25, 1, 0, 5)
INSERT Equipements VALUES (1, N'Wooden Cap', 25, 1, 0, 6)
INSERT Equipements VALUES (1, N'Infernal Bandana', 30, 2, 0, 8)
INSERT Equipements VALUES (1, N'Cloth Hood', 30, 2, 0, 9)
INSERT Equipements VALUES (1, N'Iron Facemask', 55, 5, 0, 12)
INSERT Equipements VALUES (1, N'Iron Medhelm', 55, 5, 0, 13)
INSERT Equipements VALUES (1, N'Padded Helm', 55, 6, 0, 15)
INSERT Equipements VALUES (1, N'Fighter Mask', 70, 7, 0, 17)
INSERT Equipements VALUES (1, N'Goblin''s Face', 70, 7, 0, 19)
INSERT Equipements VALUES (2, N'Iron Chestplate', 25, 1, 0, 5)
INSERT Equipements VALUES (2, N'Silk Chestpiece', 25, 1, 0, 6)
INSERT Equipements VALUES (2, N'Iron Vest', 30, 2, 0, 8)
INSERT Equipements VALUES (2, N'Warden''s armor', 30, 2, 0, 9)
INSERT Equipements VALUES (2, N'Mail Vest', 35, 3, 0, 13)
INSERT Equipements VALUES (2, N'Iron Battleplate', 35, 3, 0, 12)
INSERT Equipements VALUES (2, N'Broken Chestplate', 40, 4, 0, 16)
INSERT Equipements VALUES (2, N'Runic Chestguard', 55, 5, 0, 19)
INSERT Equipements VALUES (3, N'Ugly Skirt', 20, 1, 0, 5)
INSERT Equipements VALUES (3, N'Mail Leggings', 20, 1, 0, 6)
INSERT Equipements VALUES (3, N'Iron Platelegs', 30, 2, 0, 8)
INSERT Equipements VALUES (3, N'Iron Skirt', 30, 2, 0, 9)
INSERT Equipements VALUES (3, N'Serpent''s Legguards', 45, 3, 0, 12)
INSERT Equipements VALUES (3, N'Mage''s Robe', 55, 5, 0, 14)
INSERT Equipements VALUES (3, N'Light Legwraps', 55, 5, 0, 15)
INSERT Equipements VALUES (3, N'Cloth Kilt', 45, 6, 0, 18)
INSERT Equipements VALUES (3, N'Iron Greaves', 45, 7, 0, 22)
INSERT Equipements VALUES (3, N'Hell Legplates', 45, 8, 0, 50)
INSERT Equipements VALUES (4, N'Boots', 25, 1, 0, 5)
INSERT Equipements VALUES (4, N'Pelt Shoes', 25, 1, 0, 6)
INSERT Equipements VALUES (4, N'High Boots', 30, 2, 0, 8)
INSERT Equipements VALUES (4, N'Great Boots', 30, 2, 0, 9)
INSERT Equipements VALUES (4, N'Elf Boots', 60, 3, 0, 12)
INSERT Equipements VALUES (4, N'Armored Boots', 60, 3, 0, 13)
INSERT Equipements VALUES (4, N'Magic Boots', 55, 5, 0, 15)
INSERT Equipements VALUES (4, N'Demon Boots', 55, 5, 0, 16)
INSERT Equipements VALUES (4, N'Sabaton', 60, 7, 0, 20)
INSERT Equipements VALUES (4, N'Iron Boots', 60, 8, 0, 25)
INSERT Equipements VALUES (5, N'Iron Warfists', 25, 1, 0, 5)
INSERT Equipements VALUES (5, N'Cloth Grips', 30, 2, 0, 6)
INSERT Equipements VALUES (5, N'Gloves', 70, 3, 0, 8)
INSERT Equipements VALUES (5, N'Armored Gloves', 40, 4, 0, 15)
INSERT Equipements VALUES (6, N'Minor Protection Ring', 25, 1, 0, 5)
INSERT Equipements VALUES (6, N'Protection Ring', 30, 2, 0, 8)
INSERT Equipements VALUES (6, N'Great Protection Ring', 10, 3, 0, 11)
INSERT Equipements VALUES (6, N'Major Protection Ring', 40, 4, 0, 15)
INSERT Equipements VALUES (7, N'Major Protection Necklace', 25, 1, 0, 5)
INSERT Equipements VALUES (7, N'Great Protection Necklace', 30, 2, 0, 8)
INSERT Equipements VALUES (7, N'Protection Necklace', 10, 3, 0, 11)
INSERT Equipements VALUES (7, N'Minor Protection Necklace', 40, 4, 0, 15)
INSERT Equipements VALUES (8, N'Club', 25, 1, 3, 0)
INSERT Equipements VALUES (8, N'Dagger', 30, 2, 5, 0)
INSERT Equipements VALUES (8, N'Sword', 10, 3, 8, 0)
INSERT Equipements VALUES (8, N'Claymore', 40, 4, 12, 0)
INSERT Equipements VALUES (9, N'Bow', 25, 1, 3, 0)
INSERT Equipements VALUES (9, N'Great Bow', 30, 2, 5, 0)
INSERT Equipements VALUES (9, N'Elf Bow', 10, 3, 8, 0)
INSERT Equipements VALUES (9, N'Long Bow', 40, 4, 12, 0)
INSERT Equipements VALUES (10, N'Weak Stick', 25, 1, 3, 0)
INSERT Equipements VALUES (10, N'Wooden Staff', 30, 2, 5, 0)
INSERT Equipements VALUES (10, N'Frost Staff', 10, 3, 8, 0)
INSERT Equipements VALUES (10, N'Fire Staff', 40, 4, 12, 0)
GO

INSERT INTO Characters VALUES (1, 1, 'getQuest', 'Alex', 1, 0, 5, 0, 100, 100, 10, 15, 10, 10, 10, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 20)
INSERT INTO Characters VALUES (1, 4, 'getQuest', 'Rachel', 5, 0, 25, 0, 100, 100, 25, 30, 30, 30, 30, 30, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 20)
GO

----DONE ADDING DATA TO TABLES----
----------------------------------
----------------------------------
------ADDING PROGRAMMABILITY------

USE BD_IdleGameTEST
GO

/****** Object:  UserDefinedFunction [dbo].[fnCanBuyEquip]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCanBuyEquip]
(@CharID INT, @EquipID INT)
RETURNS BIT AS
BEGIN
	DECLARE @CharGold INT SELECT @CharGold = dbo.fnGetGPCharacter(@CharID)
	DECLARE @EquipCost INT SET @EquipCost = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquipID)
	DECLARE @canBuy INT

	IF @CharGold >= @EquipCost
		SET @canBuy = 1
	ELSE SET @canBuy = 0	

	RETURN @canBuy
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckBetterEquip]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fnCheckBetterEquip](@equipTypeID int, @charID int, @newEquipId int)
RETURNS bit
AS
BEGIN
	Declare @canEquip bit
	Declare @currentEquipID int

	Declare @atk int Select @atk = (Select EquipFlatAtk From Equipements Where EquipID = @newEquipId)
	Declare @def int Select @def = (Select EquipFlatDef From Equipements Where EquipID = @newEquipId)
	Declare @currentAtk int
	Declare @currentDef int

	If @equipTypeID = 1
		Begin
			Select @currentEquipID = (Select CharHeadID From Characters Where CharID = @charID)
			Select @currentAtk = (Select EquipFlatAtk From Equipements Where EquipID = @currentEquipID)
			Select @currentDef = (Select EquipFlatDef From Equipements Where EquipID = @currentEquipID)

			If (Select CharHeadID From Characters Where CharID = @charID) IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 2
		Begin
			Select @currentEquipID = (Select CharTorsoID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 3
		Begin
			Select @currentEquipID = (Select CharLegsID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 4
		Begin
			Select @currentEquipID = (Select CharBootsID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 5
		Begin
			Select @currentEquipID = (Select CharGlovesID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 6
		Begin
			Select @currentEquipID = (Select CharRingID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 7
		Begin
			Select @currentEquipID = (Select CharNeckLaceID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	Else If @equipTypeID = 8 Or @equipTypeID = 9 Or @equipTypeID = 10
		Begin
			Select @currentEquipID = (Select CharWeapID From Characters Where CharID = @charID)

			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End
	
	RETURN @canEquip
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCheckIfHasLoot]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCheckIfHasLoot](@CharID int)
RETURNS bit
AS
BEGIN
	DECLARE @count int
	DECLARE @hasLoot bit
	SET @count = (SELECT COUNT(CharLootID) FROM CharLoot WHERE CharLootCharacterID = @CharID)

	IF @count > 0
		Set @hasLoot = 1
	ELSE Set @hasLoot = 0

	RETURN @hasLoot
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEquipName]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnGetEquipName]
(
@equipID int
)
RETURNS nvarchar(50)
AS
BEGIN
	RETURN (SELECT EquipName FROM Equipements WHERE EquipID = @equipID)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEquipType]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[fnGetEquipType](@equipId int)
Returns Integer
As
Begin
	Declare @idEquipType int
	Set @idEquipType = (Select EquipEquipTypeID From Equipements Where EquipID = @equipId)
	Return @idEquipType
End
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetGPCharacter]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetGPCharacter] (@CharID int)
RETURNS int
AS
BEGIN
	DECLARE @gold int
	SELECT @gold = Characters.CharGP FROM Characters WHERE CharID = @CharID
	RETURN @gold
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetLevelCharacter]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetLevelCharacter] (@CharID int)
RETURNS int
AS
BEGIN
	RETURN (SELECT CharLevel FROM Characters WHERE CharID = @CharID)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetStatusCharacter]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetStatusCharacter] (@CharID int)
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @status nvarchar(25)
	SELECT @status = CharStatus FROM Characters WHERE CharID = @CharID
	RETURN @status
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnIncomeSellAllLoot]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[fnIncomeSellAllLoot](@playerId int)
Returns Integer
As
Begin
	Declare @income int
	Set @income = (Select Sum(LootValue) From Loots Inner Join CharLoot ON LootID = CharLootLootId Where CharLootCharacterID = @playerId)
	Return @income
End
GO

/****** Object:  UserDefinedFunction [dbo].[fnGetCharacterGold]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCharacterGold] (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT CharGP as GP FROM Characters WHERE CharID = @CharID
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCharacterHP]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCharacterHP] (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT CharCurrHP as HP FROM Characters WHERE CharID = @CharID
GO

/****** Object:  UserDefinedFunction [dbo].[fnGetCompletedDungeons]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCompletedDungeons] (@CharID INT)
RETURNS TABLE
AS
RETURN (SELECT DungeonName, COUNT(DungeonName) AS nb
FROM (QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID)
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 1
GROUP BY DungeonName)
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetActiveDungeonName]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetActiveDungeonName] (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT DungeonName 
FROM QuestJournal INNER JOIN Dungeons ON QuestJournalDungeonID = DungeonID 
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetDungeonKC]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetDungeonKC] (@CharID INT)
RETURNS TABLE
AS
RETURN SELECT KillQty 
FROM QuestJournal
WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
GO

/****** Object:  UserDefinedFunction [dbo].[fnGetCharacterEquiped]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCharacterEquiped]
(	
@CharID INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharHeadID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharTorsoID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharLegsID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharBootsID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters  LEFT JOIN Equipements ON CharGlovesID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharWeapID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharRingID = EquipID WHERE CharID = @CharID
	UNION ALL
	SELECT EquipName FROM Characters LEFT JOIN Equipements ON CharNeckLaceID = EquipID WHERE CharID = @CharID
)
GO
/****** Object:  View [dbo].[viewAllCharacters]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewAllCharacters] 
AS 
SELECT * FROM Characters
GO


/****** Object:  UserDefinedFunction [dbo].[fnGetCharacterLoot]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCharacterLoot] (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT LootName AS Name, LootValue AS Value, CharLootQty AS Qty FROM CharLoot INNER JOIN Loots ON CharLootLootID = LootID
	WHERE CharLoot.CharLootCharacterID = @CharID
GO

/****** Object:  UserDefinedFunction [dbo].[fnGetCharacterInfos]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCharacterInfos] (@CharID INTEGER)
RETURNS TABLE
AS
	RETURN SELECT CharCurrHP as CurrHP, CharStr AS Str, CharCon AS Con, CharDex AS Dex, CharInt AS Intel, CharWis AS Wis, CharLck AS Luck, CharName AS Name, ClassName AS Class, RaceName AS Race, CharGP AS GP, CharLevel AS Level, CharExp AS Exp
	FROM (Characters INNER JOIN Races ON CharRaceID = RaceID) INNER JOIN Classes ON CharClassID = ClassID
	WHERE CharID = @CharID
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetNameOneLoot]    Script Date: 2019-12-05 09:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[fnGetNameOneLoot](@playerId int, @lootId int)
Returns Table
As
Return Select LootName 
From Loots Inner Join CharLoot ON LootID = CharLootLootId 
Where CharLootLootID = @lootId AND CharLootCharacterID = @playerId
GO

/****** Object:  StoredProcedure [dbo].[spAddCharacterLoot]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddCharacterLoot]
@CharID INT, 
@lootID INT,
@qty INT
AS
INSERT INTO CharLoot VALUES (@CharID, @lootID, @qty)
GO
/****** Object:  StoredProcedure [dbo].[spCharacterHasEquip]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCharacterHasEquip]
@CharID INT
AS
BEGIN
	DECLARE @HasEquip BIT SET @HasEquip = 0

	IF (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharRingID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	ELSE IF (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) IS NOT NULL
		SET @HasEquip = 1

	RETURN @HasEquip
END
GO
/****** Object:  StoredProcedure [dbo].[spCharLuckRoll]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCharLuckRoll]
@CharID INT
AS
BEGIN
	DECLARE @CharLuck INT SET @CharLuck = (SELECT CharLck FROM Characters WHERE CharID = @CharID)
	DECLARE @lowerBase INT SET @lowerBase = (@CharLuck * 1.55)
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END
GO
/****** Object:  StoredProcedure [dbo].[spCharWisdomRoll]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCharWisdomRoll]
@CharID INT
AS
BEGIN
	DECLARE @CharWisdom INT SET @CharWisdom = (SELECT CharWis FROM Characters WHERE CharID = @CharID)
	DECLARE @lowerBase INT SET @lowerBase = (@CharWisdom * 1.15)
	DECLARE @Roll INT SET @Roll = RAND()*(@lowerBase + 100) - @lowerBase
	DECLARE @HasSuccess BIT

	IF @Roll < @lowerBase
		SET @HasSuccess = 1
	ELSE
		SET @HasSuccess = 0

	RETURN @HasSuccess
END
GO
/****** Object:  StoredProcedure [dbo].[spCompleteDungeon]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCompleteDungeon]
@CharID INT
AS
BEGIN
	DELETE FROM Fights WHERE FightCharacterID = @CharID
	UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID	
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAllCharacterLoot]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteAllCharacterLoot]
@id INTEGER
AS
DELETE FROM CharLoot
WHERE CharLootCharacterID= @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteRandomEquip]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteRandomEquip]
@CharID INT,
@DeletedEquipName NVARCHAR(50) OUTPUT
AS
BEGIN
	DECLARE @HasStolen BIT SET @HasStolen = 0
	DECLARE @HasEquip BIT EXEC @HasEquip = dbo.spCharacterHasEquip 1
	DECLARE @StolenEquipID INT
	
	IF (@HasEquip = 1)
		BEGIN
			WHILE @HasStolen = 0
			BEGIN
				SET @StolenEquipID = RAND()*(1-9) + 9

				IF (@StolenEquipID = 1 AND (SELECT CharHeadID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharID = @CharID)
						UPDATE Characters SET CharHeadID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 2 AND (SELECT CharTorsoID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharID = @CharID)
						UPDATE Characters SET CharTorsoID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 3 AND (SELECT CharLegsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharID = @CharID)
						UPDATE Characters SET CharLegsID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 4 AND (SELECT CharBootsID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharID = @CharID)
						UPDATE Characters SET CharBootsID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 5 AND (SELECT CharGlovesID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharID = @CharID)
						UPDATE Characters SET CharGlovesID = NULL WHERE CharID = @CharID
						END

				ELSE IF (@StolenEquipID = 6 AND (SELECT CharRingID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharRingID WHERE CharID = @CharID)
						UPDATE Characters SET CharRingID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 7 AND (SELECT CharNeckLaceID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN					
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharNeckLaceID WHERE CharID = @CharID)
						UPDATE Characters SET CharNeckLaceID = NULL WHERE CharID = @CharID
					END

				ELSE IF (@StolenEquipID = 8 AND (SELECT CharWeapID FROM Characters WHERE CharID = 1) IS NOT NULL)
					BEGIN
						SET @HasStolen = 1
						SET @DeletedEquipName = (SELECT EquipName FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)
						UPDATE Characters SET CharWeapID = NULL WHERE CharID = @CharID
					END
			END
	END
	ELSE
		BEGIN
			SET @DeletedEquipName = 'none'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spEquipNew]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEquipNew]
@CharID INT, @EquipID INT AS
BEGIN
	DECLARE @EquipType INT SET @EquipType = (SELECT EquipEquipTypeID FROM Equipements WHERE EquipID = @EquipID)
	
	IF @EquipType = 1
		BEGIN
			UPDATE Characters SET CharHeadID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 2
		BEGIN
			UPDATE Characters SET CharTorsoID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 3
		BEGIN
			UPDATE Characters SET CharLegsID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 4
		BEGIN
			UPDATE Characters SET CharBootsID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 5
		BEGIN
			UPDATE Characters SET CharGlovesID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 6
		BEGIN
			UPDATE Characters SET CharRingID = @EquipID	WHERE CharID = @CharID
		END
	ELSE IF @EquipType = 7
		BEGIN
			UPDATE Characters SET CharNeckLaceID = @EquipID	WHERE CharID = @CharID
		END
	ELSE
		BEGIN
			UPDATE Characters SET CharWeapID = @EquipID WHERE CharID = @CharID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateFight]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateFight]
@CharID INT,
@MonsterID INT,
@MonsterCurrentHP INT
AS
BEGIN
	INSERT INTO Fights VALUES (@CharID, @MonsterID, @MonsterCurrentHP)
END
GO
/****** Object:  StoredProcedure [dbo].[spGenerateMonsterHit]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGenerateMonsterHit]
@CharID INT,
@MonsterID INT
AS
BEGIN
	DECLARE @MonsterAtk INT SET @MonsterAtk = (SELECT TOP 1 MonsterDmg FROM Monsters WHERE MonsterID = @MonsterID)
	DECLARE @PlayerDefense INT EXEC @PlayerDefense = dbo.spGetPlayerDefense @CharID
	
	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @MonsterAtk as INT) + 0
	--DECLARE @Hit INT SET @Hit = RAND()*(0-@MonsterAtk) + @MonsterAtk
	
	RETURN CONVERT (INT, @Hit - (@PlayerDefense / 2.5))
END
GO
/****** Object:  StoredProcedure [dbo].[spGeneratePlayerHit]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGeneratePlayerHit]
@CharID INT
AS
BEGIN
	DECLARE @PlayerMaxHit INT EXEC @PlayerMaxHit = dbo.spGetCharacterAttack @CharID

	DECLARE @Hit INT SET @Hit = CAST(RAND(CHECKSUM(NEWID())) * @PlayerMaxHit as INT) + 0
	
	RETURN CONVERT (INT, @Hit / 2.5)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCharacterAttack]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCharacterAttack]
@CharID INT
AS
BEGIN
	DECLARE @BaseStr INT SET @BaseStr = (SELECT CharStr FROM Characters WHERE CharID = @CharID)
	DECLARE @WepAtk INT SET @WepAtk = (SELECT EquipFlatAtk FROM Equipements INNER JOIN Characters ON EquipID = CharWeapID WHERE CharID = @CharID)

	IF (@WepAtk IS NULL)
		SET @WepAtk = 0

	RETURN (@BaseStr + @WepAtk)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrentWeight]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCurrentWeight]
@charID INT
AS
BEGIN
	RETURN SELECT SUM(CharLootQty) FROM CharLoot WHERE CharLootCharacterID = @charID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetDiscountedValueEquip]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDiscountedValueEquip]
@EquidID INT
AS
BEGIN
	DECLARE @EquipValue INT SET @EquipValue = (SELECT EquipValue FROM Equipements WHERE EquipID = @EquidID)
	DECLARE @deductedValue INT SET @deductedValue = @EquipValue * 0.75

	RETURN @deductedValue
END

GO
/****** Object:  StoredProcedure [dbo].[spGetDungeonCompletion]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDungeonCompletion]
@CharID INT,
@DunID INT
AS
BEGIN
	DECLARE @QuestKCTotal INT SET @QuestKCTotal = (SELECT KillQty FROM Dungeons WHERE DungeonID = @DunID)
	DECLARE @QuestKCCurrent INT SET @QuestKCCurrent = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0)
	DECLARE @r INT --Result for quest completion. 0 = not completed, 1 = completed
	
	IF ((@QuestKCCurrent - 1) > 0) --If monster killed but no complete
		BEGIN
			SET @r = 0
		END
	ELSE IF ((@QuestKCCurrent - 1) <= 0) --If monster killed and complete
		BEGIN
			SET @r = 1
			UPDATE QuestJournal SET QuestJournalCompletion = 1 WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
		END

	RETURN @r
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEquipName]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetEquipName]
@EquipID INT,
@name NVARCHAR(25) OUT
AS
BEGIN
	SET @name = (SELECT EquipName FROM Equipements WHERE EquipID = @EquipID)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMonsterFromDungeon]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMonsterFromDungeon] 
@DunID INT
AS
BEGIN
	RETURN (SELECT TOP 1 EncounterMonsterID FROM Encounters WHERE EncounterDungeonID = @DunID ORDER BY NEWID())
END
GO
/****** Object:  StoredProcedure [dbo].[spGetMonsterName]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMonsterName]
@MonsterID INT,
@MonsterName NVARCHAR(50) OUTPUT
AS
BEGIN
	SET @MonsterName = (SELECT TOP 1 MonsterName FROM Monsters WHERE MonsterID = @MonsterID)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPlayerDefense]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetPlayerDefense]
@CharID INT
AS
BEGIN
	DECLARE @PlayerHeadDef INT, @PlayerTorsoDef INT, @PlayerLegsDef INT, @PlayerBootsDef INT, @PlayerGlovesDef INT, @PlayerTotalDef INT
	
	SET @PlayerHeadDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharHeadID WHERE CharHeadID != 0 AND CharID = @CharID)
	SET @PlayerTorsoDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharTorsoID WHERE CharTorsoID != 0 AND CharID = @CharID)
	SET @PlayerLegsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharLegsID WHERE CharLegsID != 0 AND CharID = @CharID)
	SET @PlayerBootsDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharBootsID WHERE CharBootsID != 0 AND CharID = @CharID)
	SET @PlayerGlovesDef = (SELECT EquipFlatDef FROM Equipements INNER JOIN Characters ON EquipID = CharGlovesID WHERE CharGlovesID != 0 AND CharID = @CharID)
	SET @PlayerTotalDef = 0

	IF NOT @PlayerHeadDef IS NULL
		SET @PlayerTotalDef += @PlayerHeadDef
	IF NOT @PlayerTorsoDef IS NULL
		SET @PlayerTotalDef += @PlayerTorsoDef
	IF NOT @PlayerLegsDef IS NULL
		SET @PlayerTotalDef += @PlayerLegsDef
	IF NOT @PlayerBootsDef IS NULL
		SET @PlayerTotalDef += @PlayerBootsDef
	IF NOT @PlayerGlovesDef IS NULL
		SET @PlayerTotalDef += @PlayerGlovesDef

	RETURN (@PlayerTotalDef)
END
GO
/****** Object:  StoredProcedure [dbo].[spGo]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGo] 
@charID INT,
@paramReturnText NVARCHAR(2048) OUTPUT
AS
BEGIN
	DECLARE @state NVARCHAR(25) SELECT @state = dbo.fnGetStatusCharacter(@charID)
	DECLARE @HasLoot BIT SELECT @HasLoot = dbo.fnCheckIfHasLoot(@charID)
	DECLARE @gold int Select @gold = dbo.fnGetGPCharacter(@charID)
	DECLARE @level int SELECT @level = dbo.fnGetLevelCharacter(@charID)
	DECLARE @monsterName NVARCHAR(25)
	DECLARE @LuckRollSuccess BIT

	SET @paramReturnText = ''

	IF @state = 'heal' --Message state
		BEGIN
			UPDATE Characters SET CharCurrHP = CharMaxHP WHERE CharID = @CharID
			SET @paramReturnText = 'You were greeted by hugs and kisses from the magic fairy (Most likely the village''s harlot). You feel revigorated.'
			EXEC dbo.spSetStatusCharacter @charID, 'sellLoot'
		END

	ELSE IF @state = 'sellLoot' --Actually heal character, then sell loot
		BEGIN
		UPDATE Characters SET CharCurrHP = CharMaxHP WHERE CharID = @CharID

		IF (@HasLoot = 1)--If player has loot
			BEGIN
				DECLARE @income INT SELECT @income = dbo.fnIncomeSellAllLoot(@charID)	

				SET @gold = @gold + @income
				EXEC dbo.spUpdateGPCharacter @charID, @gold
				EXEC dbo.spDeleteAllCharacterLoot @charID
				
				SET @paramReturnText = 'Selling your loot to the shopkeeper...'
				EXEC dbo.spSetStatusCharacter @charID, 'soldLoot'
			END
		ELSE --If player has no loot
			BEGIN				
				SET @paramReturnText = 'No loot to sell this time around, on your way to purchase equipement.'
				EXEC dbo.spSetStatusCharacter @charID, 'checkEquip'
			END
		END

	ELSE IF @state = 'soldLoot' --If loot was sold, tell player their profit
		BEGIN
			SET @paramReturnText = CONCAT('You sold all of your loot. You now have ', @gold, ' gold pieces.')
			EXEC dbo.spSetStatusCharacter @charID, 'checkEquip'
		END

	ELSE IF @state = 'checkEquip' --Message state
		BEGIN
			Set @paramReturnText = 'Checking to buy better equipement...'
			EXEC dbo.spSetStatusCharacter @charID, 'buyEquip'
		End

	ELSE IF @state = 'buyEquip' --Check if player can buy equip, if so, roll with wisdom to see if discount, then moves to quest.
		BEGIN
            DECLARE @randomEquipID INT EXEC @randomEquipID = dbo.spRandomItemByLevel @level
            DECLARE @canBuy INT SELECT @canBuy = dbo.fnCanBuyEquip(@charID, @randomEquipID)
            DECLARE @equipType INT SELECT @equipType = dbo.fnGetEquipType(@randomEquipID)
            DECLARE @canEquip INT SELECT @canEquip = dbo.fnCheckBetterEquip(@equipType, @charID, @randomEquipID)
            DECLARE @HasWisRollSuccess BIT EXEC @HasWisRollSuccess = dbo.spCharWisdomRoll @charID
			DECLARE @dungeonID INT 
            DECLARE @EquipName NVARCHAR(25) EXEC dbo.spGetEquipName @randomEquipID, @EquipName OUT
			DECLARE @DungeonCompletion INT
 
            IF @canBuy = 1 AND @canEquip = 1 --If player has enough money to buy the random equip AND can actually equip it.
                BEGIN 
                IF (@HasWisRollSuccess = 1) --If player rolled successfully with wisdom, shopkeeper gives discounted price.
                    BEGIN
                        DECLARE @discountedValue INT EXEC @discountedValue = dbo.spGetDiscountedValueEquip @randomEquipID
                        EXEC dbo.spEquipNew @CharID, @randomEquipID
 
                        SET @gold = @gold - @discountedValue
                        EXEC dbo.spUpdateGPCharacter @CharID, @gold
 
                        SET @paramReturnText = CONCAT('The old shopkeeper likes you and he gave you a friendly price. You bought ', @EquipName, ' for ', @discountedValue, ' gold pieces.')
                        EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                    END
                ELSE --If wisdom roll not successfull, buy at full price.
                    BEGIN
                        EXEC dbo.spEquipNew @CharID, @randomEquipID
 
                        SET @gold = @gold - (SELECT EquipValue FROM Equipements WHERE EquipID = @randomEquipID)
                        EXEC dbo.spUpdateGPCharacter @CharID, @gold
 
                        SET @paramReturnText = CONCAT('You bought and equipped: ', @EquipName, ' for ', (SELECT EquipValue FROM Equipements WHERE EquipID = @randomEquipID), ' gold pieces.')
                        EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                    END
					
                END
            ELSE IF @canBuy = 0 --If player can't afford the random equipement.
                BEGIN
                    SET @paramReturnText = 'You couldn''t afford this, you poor fuck.'
                    EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                END
            ELSE IF @canEquip = 0 --If player can't equip the random equipment.
                BEGIN
                    Set @paramReturnText = 'The proposed equipement was worst than what you already owned.'
                    EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                END	
		END

	ELSE IF @state = 'getQuest' --Get a quest if none is present in QuestJournal with same CharID, else go to encounter monster.
		BEGIN
			DECLARE @HasQuest INT EXEC @HasQuest = dbo.spHasActiveQuest @charID

			IF (@HasQuest = 0) --If player doesn't actually have a quest assigned
				Begin
					EXEC dbo.spRandomQuestByLevel @charID, @level
					DECLARE @nameDungeon nvarchar(50) SET @nameDungeon = (SELECT DungeonName FROM (Dungeons INNER JOIN QuestJournal ON DungeonID = QuestJournalDungeonID) WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID) --Get the active dungeon's name					
					
					SET @paramReturnText = CONCAT('A strange old man give you a quest: ', @nameDungeon)
					EXEC dbo.spSetStatusCharacter @charID, 'goDungeon'
				END
			ELSE --If player has a quest assigned
				BEGIN
					EXEC @LuckRollSuccess = dbo.spCharLuckRoll @charID

					IF @LuckRollSuccess = 0
						BEGIN
							SET @paramReturnText = 'Walking back to your dungeon...'
							EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
						END
					ELSE
						BEGIN
							SET @paramReturnText = 'A special event occured on your way to your dungeon, will today be a lucky day for you?'
							EXEC dbo.spSetStatusCharacter @charID, 'event'
						END					
				END
		END

	ELSE IF @state = 'goDungeon' --Message state
		BEGIN
			EXEC @LuckRollSuccess = dbo.spCharLuckRoll @charID

			IF @LuckRollSuccess = 0
				BEGIN
					SET @paramReturnText = 'Heading to your new dungeon...'
					EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
				END
			ELSE
				BEGIN
					SET @paramReturnText = 'You encountered a weird event on your way to your new dungeon. Good luck, you''ll need it. *Cue Pokemon Theme song*'
					EXEC dbo.spSetStatusCharacter @charID, 'event'
				END

			
		END

	ELSE IF @state = 'event'
		BEGIN
			DECLARE @eventID INT EXEC @eventID = dbo.spRandomEvents
			DECLARE @eventName nvarchar(50) SET @eventName = (SELECT EventName FROM Events WHERE EventID = @eventID)

			IF (@eventID = 1) --Goblin Thief event
				BEGIN
					DECLARE @DeletedEquipName NVARCHAR(50) 
					EXEC dbo.spDeleteRandomEquip 1, @DeletedEquipName OUT
					
					IF @DeletedEquipName = 'none'
						SET @paramReturnText = 'The goblin couldn''t steal anything because you don''t own anything LOL.'
					ELSE						
						SET @paramReturnText = CONCAT('You''re so dumb that a goblin thief stole your ', @DeletedEquipName, '.')			
				END

			ELSE IF (@eventID = 2) --Leprechaun stealing gold
				BEGIN
					DECLARE @StolenGold INT SET @StolenGold = CEILING(@gold * 0.25)					

					SET @gold = @gold - @StolenGold
					EXEC dbo.spUpdateGPCharacter @charID, @gold

					SET @paramReturnText = CONCAT('You trusted a leprechaun and he stole ', @StolenGold, ' gold piece from you. Turns out you''re stupid and he was evil.')
				END

			ELSE IF (@eventID = 3) --Falling in trap
				BEGIN
					DECLARE @CurrentHP INT SET @CurrentHP = (SELECT CharCurrHP FROM Characters WHERE CharID = @charID)
					DECLARE @LostHealth INT SET @LostHealth = CEILING(@CurrentHP * 0.25)

					EXEC spUpdateCharacterHealth @charID, @LostHealth

					SET @paramReturnText = CONCAT('Your family cat tilted and ended your arm''s life. You lost ', @LostHealth, ' HP. Don''t fuck with her.')
				END

			ELSE --Finding a treasure
				BEGIN
					DECLARE @FoundGold INT SET @FoundGold = (@gold * 0.1)
					SET @gold = @gold + @FoundGold
					EXEC dbo.spUpdateGPCharacter @charID, @gold

					SET @paramReturnText = CONCAT('Your dad shouldn''t have left you, because you are ', @FoundGold, ' GP richer! Could have bought so many cigarettes with that money.')
				END

			EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
		END

	ELSE IF @state = 'encounterMonster' --Add a random monster to 'Fight' from the 'encounter' associated with current dungeon, then move to the actual fight
		BEGIN			
			SET @dungeonID = (SELECT QuestJournalDungeonID FROM QuestJournal WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID)
			DECLARE @randomMonsterID INT EXEC @randomMonsterID = dbo.spGetMonsterFromDungeon @dungeonID
			DECLARE @monsterCurrentHP INT SET @monsterCurrentHP = (SELECT MonsterHP FROM Monsters WHERE MonsterID = @randomMonsterID)

			EXEC dbo.spGetMonsterName @randomMonsterID, @monsterName OUTPUT

			EXEC dbo.spGenerateFight @CharID, @randomMonsterID, @monsterCurrentHP

			SET @paramReturnText = CONCAT('You encounter a wild ', @monsterName, '!')
			EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'						
		End

	ELSE IF @state = 'monsterAttack' --Monster takes a turn hitting the player. Check if missed, player dead or write the damage dealt to player
		Begin
			DECLARE @MonsterID INT SET @MonsterID = (SELECT FightMonsterID FROM Fights WHERE FightCharacterID = @charID)
			DECLARE @PlayerHealth INT SET @PlayerHealth = (SELECT CharCurrHP FROM Characters WHERE CharID = @charID)
			DECLARE @PlayerDef INT EXEC @PlayerDef = dbo.spGetPlayerDefense @charID
			DECLARE @MonsterHitDamage INT EXEC @MonsterHitDamage = dbo.spGenerateMonsterHit @charID, @MonsterID

			EXEC dbo.spGetMonsterName @MonsterID, @monsterName OUTPUT

			IF @MonsterHitDamage <= 0 --If monster hit is 0 or lesser, miss.
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, '''s attack missed!')
					EXEC dbo.spSetStatusCharacter @charID, 'playerAttack'
				END		
			ELSE IF @PlayerHealth - @MonsterHitDamage <= 0 --If player would be dead with monster hit.
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, ' got the last of you, what a sad ending for a hero... Oh wait, you just revived.')
					EXEC dbo.spSetStatusCharacter @charID, 'sellLoot'
					DELETE FROM Fights WHERE FightCharacterID = @charID
				END					
			ELSE --If player not dead and monster's attack didn't miss.
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, ' kicked your butt for ', @MonsterHitDamage, ' damage.')			
					
					IF (@PlayerHealth <= 0) --If player is dead with monster hit.
						BEGIN
							EXEC dbo.spSetStatusCharacter @charID, 'playerDead'
						END
					ELSE --If not dead after hit, update health and move to player attack.
						BEGIN
							EXEC spUpdateCharacterHealth @charID, @MonsterHitDamage
							EXEC dbo.spSetStatusCharacter @charID, 'playerAttack'
						END						
				END			
		END

	ELSE IF @state = 'playerDead' --Message state
		BEGIN
			SET @paramReturnText = 'Oh dead, looks like you went out the door feet first.'		
			EXEC dbo.spSetStatusCharacter @charID, 'goVillage'
		END

	ELSE IF @state = 'playerAttack' --Player takes his turn in the fight
		BEGIN
			SET @MonsterID = (SELECT FightMonsterID FROM Fights WHERE FightCharacterID = @charID)
			DECLARE @MonsterHealth INT SET @MonsterHealth = (SELECT MonsterCurrentHP FROM Fights WHERE FightMonsterID = @MonsterID)
			DECLARE @PlayerHitDamage INT EXEC @PlayerHitDamage = dbo.spGeneratePlayerHit @charID

			IF @PlayerHitDamage <= 0 --If player hit is 0 or lesser, miss.
				BEGIN
					SET @paramReturnText = 'You missed your attack and that''s precisely why mother doesn''t love you.'
					EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'
				END		
			ELSE IF @MonsterHealth - @PlayerHitDamage <= 0 --If monster killed with player hit damage.
				BEGIN	
					DECLARE @maxExp Int SET @maxExp = @level * 150
					DECLARE @currentExp INT SET @currentExp = (SELECT CharExp FROM Characters WHERE CharID = @charID)
					DECLARE @monsterExp INT SET @monsterExp = (SELECT MonsterExp FROM Monsters WHERE MonsterID = @MonsterID)

					IF ((@currentExp + @monsterExp) >= @maxExp)
						BEGIN
							EXEC dbo.spUpdateCharLevel @charID, @level
							UPDATE Characters SET CharExp = 0 WHERE CharID = @CharID
							SET @paramReturnText = CONCAT('You finally ended that motherducker''s life! You''re also finally becoming better and grow up to ', @level + 1, '.')
						END
					ELSE
						BEGIN
							EXEC dbo.spUpdateCharExp @charID, @monsterExp, @currentExp
							SET @paramReturnText = CONCAT('You finally ended that motherducker''s life and got ', @monsterExp, ' experience for it.')
						END

					EXEC dbo.spPlayerKilledMonster @charID
					EXEC dbo.spSetStatusCharacter @charID, 'receiveLoot'
				END					
			ELSE --If monster not dead and attack didn't miss.
				BEGIN
					SET @paramReturnText = CONCAT('You kicked the monster in the teeth for ', @PlayerHitDamage, ' damage.')
					EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'					
					EXEC spUpdateMonsterHealth @MonsterID, @PlayerHitDamage, @charID
				END
		END

	ELSE IF @state = 'receiveLoot' --Receive loot from monster
		BEGIN
			DECLARE @LootID INT EXEC @LootID = dbo.spRandomLoot
			DECLARE @LootName nvarchar(50) SET @LootName = (SELECT LootName FROM Loots WHERE LootID = @LootID)
			DECLARE @qty INT SET @qty = (RAND()*(6 - 1) + 1)
			DECLARE @isOverweight INT
			EXEC @LuckRollSuccess = dbo.spCharLuckRoll @charID

			SET @dungeonID = (SELECT QuestJournalDungeonID FROM QuestJournal WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID)
			EXEC @DungeonCompletion = dbo.spGetDungeonCompletion @charID, @dungeonID

			EXEC dbo.spUpdateCharacterLoot @charID, @LootID, @qty
			EXEC @isOverweight = dbo.spIsOverweight @charID
			
			SET @paramReturnText = CONCAT('You searched the corpse and found: ', @LootName, ' ', @qty, 'x.')

			IF (@isOverweight = 0 AND @DungeonCompletion = 0)
				BEGIN
					IF @LuckRollSuccess = 0
						EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
					ELSE
						BEGIN
							SET @paramReturnText = CONCAT(@paramReturnText, '.. Wait! something weird is happening here... EVENT TIIIIIME!') 
							EXEC dbo.spSetStatusCharacter @charID, 'event'
						END					
				END
			ELSE IF (@isOverweight = 1)
				EXEC dbo.spSetStatusCharacter @charID, 'goVillageFull'
			ELSE IF (@DungeonCompletion = 1)
				EXEC dbo.spSetStatusCharacter @charID, 'goVillageDungeonDone'			
		END

	ELSE IF @state = 'goVillageFull' --Message state
		BEGIN
			SET @paramReturnText = 'Your inventory is full and you needed to pee, so you''re headed back to the village.'
			EXEC dbo.spSetStatusCharacter @charID, 'heal'
		END

	ELSE IF @state = 'goVillageDungeonDone' --Message state
		BEGIN
			SET @paramReturnText = 'You finished your dungeon and crave a GoblinBurger™. You''re on your way to the village...'
			EXEC dbo.spSetStatusCharacter @charID, 'heal'
		END

	ELSE IF @state = 'goVillage' --Message state
		Begin
			SET @paramReturnText = 'On your way to the village...'
			EXEC dbo.spSetStatusCharacter @charID, 'heal'
		END

	ELSE --Shouldn't be able to see this.
		BEGIN
			Set @paramReturnText = 'The heck you doing here peasant, go back to were you belong.'
			--EXEC dbo.spSetStatusCharacter @charID, 'heal'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spHasActiveQuest]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHasActiveQuest]
@CharID INT
AS
BEGIN
	DECLARE @QuestCount INT SET @QuestCount = (SELECT COUNT(QuestJournalCompletion) FROM QuestJournal WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @CharID)

	IF @QuestCount > 0
		RETURN 1
	ELSE RETURN 0	
END
GO
/****** Object:  StoredProcedure [dbo].[spIsCharacterNude]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsCharacterNude]
@CharID INT
AS
BEGIN
	DECLARE @isNude BIT SET @isNude = 0

	IF (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharRingID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	ELSE IF (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) IS NULL
		SET @isNude = 1

	RETURN @isNude
END
GO
/****** Object:  StoredProcedure [dbo].[spIsOverweight]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsOverweight]
@charID INT
AS
BEGIN
	DECLARE @MaxWeight INT SET @MaxWeight = (SELECT CharMaxLoot FROM Characters WHERE CharID = @charID)
	DECLARE @CurrWeight INT SET @CurrWeight = (SELECT SUM(CharLootQty) FROM CharLoot WHERE CharLootCharacterID = @charID)
	
	IF ((@CurrWeight + 1) >= @MaxWeight)
		RETURN 1
	ELSE RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[spPlayerKilledMonster]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlayerKilledMonster]
@CharID INT
AS
BEGIN
	DECLARE @CurrentKC INT SET @CurrentKC = (SELECT KillQty FROM QuestJournal WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0)

	UPDATE QuestJournal SET KillQty = (@CurrentKC - 1) WHERE QuestJournalCharacterID = @CharID AND QuestJournalCompletion = 0
	DELETE FROM Fights WHERE FightCharacterID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spRandomEquipStolen]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRandomEquipStolen]
@CharID INT
AS
BEGIN
	DECLARE @HasStolen BIT SET @HasStolen = 0
	DECLARE @StolenEquipID INT 
	DECLARE @EquipID INT

	WHILE @HasStolen = 0
		BEGIN
			SET @StolenEquipID = RAND()*(1-9) + 9

			IF (@StolenEquipID = 1 AND (SELECT CharHeadID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 2 AND (SELECT CharTorsoID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 3 AND (SELECT CharLegsID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 4 AND (SELECT CharBootsID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 5 AND (SELECT CharGlovesID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 6 AND (SELECT CharRingID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 7 AND (SELECT CharNeckLaceID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1

			ELSE IF (@StolenEquipID = 8 AND (SELECT CharWeapID FROM Characters WHERE CharID = @CharID) != NULL)
				SET @HasStolen = 1
		END
	
	RETURN @StolenEquipID
END
GO
/****** Object:  StoredProcedure [dbo].[spRandomEvents]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRandomEvents]
AS
BEGIN
	DECLARE @eventID INT SET @eventID = RAND()*(1-5) + 5
	RETURN @eventID
END
GO
/****** Object:  StoredProcedure [dbo].[spRandomItemByLevel]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRandomItemByLevel]
@level INT
AS
BEGIN
	 RETURN (SELECT TOP 1 EquipID FROM Equipements WHERE EquipLevel = @level ORDER BY NEWID())
END
GO
/****** Object:  StoredProcedure [dbo].[spRandomLoot]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRandomLoot]
AS
BEGIN
	 RETURN (SELECT TOP 1 LootID FROM Loots ORDER BY NEWID())
END
GO
/****** Object:  StoredProcedure [dbo].[spRandomQuestByLevel]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRandomQuestByLevel]
@CharID INT,
@level INT
AS
BEGIN
	DECLARE @DunID INT
	DECLARE @KillQty INT
	SET @DunID = (SELECT TOP 1 DungeonID FROM Dungeons WHERE DungeonLevel = @level ORDER BY NEWID())
	SET @KillQty = (SELECT KillQty FROM Dungeons WHERE DungeonID = @DunID)
	
	INSERT INTO QuestJournal VALUES (@CharID, @DunID, 0, @KillQty)
END
GO
/****** Object:  StoredProcedure [dbo].[spSetStatusCharacter]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSetStatusCharacter] 
@CharID int, @status nvarchar(25)
AS
UPDATE Characters
SET CharStatus = @status
WHERE CharID = @CharID
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharacterHealth]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateCharacterHealth]
@CharID INT,
@HitDamage INT
AS
BEGIN
	UPDATE Characters SET CharCurrHP = CharCurrHP - @HitDamage WHERE CharID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharacterLoot]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateCharacterLoot]
@charID INT,
@lootID INT,
@qty INT
AS
BEGIN
	IF EXISTS (SELECT CharLootID FROM CharLoot WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID)
		UPDATE CharLoot SET CharLootQty = CharLootQty + 1 WHERE CharLootLootID = @lootID AND CharLootCharacterID = @charID
	ELSE
		INSERT INTO CharLoot VALUES (@charID, @lootID, @qty)		
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharExp]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateCharExp]
@CharID INT,
@monsterExp INT,
@currentExp INT
AS
BEGIN
	UPDATE Characters SET CharExp = @currentExp + @monsterExp WHERE CharID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCharLevel]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateCharLevel]
@CharID INT,
@level INT
AS
BEGIN
	UPDATE Characters SET CharLevel = (@level + 1) WHERE CharID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateGPCharacter]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateGPCharacter]
@id integer, @gold integer
AS
UPDATE Characters
SET CharGP = @gold
WHERE Characters.CharID = @id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMonsterHealth]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateMonsterHealth]
@MonsterID INT,
@HitDamage INT,
@CharID INT
AS
BEGIN
	UPDATE Fights SET MonsterCurrentHP = MonsterCurrentHP - @HitDamage WHERE FightMonsterID = @MonsterID AND FightCharacterID = @CharID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateStealEquip]    Script Date: 2019-12-05 09:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateStealEquip]
@CharID INT, @eventID INT 
AS
BEGIN
	IF @eventID = 1
		BEGIN
			UPDATE Characters SET CharHeadID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 2
		BEGIN
			UPDATE Characters SET CharTorsoID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 3
		BEGIN
			UPDATE Characters SET CharLegsID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 4
		BEGIN
			UPDATE Characters SET CharBootsID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 5
		BEGIN
			UPDATE Characters SET CharGlovesID = NULL WHERE CharID = @CharID
		END
	ELSE IF @eventID = 6
		BEGIN
			UPDATE Characters SET CharRingID = NULL	WHERE CharID = @CharID
		END
	ELSE IF @eventID = 7
		BEGIN
			UPDATE Characters SET CharNeckLaceID = NULL	WHERE CharID = @CharID
		END
	ELSE
		BEGIN
			UPDATE Characters SET CharWeapID = NULL WHERE CharID = @CharID
		END
END
GO
USE [master]
GO
ALTER DATABASE [BD_IdleGame] SET  READ_WRITE 
GO