Create PROCEDURE spGo 
@charID integer
AS
BEGIN
	Declare @state nvarchar(25) 
	Select @state = dbo.fnGetStatusCharacter(@charID)

	Declare @text nvarchar(250)
	Declare @asLoot bit
	Select @asLoot = dbo.fnCheckIfHasLoot(@charID)
	
	IF @state = 'sellLoot' And @asLoot = 1
		Begin
			Declare @income int
			Declare @gold int

			Select @income = dbo.fnIncomeSellAllLoot(@charID)

			Select @gold = dbo.fnGetGPCharacter(@charID)
			Set @gold = @gold + @income
			
			EXEC dbo.spUpdateGPCharacter @charID, @gold
			EXEC dbo.spDeleteAllCharacterLoot @charID

			Set @state = 'buyEquip'
			EXEC dbo.spSetStatusCharacter @charID, @state 

			Set @text = 'Selling all loot...'
		End
	ELSE IF @state = 'buyEquip'
		Begin
			Declare @equip1 int
			Declare @equip2 int
			Declare @equip3 int
			Declare @equipType1 nvarchar(25)
			Declare @equipType2 nvarchar(25)
			Declare @equipType3 nvarchar(25)

			Select @equip1 = dbo.fnRandomShopItem(@charID)
			Select @equip2 = dbo.fnRandomShopItem(@charID)
			Select @equip3 = dbo.fnRandomShopItem(@charID)

			Select @equipType1 = dbo.fnGetEquipTypeName(@equip1)
			Select @equipType2 = dbo.fnGetEquipTypeName(@equip2)
			Select @equipType3 = dbo.fnGetEquipTypeName(@equip3)

			If @equipType1 = 1
				Declare @ifHasEquip bit
				Select @ifHasEquip = 
				Begin
					If @ifHasEquip = 1
						Begin
							
						End
				End

			Set @text = 'Checking to buy better equipement...'
		End
	ELSE IF @state = 'getQuest'
		Begin
			DECLARE @nameDungeon nvarchar(50)
			SET @nameDungeon = ''
			SELECT 'A strange old man give you the quest :' + @nameDungeon
		End
	ELSE IF @state = 'goDungeon'
		Begin
			SELECT 'Go to the dungeon...'
		End
	ELSE IF @state = 'encouterMonster'
		Begin
			DECLARE @monsterName nvarchar(50) 
			SET @monsterName = ''
			SELECT 'You encounter a ' + @monsterName + '!'
		End
	ELSE IF @state = 'monsterAttack'
		Begin
			DECLARE @damage int 
			SET @monsterName = ''
			SELECT @monsterName + 'attak and deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 'playerAttack'
		Begin
			SET @monsterName = ''
			SELECT 'Your attak deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 'receiveLoot'
		Begin
			DECLARE @qty int 
			SET @qty = 0
			DECLARE @lootName nvarchar(50)  
			SET @lootName = ''
			SELECT 'You slain the monster and get ' + @qty + @lootName
		End
	ELSE IF @state = 'goVillage'
		Begin
			SELECT 'Return to the village...'
		End
	ELSE
		SELECT 'Your dead!'

    Return @text
END