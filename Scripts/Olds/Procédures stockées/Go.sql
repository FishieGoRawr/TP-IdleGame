ALTER PROCEDURE spGo(@charID integer)

AS
BEGIN
	DECLARE @state int 
	SET @state = 0
	
	IF @state = 0
		Begin
			Declare @income int
			Set @income = 1
			DECLARE @nameLoot nvarchar(50)
			SET @nameLoot = ''

			SELECT 'Selling ' + @nameLoot
		End
	ELSE IF @state = 1
		Begin
			SELECT 'Checking to buy better equipement...'
		End
	ELSE IF @state = 2
		Begin
			DECLARE @nameQuest nvarchar(50)
			SET @nameQuest = ''
			SELECT 'A strange old man give you the quest :' + @nameQuest
		End
	ELSE IF @state = 3
		Begin
			SELECT 'Go to the dungeon...'
		End
	ELSE IF @state = 4
		Begin
			DECLARE @monsterName nvarchar(50) 
			SET @monsterName = ''
			SELECT 'You encounter a ' + @monsterName + '!'
		End
	ELSE IF @state = 5
		Begin
			DECLARE @damage int 
			SET @monsterName = ''
			SELECT @monsterName + 'attak and deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 6
		Begin
			SET @monsterName = ''
			SELECT 'Your attak deal ' + @damage + 'damage.'
		End
	ELSE IF @state = 7
		Begin
			DECLARE @qty int 
			SET @qty = 0
			DECLARE @lootName nvarchar(50)  
			SET @lootName = ''
			SELECT 'You slain the monster and get ' + @qty + @lootName
		End
	ELSE IF @state = 8
		Begin
			SELECT 'Return to the village...'
		End
	ELSE
		SELECT 'Your dead!'

    SELECT 'toto'
END