CREATE VIEW viewExistingBundles
AS
SELECT MonsterBundleID, DungeonName,  MonsterName, MonsterQty FROM 
((MonsterBundle INNER JOIN Dungeons ON MonsterBundleDungeonID = DungeonID)
INNER JOIN Monsters ON MonsterBundleMonsterID = MonsterID)
ORDER BY
DungeonName