USE [master]
GO

/****** Object:  StoredProcedure [dbo].[uspPersonSearch]    Script Date: 12/21/2018 7:46:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspPersonSearch]
AS
BEGIN
		 SELECT person_id ,
				First_Name,
				Last_Name,
				State_ID,
				Gender,
				DOB
		FROM person
     
END 




GO


