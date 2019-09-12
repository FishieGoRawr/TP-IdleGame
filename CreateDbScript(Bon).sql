CREATE DATABASE BD_IdleGame
 CONTAINMENT = NONE
 ON PRIMARY
 ( NAME = N'IdleGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
 ( NAME = N'IdleGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IdleGame_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 GO

 USE BD_IdleGame

 CREATE TABLE Characters
(
   CharID int IDENTITY(1,1) PRIMARY KEY,
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

 CREATE TABLE Race
(
   RaceID int IDENTITY(1,1),
   RaceName nvarchar(50) NOT NULL,
)
GO

 CREATE TABLE Class
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

 CREATE TABLE Monsters
(
   MonsterID int IDENTITY(1,1),
   MonsterLevel int NOT NULL,
   MonsterHP int NOT NULL,
   MonsterDmg int NOT NULL,
)
GO

 CREATE TABLE Quests
(
   QuestID int IDENTITY(1,1),
   QuestDungeonID int NOT NULL,
   QuestName nvarchar(50),
   QuestReward int NOT NULL
)
GO

 CREATE TABLE QuestJournal
(
   QuestJournalID int IDENTITY(1,1),
   QuestJournalCharacterID int NOT NULL,
   QuestJournalQuestID int NOT NULL,
   QuestJournalCompletion bit NOT NULL
)
GO

 CREATE TABLE Dungeons
(
   DungeonID int IDENTITY(1,1),
   DungeonMonsterBundleID int NOT NULL,
   DungeonName nvarchar(50),
   DungeonLevel int NOT NULL
)
GO

 CREATE TABLE MonsterBundle
(
   MonsterBundleID int IDENTITY(1,1),
   MonsterBundleDungeonID int NOT NULL,
   MonsterBundleMonsterID int NOT NULL,
   MonsterQty int NOT NULL
)
GO

CREATE TABLE Loot
(
   LootID int IDENTITY(1,1),
   LootName nvarchar(50),
   LootValue int
)
GO

CREATE TABLE CharLoot
(
   CharLootID int IDENTITY(1,1),
   CharLootCharacterID int,
   CharLootLootID int,
   CharLootQty int
)
GO

CREATE TABLE ConsumType
(
   ConsumTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Consum
(
   ConsumID int IDENTITY(1,1),
   ConsumConsumTypeID int,
   ConsumName nvarchar(50),
   ConsumRestore int
)
GO

CREATE TABLE CharConsum
(
   CharConsumID int IDENTITY(1,1),
   CharConsumCharacterID int,
   CharConsumConsumID int,
   CharConsumQty int
)
GO

CREATE TABLE EquipType
(
   EquipTypeID int IDENTITY(1,1),
   EquipTypeName nvarchar(50)
)
GO

CREATE TABLE Equip
(
   EquipID int IDENTITY(1,1),
   EquipEquipTypeID int,
   EquipName nvarchar(50),
   EquipValue int
)
GO

CREATE TABLE CharEquip
(
   CharEquipID int IDENTITY(1,1),
   CharEquipCharacterID int,
   CharEquipEquipID int,
   CharEquipQty int
)
GO

CREATE TABLE Spells
(
   SpellsID int IDENTITY(1,1),
   SpellMana int,
   SpellName nvarchar(50),
   SpellDamage int
)
GO

CREATE TABLE CharSpells
(
   CharSpellsID int IDENTITY(1,1),
   CharSpellsCharacterID int,
   CharSpellsSpellID int
)
GO

ALTER TABLE CharLoot ADD CONSTRAINT FK_CharLootCharacterID_CharacterID FOREIGN KEY(CharLootCharacterID) REFERENCES Characters(CharacterID)