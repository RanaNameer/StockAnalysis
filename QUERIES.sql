/*QUERY 01--Displays exchange name and city of each market*/
/*Here we applied Join on `market` and `exchange` to get Exchange Name*/
SELECT `market`.`Market Name`, `market`.`City`, 
`exchange`.`Name` AS `Exchange Name`
FROM `market` JOIN `exchange` 
ON `market`.`Exchange ID`=`exchange`.`ID`;

/*QUERY 02--Displays consultancy firms that work for particular Exchange.*/
/* Here we applied JOIN on consultancy firm and exchange to get Consultancy Firms for particular Exchange*/
SELECT `consultancy firm`.`Name` AS `Consultancy Firms` 
FROM `consultancy firm` JOIN `exchange`
ON `consultancy firm`.`Exchange ID`=`exchange`.`ID`
WHERE `exchange`.`Name`='NASDAQ';

/*QUERY 03--Displays company that had the highest Bid.*/
/* Here we applied Aggregate Function to get Max Bid*/
SELECT `company`.`Name`,`company`.`Category`,
MAX(`stock quote`.`Bid`) AS `Bid`
FROM `company` JOIN `stock quote` 
ON `company`.`ID`=`stock quote`.`Company ID`;

/*QUERY 04--Displays country with the highest overall average divedent yield.*/
/*Displays max average yield of countries in descending order by using Order 
By operator and we use two aggregate functions here ROUND and AVG.*/    
SELECT `shares leaderboard`.`Country`AS `Country`,
ROUND(AVG(`shares leaderboard`.`Divedent Yeild %`),2) AS `Average Yield` 
FROM `shares leaderboard`
GROUP BY `Country`
ORDER BY `Average Yield` DESC;

/*QUERY 05--Displays the total volume of particular bank between the specified dates.*/
/*USES SUM aggreagate function and between operator to specify dates*/
SELECT `company`.`Name`, `company`.`Category`, SUM(`shares`.`Volume`) 
AS `Total Volume` FROM `shares` JOIN `company` 
ON `shares`.`Company ID`=`company`.`ID` 
WHERE `company`.`Name` = 'HABIB BANK LIMITED' 
AND (`shares`.`DATE` BETWEEN '2017-01-12' AND '2017-01-16') ;

/*QUERY 06--Displays the average balance of every seller.*/
/*DISPLAYS THE AVERAGE BALANCE OF EVERY SELLER ROUNDED TO 2 DECIMAL PLACES, 
AND GROUPED BY THE EXCHANGE ID OF THE SELLERS */
SELECT `exchange`.`Name` AS `Exchange Name`, 
ROUND(AVG(`seller`.`Balance`),2) AS `Seller Average Balance`
FROM `seller` JOIN `exchange` ON 
`seller`.`Exchange ID`=`exchange`.`ID` 
GROUP BY `seller`.`Exchange ID`;

/*QUERY 07--Displays the country with the most amount of shares.*/
/*Applied Count here to count the number of shares by a country */
SELECT `shares leaderboard`.`Country`, 
COUNT(`shares leaderboard`.`Country`) AS `Count`
FROM `shares leaderboard` 
GROUP BY `shares leaderboard`.`Country`
ORDER BY `Count` DESC
LIMIT 1;

/*QUERY 08--Displays the averages change in the upper and lower cap values of every company category.*/
/*DISPLAYS THE AVERAGE CHANGE OF EVERY COMPANY CATEGORY. WE CALCULATE THE AVERAGE CHANGE BY TAKING THE ABSOLUTE VALUE OF UPPER CAP -  LOWER CAP*/
SELECT `company`.`category`, ROUND(AVG(A.`Change`), 2) AS `Average Change` FROM
         (SELECT `Company ID`, 
          ROUND(AVG(ABS(`shares`.`Upper Cap`-`shares`.`Lower Cap`)),2) 
          AS `Change` FROM `shares` 
          GROUP BY `Company ID`) AS A
JOIN `company` ON `company`.`ID`=`A`.`Company ID`
GROUP BY `company`.`category`;

/*QUERY 09--Displays the companies with the highest points in the exchange.*/
/*Here we applied aggregate function to get Max Points Gain and nested queries.*/
SELECT `company`.`Name`, `company`.`Category`, `Exchange`.`Name`, `Exchange`.`Points Gain` FROM
    (SELECT `exchange`.`ID`, `exchange`.`Name`, `points`.`Points Gain` 
     AS  `Points Gain` FROM `points` JOIN `exchange` 
     ON (`points`.`Exchange ID`=`exchange`.`ID` AND `points`.`Points Gain`= 
          (SELECT MAX(`points`.`Points Gain`) FROM `points`) )) 
     AS `Exchange`  JOIN `company` ON `company`.`ID`=`Exchange`.`ID`;
     
/*QUERY 10--Displays the names of the buyers that bought a stock that was in the top 5 of the shares leaderboard.*/
SELECT C.`Buyer Name` AS `Buyer Name`,C.`Company Name` AS `Company Name`,`shares leaderboard`.`Rank` AS `Company Rank`, C.`Lower Cap`, C.`DATE` FROM 
        (SELECT B.`Company ID`, `company`.`Name` AS `Company Name`, 
         B.`Name` AS `Buyer Name`, B.`Lower Cap`, B.`DATE` FROM 
                (SELECT  `shares`.`Company ID`, `shares`.`Lower Cap`,
                 `shares`.`DATE`, A.`Name` FROM
                        (SELECT `buyer`.`Name`,`transaction log`.`Shares ID`
                         FROM (`buyer` JOIN `transaction log` 
                         ON `buyer`.`ID`=`transaction log`.`Buyer ID`)) AS A
                 JOIN `shares`ON A.`Shares ID`=`shares`.`ID`) AS B
         JOIN `company` ON `company`.`ID`=B.`Company ID`) AS C
JOIN `shares leaderboard` ON `shares leaderboard`.`Name`=C.`Company Name`
WHERE `shares leaderboard`.`Rank`<=5
ORDER BY C.`Lower Cap`;