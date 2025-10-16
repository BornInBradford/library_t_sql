USE [SomeSuchDatabaseName]
GO

/****** Object:  Template based on table [Biobank].[Sample]    Script Date: 29/12/2023 15:59:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Schema].[Table](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[IntegerField] [int] NULL,
	[TextField] [varchar](50) NULL,	
	[TextField2] [char](9) NULL,
	[Decimal] [decimal](6, 3) NULL,
	[DateField] [date] NULL,
	[TimeField] [time](7) NULL,
	[DateTimeField] [datetime2] (0)	NULL,
	[NotesField] [varchar](4000) NULL,
	[BitField] [bit] NOT NULL,
 CONSTRAINT [PK_Schema_Table_PrimaryKeyID] PRIMARY KEY CLUSTERED 
(
	[PrimaryKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY],
-- this additional constraint is to add a unique index on two fields to ensure a unique combination (i.e. a unique constraint involving two fields that are not a private key)
 CONSTRAINT [AK_schema_table_x_id_and_y_id] UNIQUE NONCLUSTERED 
(
	[x_id] ASC,
	[y_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Schema].[Table] ADD  CONSTRAINT [DF_Schema_Table_FieldWithDefault]  DEFAULT ((0)) FOR [FieldWithDefault]
GO

ALTER TABLE [Schema].[Table] WITH CHECK ADD  CONSTRAINT [FK_Schema_Table_SomeOtherID] FOREIGN KEY([DerivedFrom])
REFERENCES [Schema].[Table] ([SampleID])
GO

ALTER TABLE [Schema].[Table] CHECK CONSTRAINT [FK_Schema_Table_SomeOtherID]
GO

ALTER TABLE [Schema].[Table]  WITH CHECK ADD  CONSTRAINT [FK_Schema_Table_PrimaryKeyTable_PrimaryKey] FOREIGN KEY([SampleType])
REFERENCES [Schema].[PrimaryKeyTable] ([EntityTypeID])
ON UPDATE CASCADE
GO

ALTER TABLE [Schema].[Table] CHECK CONSTRAINT [FK_Schema_Table_PrimaryKeyTable_PrimaryKey]
GO

-- Add a queryable note about the table 
EXEC sp_addextendedproperty @name = N'<name of extended property>', -- ADD THE NAME OF THE PROPERTY - E.G. A TAG like 'Table data source'
							@value = 'ADD HERE THE INFORMATION YOU WANT TO STORE AGAINST THE OBJECT - I.E. THE SOURCE OF THE DATA, THE PURPOSE OF THE OBJECT ETC.',
							@level0type = 'SCHEMA', @level0name = N'<schema name>',  -- SPECIFY THE SCHEMA NAME
							@level1type = 'TABLE', @level1name = N'DfE_School_Census_Ethnicity_Codes' -- SPECIFY THE TABLE NAME

-- add a queryable note about a field
EXEC sys.sp_addextendedproperty @name=N'MS_Description', 
								@value=N'This ID will be derived from a project type code entered on the reference.look_up_codes table' , 
								@level0type=N'SCHEMA',
								@level0name=N'project', 
								@level1type=N'TABLE',
								@level1name=N'project', 
								@level2type=N'COLUMN',
								@level2name=N'project_type_id'
								GO

GO




