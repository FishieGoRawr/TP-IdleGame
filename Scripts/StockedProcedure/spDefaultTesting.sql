CREATE PROCEDURE spDefaultTesting
@CharID INT
AS
BEGIN
	UPDATE Characters
	SET CharStatus = 'receiveLoot',
		CharHeadID = NULL,
		CharTorsoID = NULL,
		CharLegsID = NULL,
		CharBootsID = NULL,
		CharGlovesID = NULL,
		CharWeapID = NULL,
		CharRingID = NULL,
		CharCurrHP = 100,
		CharGP = 1000
	WHERE CharID = @CharID
END
GO


