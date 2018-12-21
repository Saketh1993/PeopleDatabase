USE [master]
GO

/****** Object:  StoredProcedure [dbo].[uspPersonUpsert]    Script Date: 12/21/2018 7:47:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspPersonUpsert]
AS
BEGIN
DECLARE  @FirstName VARCHAR(50),
         @LastName VARCHAR(50),
		 @stateCode CHAR(2),
		 @DOB DATETIME='1/1/2001',
		 @Gender char(1),
		 @PersonID INT='0',
		 @StateID INT='0'



SELECT @StateID=(SELECT State_ID FROM states WHERE State_Code=@stateCode )

UPDATE person SET
       First_Name=@FirstName,
	   Last_Name =@LastName,
	   DOB=@DOB,
	   Gender=@Gender,
	   State_ID=@StateID
WHERE Person_Id=@PersonID

IF @@ROWCOUNT =0

INSERT INTO person(First_Name,Last_Name,DOB,Gender,State_ID)
 values (
             @FirstName,
	         @LastName,
	         @DOB,
	         @Gender,
	         @StateID
		)

END
GO

