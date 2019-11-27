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
   CharRaceID int NOT NULL,
   CharClassID int NOT NULL,
   CharStatus int NOT NULL,
   CharName nvarchar(50) NOT NULL,
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
   MonsterName NVARCHAR(50),
   MonsterLevel int NOT NULL,
   MonsterHP int NOT NULL,
   MonsterDmg int NOT NULL,
)
GO

CREATE TABLE Encounters --Possible monsters to meet during dungeon
(
EncounterID int IDENTITY(1,1),
EncounterDungeonID int,
EncounterMonsterID int,
EncounterProbability float
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
   DungeonLevel int NOT NULL,
   KillQty int NOT NULL
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
ALTER TABLE Loots ADD PRIMARY KEY (LootID)
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
ALTER TABLE Quests ADD PRIMARY KEY (QuestID)
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
ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Quests FOREIGN KEY (QuestJournalQuestID) REFERENCES Quests(QuestID)
GO
ALTER TABLE Quests ADD CONSTRAINT FK_Quests_Dungeons FOREIGN KEY (QuestDungeonID) REFERENCES Dungeons(DungeonID)
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
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersWeap1_Equip FOREIGN KEY (CharWeap1ID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersWeap2_Equip FOREIGN KEY (CharWeap2ID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersNeck_Equip FOREIGN KEY (CharNeckLaceID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersRing1_Equip FOREIGN KEY (CharRing1ID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT FK_CharactersRing2_Equip FOREIGN KEY (CharRing2ID) REFERENCES Equipements(EquipID)
GO
ALTER TABLE Characters ADD CONSTRAINT CHK_CharHP CHECK (CharHP >= 0);
GO
--DONE ADDING FOREIGN KEY CONSTRAINT

--ADDING DATA TO TABLES
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
INSERT INTO Monsters VALUES ('Chicken', 1, 5, 1)
INSERT INTO Monsters VALUES ('Rat', 2, 10, 2)
INSERT INTO Monsters VALUES ('Giant Rat', 5, 20, 4)
INSERT INTO Monsters VALUES ('Goblin', 10, 30, 6)
INSERT INTO Monsters VALUES ('Undead', 15, 35, 8)
INSERT INTO Monsters VALUES ('Minautor', 20, 35, 12)
INSERT INTO Monsters VALUES ('Lost Merfolk', 25, 50, 10)
INSERT INTO Monsters VALUES ('Basilik', 30, 80, 13)
INSERT INTO Monsters VALUES ('Hydra', 50, 200, 20)
INSERT INTO Monsters VALUES ('Dragon', 75, 350, 25)
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

INSERT INTO Dungeons VALUES (1, 5)
INSERT INTO Dungeons VALUES (3, 10)
INSERT INTO Dungeons VALUES (5, 13)
INSERT INTO Dungeons VALUES (7, 17)
INSERT INTO Dungeons VALUES (10, 30)
GO

INSERT INTO Quests VALUES (1 ,'Just waking up', 10)
INSERT INTO Quests VALUES (2,'This is my life now', 25)
INSERT INTO Quests VALUES (3,'Farming up...', 100)
INSERT INTO Quests VALUES (4,'Who are you again?', 100)
INSERT INTO Quests VALUES (5,'Just waking up', 100)
GO

--Dun1
INSERT INTO Encounters VALUES (1, 1, .3)
INSERT INTO Encounters VALUES (1, 2, .3)
INSERT INTO Encounters VALUES (1, 3, .3)
INSERT INTO Encounters VALUES (1, 5, .1)
--Dun2
INSERT INTO Encounters VALUES (2, 2, .4)
INSERT INTO Encounters VALUES (2, 3, .2)
INSERT INTO Encounters VALUES (2, 4, .2)
INSERT INTO Encounters VALUES (2, 5, .1)
INSERT INTO Encounters VALUES (2, 6, .1)
--Dun3
INSERT INTO Encounters VALUES (3, 2, .1)
INSERT INTO Encounters VALUES (3, 3, .1)
INSERT INTO Encounters VALUES (3, 4, .2)
INSERT INTO Encounters VALUES (3, 5, .4)
INSERT INTO Encounters VALUES (3, 6, .2)
--Dun4
INSERT INTO Encounters VALUES (4, 4, .1)
INSERT INTO Encounters VALUES (4, 5, .2)
INSERT INTO Encounters VALUES (4, 6, .4)
INSERT INTO Encounters VALUES (4, 7, .3)
--Dun5
INSERT INTO Encounters VALUES (5, 6, .4)
INSERT INTO Encounters VALUES (5, 8, .3)
INSERT INTO Encounters VALUES (5, 9, .2)
INSERT INTO Encounters VALUES (5, 10, .1)
GO
--DONE ADDING DATA TO TABLES

