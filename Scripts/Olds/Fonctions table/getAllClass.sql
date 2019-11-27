CREATE FUNCTION fnGetAllClasses ()
	RETURNS TABLE
AS
	RETURN 
		SELECT DISTINCT Classes.ClassID AS ID, Classes.ClassName AS Name FROM Classes
	