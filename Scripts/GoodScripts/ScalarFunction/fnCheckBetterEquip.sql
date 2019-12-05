--Verify if the preposed equipement at the shop is better than the one owned
CREATE Function fnCheckBetterEquip (@equipTypeID int, @charID int, @newEquipId int)
RETURNS bit
AS
BEGIN
	Declare @canEquip bit
	Declare @currentEquipID int

	Declare @atk int Select @atk = (Select EquipFlatAtk From Equipements Where EquipID = @newEquipId) --Select the attack bonus of the preposed equip
	Declare @def int Select @def = (Select EquipFlatDef From Equipements Where EquipID = @newEquipId) --Select the defense bonus of the preposed equip
	Declare @currentAtk int
	Declare @currentDef int

	--Verify if the preposed equip is an helmet
	If @equipTypeID = 1
		Begin
			Select @currentEquipID = (Select CharHeadID From Characters Where CharID = @charID)
			Select @currentAtk = (Select EquipFlatAtk From Equipements Where EquipID = @currentEquipID) --Select the attack bonus of the current equip
			Select @currentDef = (Select EquipFlatDef From Equipements Where EquipID = @currentEquipID) --Select the defense bonus of the current equip

			--Verify if the character doesn't already had an equipement
			If (Select CharHeadID From Characters Where CharID = @charID) IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk < @atk Or @currentDef < @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is a plate
	Else If @equipTypeID = 2
		Begin
			Select @currentEquipID = (Select CharTorsoID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is a legging
	Else If @equipTypeID = 3
		Begin
			Select @currentEquipID = (Select CharLegsID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is boots
	Else If @equipTypeID = 4
		Begin
			Select @currentEquipID = (Select CharBootsID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is gloves
	Else If @equipTypeID = 5
		Begin
			Select @currentEquipID = (Select CharGlovesID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is a ring
	Else If @equipTypeID = 6
		Begin
			Select @currentEquipID = (Select CharRingID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is a necklace
	Else If @equipTypeID = 7
		Begin
			Select @currentEquipID = (Select CharNeckLaceID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End

	--Verify if the preposed equip is a weapon
	Else If @equipTypeID = 8 Or @equipTypeID = 9 Or @equipTypeID = 10
		Begin
			Select @currentEquipID = (Select CharWeapID From Characters Where CharID = @charID)

			--Verify if the character doesn't already had an equipement
			If @currentEquipID IS NULL
				Begin
					Set @canEquip = 1
				End
			Else
				--Verify if the new bonus is better than the older one
				If @currentAtk <= @atk Or @currentDef <= @def
					Begin
						Set @canEquip = 1
					End
				Else
					Set @canEquip = 0
		End
	
	RETURN @canEquip
END
GO


