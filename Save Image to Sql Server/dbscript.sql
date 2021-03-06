USE [DotnetMob]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 19-Nov-2016 11:36:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Image]') AND type in (N'U'))
DROP TABLE [dbo].[Image]
GO
/****** Object:  StoredProcedure [dbo].[ImageViewAll]    Script Date: 19-Nov-2016 11:36:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageViewAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ImageViewAll]
GO
/****** Object:  StoredProcedure [dbo].[ImageAddOrEdit]    Script Date: 19-Nov-2016 11:36:31 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageAddOrEdit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ImageAddOrEdit]
GO
/****** Object:  StoredProcedure [dbo].[ImageAddOrEdit]    Script Date: 19-Nov-2016 11:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageAddOrEdit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ImageAddOrEdit] 
@ImageID INT,
@Title VARCHAR(50),
@Image IMAGE
AS
BEGIN
	IF(@ImageID=0)
	BEGIN
	INSERT INTO Image
	 (Title, Image)VALUES
	(@Title,@Image)
	END
	ELSE
	BEGIN
	UPDATE Image
	SET 
	Title=@Title,
	Image=@Image
	WHERE ImageID=@ImageID
	END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ImageViewAll]    Script Date: 19-Nov-2016 11:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageViewAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[ImageViewAll]
AS
BEGIN
SELECT ImageID,Title,Image
FROM Image
END
' 
END
GO
/****** Object:  Table [dbo].[Image]    Script Date: 19-Nov-2016 11:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Image]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
