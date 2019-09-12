--CREATING DATA BASE
CREATE DATABASE BD_IdleGame
 CONTAINMENT = NONE
 ON PRIMARY
 ( NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
 ( NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 GO

 USE BD_IdleGame
 --DONE CREATING DB


--CREATING TABLES
 CREATE TABLE Characters --This table creates characters with stats, equipment, level, etc...
(
   CharID int IDENTITY(1,1),
   CharRaceId int NOT NULL,
   CharClassId int NOT NULL,
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
   CharHead bit NOT NULL,
   CharTorso bit NOT NULL,
   CharLegs bit NOT NULL,
   CharBoots bit NOT NULL,
   CharGloves bit NOT NULL,
   CharWeap1 bit NOT NULL,
   CharWeap2 bit NOT NULL,
   CharNeckLace bit NOT NULL,
   CharRing1 bit NOT NULL,
   CharRing2 bit NOT NULL,
)
GO

 CREATE TABLE Race --This table set the character's race
(
   RaceID int IDENTITY(1,1),
   RaceName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Class --This table set the character's class
(
   ClassID int IDENTITY(1,1),
   ClassName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Kills
(
   KillID int IDENTITY(1,1),
   KillCharacterID int NOT NULL,
   KillDungeonID int NOT NULL,
   KillMonsterID int NOT NULL,
   KillQty int NOT NULL,
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
   DungeonMonsterBundleID int NOT NULL,
   DungeonName nvarchar(50),
   DungeonLevel int NOT NULL
)
GO

 CREATE TABLE MonsterBundle --This table creates a bundle that the user has to fight in order to progress (Complete dungeon)
(
   MonsterBundleID int IDENTITY(1,1),
   MonsterBundleDungeonID int NOT NULL,
   MonsterBundleMonsterID int NOT NULL,
   MonsterQty int NOT NULL
)
GO

CREATE TABLE Loot --
(
   LootID int IDENTITY(1,1),
   LootName nvarchar(50),
   LootValue int
)
GO

CREATE TABLE CharLoot --
(
   CharLootID int IDENTITY(1,1),
   CharLootCharacterID int,
   CharLootLootID int,
   CharLootQty int
)
GO

CREATE TABLE ConsumType --
(
   ConsumTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Consum --
(
   ConsumID int IDENTITY(1,1),
   ConsumConsumTypeID int,
   ConsumName nvarchar(50),
   ConsumRestore int
)
GO

CREATE TABLE CharConsum --
(
   CharConsumID int IDENTITY(1,1),
   CharConsumCharacterID int,
   CharConsumConsumID int,
   CharConsumQty int
)
GO

CREATE TABLE EquipType --
(
   EquipTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Equip --
(
   EquipID int IDENTITY(1,1),
   EquipEquipTypeID int,
   EquipName nvarchar(50),
   EquipValue int
)
GO

CREATE TABLE CharEquip --
(
   CharEquipID int IDENTITY(1,1),
   CharEquipCharacterID int,
   CharEquipEquipID int,
   CharEquipQty int
)
GO

CREATE TABLE Spells --
(
   SpellsID int IDENTITY(1,1),
   SpellMana int,
   SpellName nvarchar(50),
   SpellDamage int
)
GO

CREATE TABLE CharSpells --
(
   CharSpellsID int IDENTITY(1,1),
   CharSpellsCharacterID int,
   CharSpellsSpellID int
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
ALTER TABLE ConsumType ADD PRIMARY KEY (ConsumTypeID)
GO
ALTER TABLE Consum ADD PRIMARY KEY (ConsumID)
GO
ALTER TABLE CharConsum ADD PRIMARY KEY (CharConsumID)
GO
ALTER TABLE EquipType ADD PRIMARY KEY (EquipTypeID)
GO
ALTER TABLE Equip ADD PRIMARY KEY (EquipID)
GO
ALTER TABLE CharEquip ADD PRIMARY KEY (CharEquipID)
GO
ALTER TABLE Spells ADD PRIMARY KEY (SpellsID)
GO
ALTER TABLE CharSpells ADD PRIMARY KEY (CharSpellsID)
GO
ALTER TABLE QuestJournal ADD PRIMARY KEY (QuestJournalID)
GO
ALTER TABLE Quests ADD PRIMARY KEY (QuestID)
GO
ALTER TABLE Dungeons ADD PRIMARY KEY (DungeonID)
GO
ALTER TABLE Race ADD PRIMARY KEY (RaceID)
GO
ALTER TABLE Kills ADD PRIMARY KEY (KillID)
GO
ALTER TABLE MonsterBundle ADD PRIMARY KEY (MonsterBundleID)
GO
ALTER TABLE Class ADD PRIMARY KEY (ClassID)
GO
ALTER TABLE Monsters ADD PRIMARY KEY (MonsterID)
GO
--DONE ADDING PRIMARY KEYS


--ADDING FOREIN KEYS CONSTRAINT

--DONE ADDING FOREIGN KEY CONSTRAINT