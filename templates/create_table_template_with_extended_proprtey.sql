USE [SomeSuchDatabaseName]
GO

/****** Object:  Template based on table [Biobank].[Sample]    Script Date: 29/12/2023 15:59:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [schema].[table](
	[entity_id] [int] IDENTITY(1,1) NOT NULL,
	[integer_field] [int] NULL,
	[text_field] [varchar](50) NULL,	
	[text_field_2] [char](9) NULL,
	[decimal] [decimal](6, 3) NULL,
	[date_field] [date] NULL,
	[time_field] [time](7) NULL,
	[date_time_field] [datetime2] (0)	NULL,
	[notes_field] [varchar](4000) NULL,
	[bit_field] [bit] NOT NULL,
 CONSTRAINT [PK_Schema_Table_PrimaryKeyID] PRIMARY KEY CLUSTERED 
(
	[primary_key_field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Schema].[Table] ADD  CONSTRAINT [DF_Schema_Table_FieldWithDefault]  DEFAULT ((0)) FOR [field_name]
GO

ALTER TABLE [schema].[table] WITH CHECK ADD  CONSTRAINT [FK_Schema_Table_field_name] FOREIGN KEY([field_name])
REFERENCES [schema].[table] ([field_name])
GO

ALTER TABLE [schema].[table] CHECK CONSTRAINT [FK_schema_table_field_name]
GO

ALTER TABLE [schema].[table]  WITH CHECK ADD  CONSTRAINT [FK_schema_table_field_name] FOREIGN KEY([SampleType])
REFERENCES [schema].[primary_key_table_name] ([field_name])
ON UPDATE CASCADE
GO

ALTER TABLE [schema].[table] CHECK CONSTRAINT [FK_schema_table_field_name]
GO

-- Add a queryable reference note to the table 
EXEC sp_addextendedproperty @name = N'<name of extended property>', -- ADD THE NAME OF THE PROPERTY - E.G. A TAG like 'Table data source'
							@value = 'ADD HERE THE INFORMATION YOU WANT TO STORE AGAINST THE OBJECT - I.E. THE SOURCE OF THE DATA, THE PURPOSE OF THE OBJECT ETC.',
							@level0type = 'SCHEMA', @level0name = N'<schema name>',  -- SPECIFY THE SCHEMA NAME
							@level1type = 'TABLE', @level1name = N'<table_name>' -- SPECIFY THE TABLE NAME


