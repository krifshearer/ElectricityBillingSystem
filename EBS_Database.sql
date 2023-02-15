-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: electricitybillingsystem
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `ID` int NOT NULL,
  `Street_Number` varchar(10) NOT NULL,
  `Address_Line_1` varchar(30) NOT NULL,
  `Address_Line_2` varchar(20) DEFAULT NULL,
  `City` varchar(25) NOT NULL,
  `Postal_Code` varchar(5) NOT NULL,
  `Country` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `Account_No` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `User_Name` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Phone_Home` int NOT NULL,
  `Phone_Cell` int NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Account_Type` varchar(12) NOT NULL,
  `Status` varchar(12) NOT NULL,
  PRIMARY KEY (`Account_No`),
  CONSTRAINT `consumer_chk_1` CHECK ((`Account_Type` in (_utf8mb4'Individual',_utf8mb4'Commercial'))),
  CONSTRAINT `consumer_chk_2` CHECK ((`Status` in (_utf8mb4'Active',_utf8mb4'Inactive')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer_address`
--

DROP TABLE IF EXISTS `consumer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer_address` (
  `Consumer_ID` int DEFAULT NULL,
  `Address_ID` int DEFAULT NULL,
  KEY `Consumer_ID` (`Consumer_ID`),
  KEY `Address_ID` (`Address_ID`),
  CONSTRAINT `consumer_address_ibfk_1` FOREIGN KEY (`Consumer_ID`) REFERENCES `consumer` (`Account_No`),
  CONSTRAINT `consumer_address_ibfk_2` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer_address`
--

LOCK TABLES `consumer_address` WRITE;
/*!40000 ALTER TABLE `consumer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_account_dues`
--

DROP TABLE IF EXISTS `current_account_dues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_account_dues` (
  `Account_No` int NOT NULL,
  `Prev_Balance` decimal(15,2) NOT NULL,
  `Payments_Since_Last_Invoice` decimal(15,2) NOT NULL,
  `Unpaid_Balance` decimal(15,2) DEFAULT NULL,
  `Late_Fee` decimal(15,2) DEFAULT NULL,
  `Credits` decimal(15,2) DEFAULT NULL,
  `Curr_Statement_Charge` decimal(15,2) NOT NULL,
  `Amt_Due` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Account_No`),
  CONSTRAINT `current_account_dues_ibfk_1` FOREIGN KEY (`Account_No`) REFERENCES `consumer` (`Account_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_account_dues`
--

LOCK TABLES `current_account_dues` WRITE;
/*!40000 ALTER TABLE `current_account_dues` DISABLE KEYS */;
/*!40000 ALTER TABLE `current_account_dues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Job_Title` varchar(30) NOT NULL,
  `Hire_date` date NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_no`
--

DROP TABLE IF EXISTS `job_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_no` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Job_Date` date NOT NULL,
  `Account_No` int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Meter_No` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Account_No` (`Account_No`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Meter_No` (`Meter_No`),
  CONSTRAINT `job_no_ibfk_1` FOREIGN KEY (`Account_No`) REFERENCES `consumer` (`Account_No`),
  CONSTRAINT `job_no_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  CONSTRAINT `job_no_ibfk_3` FOREIGN KEY (`Meter_No`) REFERENCES `meter` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_no`
--

LOCK TABLES `job_no` WRITE;
/*!40000 ALTER TABLE `job_no` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter`
--

DROP TABLE IF EXISTS `meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter` (
  `ID` int NOT NULL,
  `ESSID` int NOT NULL,
  `Prev_Read_Date` date NOT NULL,
  `Curr_Read_Date` date NOT NULL,
  `Reading_Type` varchar(20) NOT NULL,
  `Prev_Read` int NOT NULL,
  `Curr_Read` int NOT NULL,
  `Multipler` float(10,2) NOT NULL,
  `Usage_KWH` float(10,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter`
--

LOCK TABLES `meter` WRITE;
/*!40000 ALTER TABLE `meter` DISABLE KEYS */;
/*!40000 ALTER TABLE `meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `ID` int NOT NULL,
  `Card_Type` varchar(20) NOT NULL,
  `Card_No` int NOT NULL,
  `Card_Name` varchar(50) NOT NULL,
  `CVV` int NOT NULL,
  `Expiry_Date` date NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `consumer` (`Account_No`),
  CONSTRAINT `payment_details_chk_1` CHECK ((`Card_Type` in (_utf8mb4'Visa',_utf8mb4'Mastercard',_utf8mb4'JCB',_utf8mb4'Diners Club',_utf8mb4'Discover',_utf8mb4'American Express')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_receipt`
--

DROP TABLE IF EXISTS `payment_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipt` (
  `Receipt_ID` int NOT NULL AUTO_INCREMENT,
  `Account_No` int NOT NULL,
  `Receipt_Date` date NOT NULL,
  `Amount_Due` decimal(15,2) NOT NULL,
  `Amount_Paid` decimal(15,2) NOT NULL,
  `Amount_Remaining` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Receipt_ID`),
  KEY `Account_No` (`Account_No`),
  CONSTRAINT `payment_receipt_ibfk_1` FOREIGN KEY (`Account_No`) REFERENCES `consumer` (`Account_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipt`
--

LOCK TABLES `payment_receipt` WRITE;
/*!40000 ALTER TABLE `payment_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statement_bill`
--

DROP TABLE IF EXISTS `statement_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statement_bill` (
  `Statement_No` int NOT NULL AUTO_INCREMENT,
  `Account_No` int NOT NULL,
  `Period_Start` date NOT NULL,
  `Period_End` date NOT NULL,
  `Due_Date` date NOT NULL,
  `Meter_No` int NOT NULL,
  `Period_Charge` decimal(15,2) NOT NULL,
  `Total_Amt_Due` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Statement_No`),
  KEY `Meter_No` (`Meter_No`),
  KEY `Account_No` (`Account_No`),
  CONSTRAINT `statement_bill_ibfk_1` FOREIGN KEY (`Meter_No`) REFERENCES `meter` (`ID`),
  CONSTRAINT `statement_bill_ibfk_2` FOREIGN KEY (`Account_No`) REFERENCES `consumer` (`Account_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statement_bill`
--

LOCK TABLES `statement_bill` WRITE;
/*!40000 ALTER TABLE `statement_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `statement_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_history`
--

DROP TABLE IF EXISTS `usage_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_history` (
  `Account_No` int NOT NULL,
  `Period_Start` date NOT NULL,
  `kWH_Usage` decimal(15,4) NOT NULL,
  `Rate_Per_kWH` decimal(15,4) NOT NULL,
  `Period_Cost` decimal(15,2) NOT NULL,
  `Avg_Temp` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Account_No`),
  CONSTRAINT `usage_history_ibfk_1` FOREIGN KEY (`Account_No`) REFERENCES `consumer` (`Account_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_history`
--

LOCK TABLES `usage_history` WRITE;
/*!40000 ALTER TABLE `usage_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03 19:16:04
