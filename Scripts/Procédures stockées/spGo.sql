Create PROCEDURE spGo 
@charID integer
AS
BEGIN
	Declare @state nvarchar(25) 
	Select @state = dbo.fnGetStatusCharacter(@charID)

	Declare @text nvarchar(250)
	
	IF @state = 'sellLoot'
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

			Select @equip1 = dbo.fnRandomShopItem(@charID)
			Select @equip2 = dbo.fnRandomShopItem(@charID)
			Select @equip3 = dbo.fnRandomShopItem(@charID)

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