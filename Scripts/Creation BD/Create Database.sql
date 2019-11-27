--CREATING DATA BASE
CREATE DATABASE BD_IdleGame_TEST
 CONTAINMENT = NONE
 ON PRIMARY
 ( NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGameTEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
 ( NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGameTEST_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 GO

 USE BD_IdleGame_TEST
 --DONE CREATING DB

--CREATING TABLES
 CREATE TABLE Characters --This table creates characters with stats, equipment, level, etc...
(
   CharID int IDENTITY(1,1), 
   CharRaceID int NOT NULL,
   CharClassID int NOT NULL,
   CharStatus int NOT NULL,
   CharName nvarchar(50) ,
   CharLevel int NOT NULL,
   CharExp int NOT NULL,
   CharGP int NOT NULL,
   CharQuestProgression int NOT NULL,
   CharHP int NOT NULL,
   CharMaxHP int NOT NULL,
   CharHPRegen int NOT NULL,
   CharMP int NOT NULL,
   CharMaxMP int NOT NULL,
   CharMPRegen int NOT NULL,
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
   CharWeap1ID int,
   CharWeap2ID int,
   CharNeckLaceID int,
   CharRing1ID int,
   CharRing2ID int,
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
   MonsterLevel int NOT NULL,
   MonsterHP int NOT NULL,
   MonsterDmg int NOT NULL,
)
GO

CREATE TABLE Encounter --Possible monsters to meet during dungeon
(
EncounterID int IDENTITY(1,1),
EncounterMonsterID int,
EncounterDungeonID int,
EncounterProbability int
)
GO

CREATE TABLE Fight --Currently fighting monster in this table
(
FightID int IDENTITY(1,1),
FightCharacterID int,
FightMonsterID int,
MonsterCurrentHP int
)
GO

 CREATE TABLE Quests --This table keep the quests, quest reward, which dungeon is linked to the quest, etc...
(
   QuestID int IDENTITY(1,1),
   QuestDungeonID int NOT NULL,
   QuestName nvarchar(50),
   QuestReward int NOT NULL
)
GO

 CREATE TABLE QuestJournal --This table keep track of which quest is done
(
   QuestJournalID int IDENTITY(1,1),
   QuestJournalCharacterID int NOT NULL,
   QuestJournalQuestID int NOT NULL,
   QuestJournalCompletion bit NOT NULL
)
GO

 CREATE TABLE Dungeons --This table keeps track of dungeon and which "MonsterBundle" is associated with it
(
   DungeonID int IDENTITY(1,1),
   DungeonLevel int NOT NULL
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
   EquipValue int
)
GO
--DONE CREATING TABLES

--ADDING PRIMARY KEYS
ALTER TABLE Loot ADD PRIMARY KEY (LootID)
GO
ALTER TABLE CharLoot ADD PRIMARY KEY (CharLootID)
GO
ALTER TABLE Characters ADD PRIMARY KEY (CharID)
GO
ALTER TABLE EquipType ADD PRIMARY KEY (EquipTypeID)
GO
ALTER TABLE Equip ADD PRIMARY KEY (EquipID)
GO
ALTER TABLE QuestJournal ADD PRIMARY KEY (QuestJournalID)
GO
ALTER TABLE Quests ADD PRIMARY KEY (QuestID)
GO
ALTER TABLE Dungeons ADD PRIMARY KEY (DungeonID)
GO
ALTER TABLE Race ADD PRIMARY KEY (RaceID)
GO
ALTER TABLE Class ADD PRIMARY KEY (ClassID)
GO
ALTER TABLE Monsters ADD PRIMARY KEY (MonsterID)
GO
--DONE ADDING PRIMARY KEYS

--ADDING FOREIN KEYS CONSTRAINT
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Characters FOREIGN KEY (CharLootCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLoot_Loot FOREIGN KEY (CharLootLootID) REFERENCES Loot(LootID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Characters FOREIGN KEY (QuestJournalCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Quests FOREIGN KEY (QuestJournalQuestID) REFERENCES Quests(QuestID)
GO
ALTER TABLE Quests ADD CONSTRAINT FK_Quests_Dungeons FOREIGN KEY (QuestDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Encounter ADD CONSTRAINT FK_Encounter_Dungeons FOREIGN KEY (EncounterDungeonID) REFERENCES Dungeons(DungeonID)
GO
ALTER TABLE Encounter ADD CONSTRAINT FK_Encounter_Monsters FOREIGN KEY (EncounterMonsterID) REFERENCES Monsters(MonsterID)
GO
ALTER TABLE Fight ADD CONSTRAINT FK_Fight_Characters FOREIGN KEY (FightCharacterID) REFERENCES Characters(CharID)
GO
ALTER TABLE Fight ADD CONSTRAINT FK_Fight_Monsters FOREIGN KEY (FightMonsterID) REFERENCES Monsters(MonsterID)
GO
ALTER TABLE Equip ADD CONSTRAINT FK_Equip_EquipType FOREIGN KEY (EquipEquipTypeID) REFERENCES EquipType(EquipTypeID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Race FOREIGN KEY (CharRaceID) REFERENCES Race(RaceID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_Characters_Class FOREIGN KEY (CharClassID) REFERENCES Class(ClassID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersHead_Equip FOREIGN KEY (CharHeadID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersTorso_Equip FOREIGN KEY (CharTorsoID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersLegs_Equip FOREIGN KEY (CharLegsID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersBoots_Equip FOREIGN KEY (CharBootsID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersGloves_Equip FOREIGN KEY (CharGlovesID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersWeap1_Equip FOREIGN KEY (CharWeap1ID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersWeap1_Equip FOREIGN KEY (CharWeap2ID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersNeck_Equip FOREIGN KEY (CharNeckLaceID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersRing1_Equip FOREIGN KEY (CharRing1ID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersRing2_Equip FOREIGN KEY (CharRing2ID) REFERENCES Equip(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT CHK_CharHP CHECK (CharHP >= 0);
GO
--DONE ADDING FOREIGN KEY CONSTRAINT