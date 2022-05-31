/* Alter the Data type of Return Column in LeaderBoard table to Float */
ALTER TABLE `leader board`
MODIFY `Return` FLOAT;

/* Update the Points For Exchange Id 2 to 3000 */
UPDATE points
SET `Points Gain` = 3000
WHERE `Exchange ID` = 2;

/*Update the Balance of Ronald to 65000 */
UPDATE buyer
SET Balance = (Balance - 6000)
WHERE `Name` = 'Ronald';

/*Delete the SELLER 'Oliver' */
DELETE FROM Seller 
WHERE Name = 'Oliver'; 

/*Alter Datatype of Volume in Shares Table to BIGINT */
ALTER TABLE `shares`
MODIFY Volume BIGINT;

/* ORXIM is no more in Top 10 , Delete it */
DELETE FROM `shares leaderboard`
WHERE Name = 'ORIXM';
