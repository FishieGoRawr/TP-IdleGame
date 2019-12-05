CREATE PROCEDURE spGo
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
					DECLARE @nameDungeon nvarchar(50) SET @nameDungeon = (SELECT DungeonName FROM (Dungeons INNER JOIN QuestJournal ON DungeonID = QuestJournalDungeonID) WHERE QuestJournalCompletion = 0) --Get the active dungeon's name					
					
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
					EXEC spUpdateMonsterHealth @MonsterID, @PlayerHitDamage
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


