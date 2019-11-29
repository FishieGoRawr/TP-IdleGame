Create Function fnCheckBetterEquip(@equipTypeID int, @charID int, @newEquipId int)
RETURNS bit
AS
BEGIN
	Declare @hasEquip bit
	Declare @equiId int

	Declare @atk int
	Declare @def int

	Select @atk = (Select EquipFlatAtk From Equipements Where EquipID = @newEquipId)
	Select @def = (Select EquipFlatDef From Equipements Where EquipID = @newEquipId)

	Declare @currentAtk int
	Declare @currentDef int

	Select @currentAtk = (Select EquipFlatAtk From Equipements Where EquipID = @equiId)
	Select @currentDef = (Select EquipFlatDef From Equipements Where EquipID = @equiId)

	If @equipTypeID = 1
		Begin
			Select @equiId = (Select CharHeadID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 2
		Begin
			Select @equiId = (Select CharTorsoID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 3
		Begin
			Select @equiId = (Select CharLegsID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 4
		Begin
			Select @equiId = (Select CharBootsID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 5
		Begin
			Select @equiId = (Select CharGlovesID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 6
		Begin
			Select @equiId = (Select CharRingID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 7
		Begin
			Select @equiId = (Select CharNeckLaceID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0
		End

	Else If @equipTypeID = 8 Or @equipTypeID = 9 Or @equipTypeID = 10
		Begin
			Select @equiId = (Select CharWeapID From Characters Where CharID = @charID)

			If @equiId = Null
				Begin
					Set @hasEquip = 0
				End
			Else
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @hasEquip = 1
					End
				Else
					Set @hasEquip = 0

		End
	
	RETURN @hasEquip
END