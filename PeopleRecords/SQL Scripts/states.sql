USE [master]
GO

/****** Object:  Table [dbo].[states]    Script Date: 12/21/2018 7:46:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[states](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_code] [char](2) NOT NULL,
 CONSTRAINT [PK_states] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


