use [Database?]
go

/*
** Reference for futher information: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16
*/

CREATE TABLE [Schema?].[Tablename?](
[primary key?] [data type?] not null,
[Field?] [data type?] [nullable?],
[Field?] [data type?] [nullable?],
[Field?] [data type?] [nullable?],
[Field?] [data type?] [nullable?],
[CreatedDateTime] [datetime2](0) NOT NULL,
[ModifiedDateTime] [datetime2](0) NOT NULL,
CONSTRAINT [PK_Schema_TableName_FieldNameOfPrimaryKey?] PRIMARY KEY CLUSTERED
(
	[FieldNameOfPrimaryKey?] asc
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Schema?].[Tablename?] ADD  CONSTRAINT [DF_Schema?_TableName?_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO

ALTER TABLE [Schema?].[Tablename?] ADD  CONSTRAINT [DF_Schema?_TableName?_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDateTime]
GO

ALTER TABLE [Schema?].[Tablename?]  WITH NOCHECK ADD  CONSTRAINT [FK_Schema?_TableName?_ForeignKeyFieldName?] FOREIGN KEY([ForeignKeyFieldName?])
REFERENCES [Schema?].[TableNameReferenced?] ([ReferencedPrimaryKey?])
GO

ALTER TABLE [Schema?].[Tablename?] CHECK CONSTRAINT [FK_TableName?_ForeignKeyFieldName?]
GO

CREATE TRIGGER [Schema?].[trg_Upadate_Schema?_Tablename?_ModifiedDate] ON [Schema?].[Tablename?]
AFTER UPDATE
AS
BEGIN
	UPDATE [Schema?].[Tablename?]
	SET ModifiedDate = Utils.GetCurrentDateTime()
	FROM [Schema?].[Tablename?] pc
	INNER JOIN inserted i 
	        ON pc.[PrimaryKey?] = i.[PrimaryKey?]
END

GO

