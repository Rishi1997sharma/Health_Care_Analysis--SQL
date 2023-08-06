CREATE DATABASE health_care;
USE health_care;

###  Q.No-1 Number of Patients across various summaries.
SELECT  `dialysis1`.`Provider Number`,
		`dialysis1`.`Number of patients included in the transfusion summary` AS Transfussion_Summary,
		`dialysis1`.`Number of patients in hypercalcemia summary` AS Hypercalcemia_Summary,
		`dialysis1`.`Number of patient-months in hypercalcemia summary` AS Hypercalcemia_Summary_patient_per_mnth,
        `dialysis1`.`Number of patients in Serum phosphorus summary` AS Serum_phosphorus_Summary,
        `dialysis1`.`Number of patient-months in Serum phosphorus summary` AS Serum_phosphorus_Summary_per_mnth,
        `dialysis1`.`No. of patients included in hospitalization summary` AS Hospitalization,
        `dialysis1`.`hospitalizations included in hospital readmission summary` AS Hospital_Readmission,
        `dialysis1`.`Number of Patients included in survival summary` AS Sumary_Summary,
        `dialysis1`.`Number of Patients included in fistula summary` AS Fistual_Summary,
        `dialysis1`.`Number of patients in long term catheter summary` AS Catheter_Summary ,
        `dialysis1`.`Number of patient months in long term catheter summary` AS Catheter_Summary_Per_mnth,
        `dialysis1`.`Number of patients in nPCR summary` AS nPCR_Summary,
        `dialysis1`.`Number of patient-months in nPCR summary` AS nPCR_Summary_per_mnth
FROM `dialysis1`;

### Q.No-2 Profit Vs Non-Profit Stats
SELECT  `dialysis1`.`Chain Organization`,
		`dialysis1`.`Profit or Non-Profit`,
	CASE
		WHEN 
			`dialysis1`.`Profit or Non-Profit` = "Profit"
		THEN
			1 ELSE 0
	END AS Profit,
    CASE
		WHEN 
			`dialysis1`.`Profit or Non-Profit` = "Non-Profit"
		THEN
			1 ELSE 0
	END AS Non_Profit
FROM `health_care`.`dialysis1`;
      
### Q.No-3 Chain Organizations w.r.t. Total Performance Score as No Score

SELECT `dialysis1`.`Chain Organization`,
		`dialysis2`.`Total Performance Score`
FROM `health_care`.`dialysis1`
JOIN
`health_care`.`dialysis2`
ON `dialysis1`.`Facility Name` = `dialysis2`.`Facility Name`
GROUP BY `dialysis1`.`Chain Organization`
ORDER BY `Total Performance Score` DESC;

### Q.No-4 Dialysis Stations Stats
SELECT `dialysis1`.`Chain Organization`,
		`dialysis1`.`# of Dialysis Stations` AS  No_Of_Dialysis_Station
FROM `health_care`.`dialysis1`
GROUP BY `dialysis1`.`Chain Organization`
ORDER BY `dialysis1`.`# of Dialysis Stations` DESC;


### Q.No- 5 # of Category Text  - As Expected
SELECT 
		SUM(CASE
			WHEN 
                `dialysis1`.`Patient hospitalization category text` = "As Expected"
			THEN 1 ELSE 0
		END) AS Patient_hospitalization_category_text,
        SUM(CASE
			WHEN 
                `dialysis1`.`Fistula Category Text` = "As Expected"
            THEN 1 ELSE 0 END) AS Fistula_Category_Text,
		SUM(CASE
			WHEN 
                `dialysis1`.`Patient Transfusion category text` = "As Expected"
			THEN 1 ELSE 0 END) AS Patient_Transfusion_category,
        SUM(CASE
			WHEN 
                `dialysis1`.`Patient Hospital Readmission Category` = "As Expected"
			THEN 1 ELSE 0 END) AS Patient_Hospital_Readmission_Category,
        SUM(CASE
			WHEN
			    `dialysis1`.`Patient Survival Category Text` = "As Expected"
			THEN 1 ELSE 0 END) AS Patient_Survival_Category,
        SUM(CASE
			WHEN
			    `dialysis1`.`Patient Infection category text` = "As Expected"
			THEN 1 ELSE 0 END) AS Patient_Infection_category,
		SUM(CASE
			WHEN
				`dialysis1`.`SWR category text` = "As Expected"
			THEN 1 ELSE 0 END) AS SWR_category_text,
        SUM(CASE
			WHEN
				`dialysis1`.`PPPW category text` = "As Expected"
			THEN 1 ELSE 0 END) AS PPPW_category_text
FROM `health_care`.`dialysis1`;

### Q.No- 6 Average Payment Reduction Rate
SELECT
`dialysis - 2`.`Facility Name`,
AVG(`dialysis - 2`.`PY2020 Payment Reduction Percentage`) AS Avg_Payment_Reduction_Rate
FROM `dialysis - 2`
GROUP BY `dialysis - 2`.`PY2020 Payment Reduction Percentage`;



















