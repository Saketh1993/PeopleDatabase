USE [master]
GO

/****** Object:  StoredProcedure [dbo].[uspStatesList]    Script Date: 12/21/2018 7:47:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Procedure to get the state codes and their ID 
-- created on 12/18/2018 created by -srinivas saketh khambhammettu

CREATE PROCEDURE [dbo].[uspStatesList]
AS
BEGIN
    select state_id,state_code from states
END
GO


