/*
   06 февруари 2015 г.3:48:18
   User: 
   Server: KELLER\SQLEXPRESS
   Database: School
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Classes
	(
	Id int NOT NULL IDENTITY (1, 1),
	Name varchar(150) NOT NULL,
	MaxStudents int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Classes ADD CONSTRAINT
	PK_Classes PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Classes SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
