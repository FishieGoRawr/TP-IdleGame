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
   CharWeap1ID int,
   CharWeap2ID int,
   CharNeckLaceID int,
   CharRing1ID int,
   CharRing2ID int,
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
   QuestJournalCompletion bit NOT NULL
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

ALTER TABLE QuestJournal ADD CONSTRAINT FK_QuestJournal_Quests FOREIGN KEY (QuestJournalQuestID) REFERENCES Quests(QuestID)
GO
ALTER TABLE Quests ADD CONSTRAINT FK_Quests_Dungeons FOREIGN KEY (QuestDungeonID) REFERENCES Dungeons(DungeonID)
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
INSERT INTO Characters VALUES (0, 1, 1, 'getQuest', 'Alex', 1, 0, 5, 0, 100, 100, 10, 15, 10, 10, 10, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO Characters VALUES (0, 6, 4, 'getQuest', 'Rachel', 5, 0, 25, 0, 350, 150, 25, 30, 30, 30, 30, 30, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

INSERT INTO Events VALUES ('Thief Goblin', 10)
INSERT INTO Events VALUES ('Leprechaun', 10)
INSERT INTO Events VALUES ('Trap', 25)
INSERT INTO Events VALUES ('Treasure', 15)

INSERT Equipements VALUES (1, 'Leather Headcover', 25, 1, 0, 2)
INSERT Equipements VALUES (1, 'Wooden Cap', 25, 1, 0, 2)
INSERT Equipements VALUES (1, 'Infernal Bandana', 30, 2, 0, 3)
INSERT Equipements VALUES (1, 'Cloth Hood', 30, 2, 0, 3)
INSERT Equipements VALUES (1, 'Iron Facemask', 55, 5, 0, 6)
INSERT Equipements VALUES (1, 'Iron Medhelm', 55, 5, 0, 6)
INSERT Equipements VALUES (1, 'Padded Helm', 55, 6, 0, 8)
INSERT Equipements VALUES (1, 'Fighter Mask', 70, 7, 0, 9)
INSERT Equipements VALUES (1, 'Goblin''s Face', 70, 7, 0, 9)
INSERT Equipements VALUES (2, 'Iron Chestplate', 25, 1, 0, 3)
INSERT Equipements VALUES (2, 'Silk Chestpiece', 25, 1, 0, 3)
INSERT Equipements VALUES (2, 'Iron Vest', 30, 2, 0, 4)
INSERT Equipements VALUES (2, 'Warden''s armor', 30, 2, 0, 5)
INSERT Equipements VALUES (2, 'Mail Vest', 35, 3, 0, 3)
INSERT Equipements VALUES (2, 'Iron Battleplate', 35, 3, 0, 3)
INSERT Equipements VALUES (2, 'Broken Chestplate', 40, 4, 0, 3)
INSERT Equipements VALUES (2, 'Runic Chestguard', 55, 5, 0, 5)
INSERT Equipements VALUES (3, 'Ugly Skirt', 20, 1, 0, 2)
INSERT Equipements VALUES (3, 'Mail Leggings', 20, 1, 0, 5)
INSERT Equipements VALUES (3, 'Iron Platelegs', 30, 2, 0, 4)
INSERT Equipements VALUES (3, 'Iron Skirt', 30, 2, 0, 3)
INSERT Equipements VALUES (3, 'Serpent''s Legguards', 45, 3, 0, 2)
INSERT Equipements VALUES (3, 'Mage''s Robe', 55, 5, 0, 5)
INSERT Equipements VALUES (3, 'Light Legwraps', 55, 5, 0, 4)
INSERT Equipements VALUES (3, 'Cloth Kilt', 45, 6, 0, 2)
INSERT Equipements VALUES (3, 'Iron Greaves', 45, 7, 0, 1)
INSERT Equipements VALUES (3, 'Hell Legplates', 45, 8, 0, 3)
INSERT Equipements VALUES (4, 'Boots', 25, 1, 0, 5)
INSERT Equipements VALUES (4, 'Pelt shoes', 25, 1, 0, 2)
INSERT Equipements VALUES (4, 'High Boots', 30, 2, 0, 1)
INSERT Equipements VALUES (4, 'Great Boots', 30, 2, 0, 2)
INSERT Equipements VALUES (4, 'Elf Boots', 60, 3, 0, 2)
INSERT Equipements VALUES (4, 'Armored Boots', 60, 3, 0, 3)
INSERT Equipements VALUES (4, 'Magic Boots', 55, 5, 0, 5)
INSERT Equipements VALUES (4, 'Demon Boots', 55, 5, 0, 4)
INSERT Equipements VALUES (4, 'Sabaton', 60, 7, 0, 5)
INSERT Equipements VALUES (4, 'Iron Boots', 60, 8, 0, 6)
INSERT Equipements VALUES (5, 'Iron Warfists', 25, 1, 0, 4)
INSERT Equipements VALUES (5, 'Cloth Grips', 30, 2, 0, 2)
INSERT Equipements VALUES (5, 'Gloves', 70, 3, 0, 5)
INSERT Equipements VALUES (5, 'Armored Gloves', 40, 4, 0, 8)
INSERT Equipements VALUES (6, 'Minor Protection Ring', 25, 1, 0, 1)
INSERT Equipements VALUES (6, 'Protection Ring', 30, 2, 0, 2)
INSERT Equipements VALUES (6, 'Great Protection Ring', 10, 3, 0, 5)
INSERT Equipements VALUES (6, 'Major Protection Ring', 40, 4, 0, 7)
INSERT Equipements VALUES (7, 'Major Protection Necklace', 25, 1, 0, 9)
INSERT Equipements VALUES (7, 'Great Protection Necklace', 30, 2, 0, 3)
INSERT Equipements VALUES (7, 'Protection Necklace', 10, 3, 0, 2)
INSERT Equipements VALUES (7, 'Minor Protection Necklace', 40, 4, 0, 1)
INSERT Equipements VALUES (8, 'Club', 25, 1, 2, 0)
INSERT Equipements VALUES (8, 'Dagger', 30, 2, 3, 0)
INSERT Equipements VALUES (8, 'Sword', 10, 3, 4, 0)
INSERT Equipements VALUES (8, 'Claymore', 40, 4, 5, 0)
INSERT Equipements VALUES (9, 'Bow', 25, 1, 6, 0)
INSERT Equipements VALUES (9, 'Great Bow', 30, 2, 7, 0)
INSERT Equipements VALUES (9, 'Elf Bow', 10, 3, 8, 0)
INSERT Equipements VALUES (9, 'Long Bow', 40, 4, 6, 0)
INSERT Equipements VALUES (10, 'Fire Staff', 25, 1, 5, 0)
INSERT Equipements VALUES (10, 'Staff', 30, 2, 4, 0)
INSERT Equipements VALUES (10, 'Wooden Staff', 10, 3, 1, 0)
INSERT Equipements VALUES (10, 'Frost Staff', 40, 4, 5, 0)

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

INSERT INTO Dungeons VALUES (1, 5, 'Plain', 5)
INSERT INTO Dungeons VALUES (3, 10, 'Cave', 10)
INSERT INTO Dungeons VALUES (5, 13, 'Old Mine', 15)
INSERT INTO Dungeons VALUES (7, 17, 'Graveyard', 20)
INSERT INTO Dungeons VALUES (10, 30, 'Dark Fortress', 25)

INSERT INTO Dungeons VALUES (1, 5, 'Large Plain', 5)
INSERT INTO Dungeons VALUES (3, 10, 'Cave', 10)
INSERT INTO Dungeons VALUES (5, 13, 'Foundry', 15)
INSERT INTO Dungeons VALUES (7, 17, 'Undead Pit', 20)
INSERT INTO Dungeons VALUES (10, 30, 'Volcanic Cave', 25)

INSERT INTO Dungeons VALUES (1, 5, 'Forest', 5)
INSERT INTO Dungeons VALUES (3, 10, 'Cave', 10)
INSERT INTO Dungeons VALUES (5, 13, 'Swamp', 15)
INSERT INTO Dungeons VALUES (7, 17, 'Sand Fortress', 20)
INSERT INTO Dungeons VALUES (10, 30, 'Magic Cavern', 25)
GO

--Dun1
INSERT INTO Encounters VALUES (1, 1)
INSERT INTO Encounters VALUES (1, 2)
INSERT INTO Encounters VALUES (1, 3)
--Dun2
INSERT INTO Encounters VALUES (2, 5)
INSERT INTO Encounters VALUES (2, 2)
INSERT INTO Encounters VALUES (2, 3)
INSERT INTO Encounters VALUES (2, 4)
INSERT INTO Encounters VALUES (2, 5)
INSERT INTO Encounters VALUES (2, 6)
--Dun3
INSERT INTO Encounters VALUES (3, 2)
INSERT INTO Encounters VALUES (3, 3)
INSERT INTO Encounters VALUES (3, 4)
INSERT INTO Encounters VALUES (3, 5)
INSERT INTO Encounters VALUES (3, 6)
--Dun4
INSERT INTO Encounters VALUES (4, 4)
INSERT INTO Encounters VALUES (4, 5)
INSERT INTO Encounters VALUES (4, 6)
INSERT INTO Encounters VALUES (4, 7)
--Dun5
INSERT INTO Encounters VALUES (5, 6)
INSERT INTO Encounters VALUES (5, 8)
INSERT INTO Encounters VALUES (5, 9)
INSERT INTO Encounters VALUES (5, 10)
--Dun6
INSERT INTO Encounters VALUES (8, 1)
--Dun7
INSERT INTO Encounters VALUES (9, 2)
--Dun8
INSERT INTO Encounters VALUES (10, 3)
--Dun9
INSERT INTO Encounters VALUES (11, 5)
--Dun10
INSERT INTO Encounters VALUES (12, 9)
--Dun11
INSERT INTO Encounters VALUES (13, 2)
--Dun12
INSERT INTO Encounters VALUES (14, 4)
--Dun13
INSERT INTO Encounters VALUES (15, 4)
--Dun14
INSERT INTO Encounters VALUES (16, 6)
--Dun15
INSERT INTO Encounters VALUES (17, 10)
GO

INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 8, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 1, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 13, 1, 4)
INSERT QuestJournal VALUES (1, 1, 0, 4)
GO
--DONE ADDING DATA TO TABLES

