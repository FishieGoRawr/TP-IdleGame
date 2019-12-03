USE [BD_IdleGame]
GO
/****** Object:  StoredProcedure [dbo].[spGo]    Script Date: 2019-12-02 18:37:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGo] 
@charID INT,
@paramReturnText NVARCHAR(2048) OUTPUT
AS
BEGIN
	DECLARE @state NVARCHAR(25) SELECT @state = dbo.fnGetStatusCharacter(@charID)
	DECLARE @HasLoot BIT SELECT @HasLoot = dbo.fnCheckIfHasLoot(@charID)
	DECLARE @gold int Select @gold = dbo.fnGetGPCharacter(@charID)
	DECLARE @level int SELECT @level = dbo.fnGetLevelCharacter(@charID)
	DECLARE @monsterName NVARCHAR(25)

	SET @paramReturnText = ''

	IF @state = 'sellLoot'
		BEGIN
		UPDATE Characters SET CharCurrHP = CharMaxHP WHERE CharID = @CharID

		IF @HasLoot = 1
			BEGIN
				DECLARE @income INT SELECT @income = dbo.fnIncomeSellAllLoot(@charID)	

				SET @gold = @gold + @income
				EXEC dbo.spUpdateGPCharacter @charID, @gold
				EXEC dbo.spDeleteAllCharacterLoot @charID
				
				SET @paramReturnText = 'Selling your loot to the shopkeeper...'
				EXEC dbo.spSetStatusCharacter @charID, 'soldLoot'
			END
		ELSE
			BEGIN				
				SET @paramReturnText = 'No loot to sell this time around, on your way to purchase equipement.'
				EXEC dbo.spSetStatusCharacter @charID, 'checkEquip'
			END
		END

	ELSE IF @state = 'soldLoot'
		BEGIN
			SET @paramReturnText = CONCAT('You sold all of your loot. You now have ', @gold, ' gold pieces.')
			EXEC dbo.spSetStatusCharacter @charID, 'checkEquip'
		END

	ELSE IF @state = 'checkEquip'
		BEGIN
			Set @paramReturnText = 'Checking to buy better equipement...'
			EXEC dbo.spSetStatusCharacter @charID, 'buyEquip'
		End

	ELSE IF @state = 'buyEquip'
		BEGIN
            DECLARE @randomEquipID INT EXEC @randomEquipID = dbo.spRandomItemByLevel @level
            DECLARE @canBuy INT SELECT @canBuy = dbo.fnCanBuyEquip(@charID, @randomEquipID)
            DECLARE @equipType INT SELECT @equipType = dbo.fnGetEquipType(@randomEquipID)
            DECLARE @canEquip INT SELECT @canEquip = dbo.fnCheckBetterEquip(@equipType, @charID, @randomEquipID)
            DECLARE @HasWisRollSuccess BIT EXEC @HasWisRollSuccess = dbo.spCharWisdomRoll @charID
			DECLARE @dungeonID INT 
            DECLARE @EquipName NVARCHAR(25) EXEC dbo.spGetEquipName @randomEquipID, @EquipName OUT
 
            IF @canBuy = 1 AND @canEquip = 1
                BEGIN 
                IF (@HasWisRollSuccess = 1)
                    BEGIN
                        DECLARE @discountedValue INT EXEC @discountedValue = dbo.spGetDiscountedValueEquip @randomEquipID
                        EXEC dbo.spEquipNew @CharID, @randomEquipID
 
                        SET @gold = @gold - @discountedValue
                        EXEC dbo.spUpdateGPCharacter @CharID, @gold
 
                        SET @paramReturnText = CONCAT('The old shopkeeper likes you and he gave you a friendly price. You bought ', @EquipName, ' for ', @discountedValue, ' gold pieces.')
                        EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                    END
                ELSE
                    BEGIN
                        EXEC dbo.spEquipNew @CharID, @randomEquipID
 
                        SET @gold = @gold - (SELECT EquipValue FROM Equipements WHERE EquipID = @randomEquipID)
                        EXEC dbo.spUpdateGPCharacter @CharID, @gold
 
                        SET @paramReturnText = CONCAT('You bought and equipped: ', @EquipName, ' for ', (SELECT EquipValue FROM Equipements WHERE EquipID = @randomEquipID), ' gold pieces.')
                        EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                    END
 
                   
                END
            ELSE IF @canBuy = 0
                BEGIN
                    SET @paramReturnText = 'You couldn''t afford this, you poor fuck.'
                    EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                END
            ELSE IF @canEquip = 0
                BEGIN
                    Set @paramReturnText = 'The proposed equipement was worst than what you already owned.'
                    EXEC dbo.spSetStatusCharacter @charID, 'getQuest'
                END	
		END
	ELSE IF @state = 'getQuest'
		BEGIN
			IF (Select Count(QuestJournalCompletion) From QuestJournal Where QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID) = 0
				Begin
					DECLARE @nameDungeon nvarchar(50)

					EXEC dbo.spRandomQuestByLevel @charID, @level --Set a random dungeon to QuestJournal							
					SET @nameDungeon = (SELECT DungeonName FROM (Dungeons INNER JOIN QuestJournal ON DungeonID = QuestJournalDungeonID) WHERE QuestJournalCompletion = 0) --Get the active dungeon's name

					SET @paramReturnText = CONCAT('A strange old man give you a quest: ', @nameDungeon)
					EXEC dbo.spSetStatusCharacter @charID, 'goDungeon'
				END
			ELSE
				BEGIN
					SET @paramReturnText = 'Walking back to your dungeon...'
					EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
				END
		END

	ELSE IF @state = 'goDungeon'
		BEGIN
			SET @paramReturnText = 'Heading to your new dungeon...'
			EXEC dbo.spSetStatusCharacter @charID, 'encounterMonster'
		END

	ELSE IF @state = 'encounterMonster'
		Begin					
				SET @dungeonID = (SELECT QuestJournalDungeonID FROM QuestJournal WHERE QuestJournalCompletion = 0 AND QuestJournalCharacterID = @charID)
				DECLARE @randomMonsterID INT EXEC @randomMonsterID = dbo.spGetMonsterFromDungeon @dungeonID
				DECLARE @monsterCurrentHP INT SET @monsterCurrentHP = (SELECT MonsterHP FROM Monsters WHERE MonsterID = @randomMonsterID)

				EXEC dbo.spGetMonsterName @randomMonsterID, @monsterName OUTPUT

				EXEC dbo.spGenerateFight @CharID, @randomMonsterID, @monsterCurrentHP

				SET @paramReturnText = CONCAT('You encounter a wild ', @monsterName, '!')
				EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'
						
		End

	ELSE IF @state = 'monsterAttack'
		Begin
			DECLARE @MonsterID INT SET @MonsterID = (SELECT FightMonsterID FROM Fights WHERE FightCharacterID = @charID)
			DECLARE @PlayerHealth INT SET @PlayerHealth = (SELECT CharCurrHP FROM Characters WHERE CharID = @charID)
			DECLARE @PlayerDef INT EXEC @PlayerDef = dbo.spGetPlayerDefense @charID
			DECLARE @MonsterHitDamage INT EXEC @MonsterHitDamage = dbo.spGenerateMonsterHit @charID, @MonsterID

			EXEC dbo.spGetMonsterName @MonsterID, @monsterName OUTPUT

			IF @MonsterHitDamage <= 0
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, '''s attack missed!')
					EXEC dbo.spSetStatusCharacter @charID, 'playerAttack'
				END		
			ELSE IF @PlayerHealth - @MonsterHitDamage <= 0
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, ' got the last of you, what a sad ending for a hero... Oh wait, you can revive in this game.')
					EXEC dbo.spSetStatusCharacter @charID, 'sellLoot'
					DELETE FROM Fights WHERE FightCharacterID = @charID
				END					
			ELSE
				BEGIN
					SET @paramReturnText = CONCAT(@monsterName, ' kicked your butt for ', @MonsterHitDamage, ' damage.')			
					
					IF (@PlayerHealth <= 0)
						BEGIN
							EXEC dbo.spSetStatusCharacter @charID, 'playerDead'
						END
					ELSE
						BEGIN
							EXEC spUpdateCharacterHealth @charID, @MonsterHitDamage
							EXEC dbo.spSetStatusCharacter @charID, 'playerAttack'
						END						
				END			
		END

	ELSE IF @state = 'playerDead'
		BEGIN
			SET @paramReturnText = 'Oh dead, looks like you went out the door feet first.'		
			EXEC dbo.spSetStatusCharacter @charID, 'goVillage'
		END

	ELSE IF @state = 'playerAttack'
		Begin
			SET @MonsterID = (SELECT FightMonsterID FROM Fights WHERE FightCharacterID = @charID)
			DECLARE @MonsterHealth INT SET @MonsterHealth = (SELECT MonsterCurrentHP FROM Fights WHERE FightMonsterID = @MonsterID)
			DECLARE @PlayerHitDamage INT EXEC @PlayerHitDamage = dbo.spGeneratePlayerHit @charID

			IF @PlayerHitDamage <= 0
				BEGIN
					SET @paramReturnText = 'Your attack missed, you dump shit!'
					EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'
				END		
			ELSE IF @MonsterHealth - @PlayerHitDamage <= 0
				BEGIN					
					SET @dungeonID = (SELECT QuestJournalDungeonID FROM QuestJournal WHERE QuestJournalCharacterID = @charID AND QuestJournalCompletion = 0)
					DECLARE @DungeonCompletion INT EXEC @DungeonCompletion = dbo.spGetDungeonCompletion @charID, @dungeonID

					IF (@DungeonCompletion = 0)
						BEGIN
							--Remove monster from killcount, clear fight table, go to encounter monster
							EXEC dbo.spPlayerKilledMonster @charID
							SET @paramReturnText = 'You finally ended that mothertrucker'' life, moving on to the next trouble.'
							EXEC dbo.spSetStatusCharacter @charID, 'goVillage' --go get loot but not working yet	
						END
					ELSE IF (@DungeonCompletion = 1)
						BEGIN
							EXEC dbo.spCompleteDungeon @charID
							SET @paramReturnText = 'Was about time! You finally finished the dungeon. Good work!'
							EXEC dbo.spSetStatusCharacter @charID, 'goVillage'	
						END





					--DELETE FROM Fights WHERE FightCharacterID = @charID
					--SET @paramReturnText = 'You finally ended that mothertrucker'' life. Was about time!'
				END					
			ELSE
				BEGIN
					SET @paramReturnText = CONCAT('You kicked the monster in the teeth for ', @PlayerHitDamage, ' damage.')
					EXEC dbo.spSetStatusCharacter @charID, 'monsterAttack'					
					EXEC spUpdateMonsterHealth @MonsterID, @PlayerHitDamage
				END

		End

	ELSE IF @state = 'receiveLoot'
		Begin
			SET @paramReturnText = 'Next step!'
		End

	ELSE IF @state = 'goVillage'
		Begin
			SET @paramReturnText = 'On your way to the village...'
			EXEC dbo.spSetStatusCharacter @charID, 'sellLoot'
		End

	ELSE
		Set @paramReturnText = 'Fookin'' done'
END