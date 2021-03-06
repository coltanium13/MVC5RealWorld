
CREATE DATABASE DemoDB;

--LOOKUPRole table
USE [DemoDB]
GO

CREATE TABLE [dbo].[LOOKUPRole](
    [LOOKUPRoleID] [int] IDENTITY(1,1) NOT NULL,
    [RoleName] [varchar](100) DEFAULT '',
    [RoleDescription] [varchar](500) DEFAULT '',
    [RowCreatedSYSUserID] [int] NOT NULL,
    [RowCreatedDateTime] [datetime]  DEFAULT GETDATE(),
    [RowModifiedSYSUserID] [int] NOT NULL,
    [RowModifiedDateTime] [datetime] DEFAULT GETDATE(),
PRIMARY KEY (LOOKUPRoleID)
    )
GO


--Adding test data to LOOKUPRole table
INSERT INTO LOOKUPRole (RoleName,RoleDescription,RowCreatedSYSUserID,RowModifiedSYSUserID)
       VALUES ('Admin','Can Edit, Update, Delete',1,1)
INSERT INTO LOOKUPRole (RoleName,RoleDescription,RowCreatedSYSUserID,RowModifiedSYSUserID)
       VALUES ('Member','Read only',1,1)


--SYSUser table
USE [DemoDB]
GO

CREATE TABLE [dbo].[SYSUser](
    [SYSUserID] [int] IDENTITY(1,1) NOT NULL,
    [LoginName] [varchar](50) NOT NULL,
    [PasswordEncryptedText] [varchar](200) NOT NULL,
    [RowCreatedSYSUserID] [int] NOT NULL,
    [RowCreatedDateTime] [datetime] DEFAULT GETDATE(),
    [RowModifiedSYSUserID] [int] NOT NULL,
    [RowModifiedDateTime] [datetime] DEFAULT GETDATE(),
    PRIMARY KEY (SYSUserID)
)

GO



--SYSUserProfile table
USE [DemoDB]
GO


CREATE TABLE [dbo].[SYSUserProfile](
    [SYSUserProfileID] [int] IDENTITY(1,1) NOT NULL,
    [SYSUserID] [int] NOT NULL,
    [FirstName] [varchar](50) NOT NULL,
    [LastName] [varchar](50) NOT NULL,
    [Gender] [char](1) NOT NULL,
    [RowCreatedSYSUserID] [int] NOT NULL,
    [RowCreatedDateTime] [datetime] DEFAULT GETDATE(),
    [RowModifiedSYSUserID] [int] NOT NULL,
    [RowModifiedDateTime] [datetime] DEFAULT GETDATE(),
    PRIMARY KEY (SYSUserProfileID)
    )
GO

ALTER TABLE [dbo].[SYSUserProfile]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO


--SYSUserRole table
USE [DemoDB]
GO

CREATE TABLE [dbo].[SYSUserRole](
    [SYSUserRoleID] [int] IDENTITY(1,1) NOT NULL,
    [SYSUserID] [int] NOT NULL,
    [LOOKUPRoleID] [int] NOT NULL,
    [IsActive] [bit] DEFAULT (1),
    [RowCreatedSYSUserID] [int] NOT NULL,
    [RowCreatedDateTime] [datetime] DEFAULT GETDATE(),
    [RowModifiedSYSUserID] [int] NOT NULL,
    [RowModifiedDateTime] [datetime] DEFAULT GETDATE(),
    PRIMARY KEY (SYSUserRoleID)
)
GO

ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([LOOKUPRoleID])
REFERENCES [dbo].[LOOKUPRole] ([LOOKUPRoleID])
GO

ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO




--Insert Admin user into DB
INSERT INTO SYSUser (LoginName,PasswordEncryptedText, RowCreatedSYSUserID, RowModifiedSYSUserID)  
VALUES ('Admin','Admin',1,1)  
GO  

INSERT INTO SYSUserProfile (SYSUserID,FirstName,LastName,Gender,RowCreatedSYSUserID, RowModifiedSYSUserID)  
VALUES (1,'Vinz','Durano','M',1,1)  
GO  
  
INSERT INTO SYSUserRole (SYSUserID,LOOKUPRoleID,IsActive,RowCreatedSYSUserID, RowModifiedSYSUserID)  
VALUES (1,1,1,1,1) 

