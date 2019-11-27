CREATE FUNCTION fnGetAllCharacterEquip(@ID INTEGER)
RETURNS TABLE
AS
RETURN
SELECT CharHead, CharTorso, CharLegs, CharBoots, CharGloves, CharWeap1, CharWeap2, CharNeckLace, CharRing1, CharRing2 FROM Characters
WHERE CharID = @ID