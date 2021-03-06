USE [TEST2]
GO
/****** Object:  Table [dbo].[Materials_In]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials_In](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idNomenklatura] [int] NULL,
	[idSklad] [int] NULL,
	[DateIn] [date] NULL,
	[CountIn] [float] NULL,
 CONSTRAINT [PK_Materials_In] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Materials_Out]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials_Out](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idNomenklatura] [int] NULL,
	[idSklad] [int] NULL,
	[idMOL] [int] NULL,
	[CountOut] [float] NULL,
	[DateOut] [date] NULL,
 CONSTRAINT [PK_Materials_Out] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MOL]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NULL,
	[idSklad] [int] NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
 CONSTRAINT [PK_MOL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nomenklatura]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomenklatura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Nomenklatura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sklad]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sklad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPosition] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Age] [nchar](10) NULL,
	[Pol] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[GetViewSklad]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetViewSklad]
as 
select * from Sklad

GO
ALTER TABLE [dbo].[Materials_Out] ADD  CONSTRAINT [DF_Materials_Out_CountOut]  DEFAULT ((0)) FOR [CountOut]
GO
ALTER TABLE [dbo].[Materials_In]  WITH CHECK ADD  CONSTRAINT [FK_Materials_In_Nomenklatura] FOREIGN KEY([idNomenklatura])
REFERENCES [dbo].[Nomenklatura] ([id])
GO
ALTER TABLE [dbo].[Materials_In] CHECK CONSTRAINT [FK_Materials_In_Nomenklatura]
GO
ALTER TABLE [dbo].[Materials_In]  WITH CHECK ADD  CONSTRAINT [FK_Materials_In_Sklad] FOREIGN KEY([idSklad])
REFERENCES [dbo].[Sklad] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Materials_In] CHECK CONSTRAINT [FK_Materials_In_Sklad]
GO
ALTER TABLE [dbo].[Materials_Out]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Out_MOL] FOREIGN KEY([idMOL])
REFERENCES [dbo].[MOL] ([id])
GO
ALTER TABLE [dbo].[Materials_Out] CHECK CONSTRAINT [FK_Materials_Out_MOL]
GO
ALTER TABLE [dbo].[Materials_Out]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Out_Nomenklatura] FOREIGN KEY([idNomenklatura])
REFERENCES [dbo].[Nomenklatura] ([id])
GO
ALTER TABLE [dbo].[Materials_Out] CHECK CONSTRAINT [FK_Materials_Out_Nomenklatura]
GO
ALTER TABLE [dbo].[Materials_Out]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Out_Sklad] FOREIGN KEY([idSklad])
REFERENCES [dbo].[Sklad] ([id])
GO
ALTER TABLE [dbo].[Materials_Out] CHECK CONSTRAINT [FK_Materials_Out_Sklad]
GO
ALTER TABLE [dbo].[MOL]  WITH CHECK ADD  CONSTRAINT [FK_MOL_Sklad] FOREIGN KEY([idSklad])
REFERENCES [dbo].[Sklad] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MOL] CHECK CONSTRAINT [FK_MOL_Sklad]
GO
ALTER TABLE [dbo].[MOL]  WITH CHECK ADD  CONSTRAINT [FK_MOL_Users1] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[MOL] CHECK CONSTRAINT [FK_MOL_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Positions] FOREIGN KEY([idPosition])
REFERENCES [dbo].[Positions] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Positions]
GO
/****** Object:  StoredProcedure [dbo].[AddPosition]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPosition]
	@Name nvarchar (50)
AS
BEGIN
	insert into Positions (PositionName) values (@Name)
END


GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@MiddleName nvarchar(50),
	@Age int,
	@Pol int,
	@idPosition int
AS
BEGIN
	insert into Users (idPosition, FirstName, LastName, MiddleName, Age, Pol) 
		values (@idPosition, @FirstName, @LastName, @MiddleName, @Age, @Pol)
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllMOL]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllMOL]
			@p int
AS
	
BEGIN

	if (@p=0)
	begin
		select * from Sklad s inner join
		(select u.id 'UserID', m.id 'MOLID', m.idSklad 'SkladID',
			m.dateStart, m.dateEnd,
			u.FirstName, u.LastName, u.MiddleName 
			from Users u inner join MOL m on (u.id=m.idUser)) MOL on (s.id=MOL.SkladID)
	end
	if (@p>0)
	begin
		select * from Sklad s inner join
		(select u.id 'UserID', m.id 'MOLID', m.idSklad 'SkladID',
			m.dateStart, m.dateEnd,
			u.FirstName, u.LastName, u.MiddleName 
			from Users u inner join MOL m on (u.id=m.idUser)) MOL on (s.id=MOL.SkladID and s.id=@p) 
	end


	
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsOstatok]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllProductsOstatok]
	
AS
BEGIN
	--select m_in.idSklad, m_in.idNomenklatura, SUM(m_in.CountIn) 'sum_in', ISNULL(SUM(m_out.CountOut),0) 'sum_out' from Materials_Out m_out 
	--right join Materials_In m_in on (m_in.idSklad=m_out.idSkald) 
	--	group by  m_in.idSklad, m_in.idNomenklatura order by m_in.idSklad

	select AVG(t.idSklad) 'SkladID',t.Name, t.idNomenklatura, SUM(t.CountIn) 'sum_in', ISNULL(SUM(m_out.CountOut),0) 'sum_out' from Materials_Out m_out 
	right join (select n.Name, m_in.idNomenklatura, m_in.idSklad, m_in.CountIn from Nomenklatura n inner join Materials_In m_in on (n.id=m_in.idNomenklatura)) t
	on (t.idSklad=m_out.idSklad) 
		group by t.idNomenklatura, t.Name order by t.Name

END


GO
/****** Object:  StoredProcedure [dbo].[GetBalaceAll]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBalaceAll]
	
AS
BEGIN
	
	select sk.Name 'skName', tovarIn.Name 'NomName',tovarIn.CountIn as 'CountIn', sk.id as 'skID', tovarIn.id as 'NomID'from Sklad sk inner join 
		(select nom.id,nom.Name, matin.idSklad, matin.CountIn from 
			Nomenklatura nom inner join Materials_In matin on nom.id=matin.idNomenklatura) tovarIn on sk.id=tovarIn.idSklad
			order by sk.Name, tovarIn.Name


END


GO
/****** Object:  StoredProcedure [dbo].[Init]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Init]
	
AS
BEGIN

	delete from [dbo].[Materials_In]
	delete from [dbo].[Materials_Out]
	delete from [dbo].[MOL]
	delete from [dbo].[Nomenklatura]
	delete from [dbo].[Users]
	delete from [dbo].[Positions]
	delete from [dbo].[Sklad]

	declare @idMOL as int
	declare @idTmp as int

	insert into Positions (PositionName) values ('Генеральный директор')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Иванов', 'Михаил','Петрович',56, 0, @idTmp)

	insert into Positions (PositionName) values ('Главный инженер')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Сидоров', 'Иван','Петрович',51, 0, @idTmp)

	insert into Positions (PositionName) values ('Начальник отдела по имуществу')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Архипенко', 'Сергей','Михайлович',51, 0, @idTmp)

	insert into Positions (PositionName) values ('Работник склада')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Желнин', 'Владислав','Владиславович',51, 0, @idTmp)

			set @idMOL= SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Петрушов', 'Петр','Николаевич',47, 0, @idTmp)

	insert into Positions (PositionName) values ('Инженер отдела ПТО')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Усманов', 'Сергей','Афанасьевич',45, 0, @idTmp)

	insert into Positions (PositionName) values ('Программист')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Петрушенко', 'Петр','Михайлович',34, 0, @idTmp)
			insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Иванченко', 'Мария','Ивановна',23, 1, @idTmp)

	insert into Positions (PositionName) values ('Уборщик')
		--SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 
		set @idTmp = SCOPE_IDENTITY()
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Алимова', 'Алия','Феестовна',34, 1, @idTmp)
		insert into Users (FirstName, LastName,MiddleName, Age, Pol, idPosition) values 
			('Пелепенко', 'Сергей','Николаевич',22, 0, @idTmp)
			

	declare @idNomenklatura as int
	declare @idSklad1 as int
	declare @idSklad2 as int
	declare @idSklad3 as int

	insert into Sklad (Name, Address) values ('Склад № 1', 'Гагарина 23')
	set @idSklad1 = SCOPE_IDENTITY()
	
	insert into Sklad (Name, Address) values ('Склад № 2', 'Тургенева 105')
	set @idSklad2 = SCOPE_IDENTITY()
	
	insert into Sklad (Name, Address) values ('Склад № 3', 'Шоссе нефтянников 45')	
	set @idSklad3 = SCOPE_IDENTITY()
		--select SCOPE_IDENTITY() AS [SCOPE_IDENTITY]; 

	insert into MOL (idUser, idSklad, dateStart, dateEnd) values (@idMOL,@idSklad2,'','')

	insert into Nomenklatura (Name) values ('Перчатки резиновые')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad1, '03-06-2016', 100)
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad1, '25-06-2016', 30)
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad2, '05-06-2016', 50)
	
	insert into Nomenklatura (Name) values ('Ведро')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad2, '03-06-2016', 70)
	
	insert into Nomenklatura (Name) values ('Клавиатура')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad1, '13-06-2016', 10)
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad3, '22-06-2016', 5)
	
	insert into Nomenklatura (Name) values ('Монитор')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad2, '10-06-2016', 3)
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad3, '12-06-2016', 5)
	
	insert into Nomenklatura (Name) values ('Труба пластик d=25 L=3')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad2, '11-06-2016', 200)
		insert into Materials_Out(idNomenklatura, idSklad, idMOL, DateOut, CountOut) values (@idNomenklatura, @idSklad2, @idMOL,'13-06-2016', 75)

	insert into Nomenklatura (Name) values ('Труба пластик d=50 L=3')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad1, '05-06-2016', 120)

	insert into Nomenklatura (Name) values ('Мышь компьютерная')
		set @idNomenklatura = SCOPE_IDENTITY()
		insert into Materials_In(idNomenklatura, idSklad, DateIn, CountIn) values (@idNomenklatura, @idSklad1, '14-06-2016', 10)


END


GO
/****** Object:  StoredProcedure [dbo].[proc_MaterialsIn]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_MaterialsIn]
	@idSkald int,
	@idNomenklatura int,
	@DateIn date,
	@CountIn float
AS
BEGIN
	insert into Materials_In (idSklad, idNomenklatura, DateIn, CountIn) values (@idSkald, @idNomenklatura, @DateIn, @CountIn)
END


GO
/****** Object:  StoredProcedure [dbo].[proc_MaterialsOut]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_MaterialsOut]
	@idSkald int,
	@idNomenklatura int,
	@idMOL int,
	@DateIn date,
	@CountIn float
AS
BEGIN
	insert into Materials_Out (idSklad, idNomenklatura, idMOL, DateOut, CountOut) values (@idSkald, @idNomenklatura, @idMOL, @DateIn, @CountIn)
END


GO
/****** Object:  StoredProcedure [dbo].[ProductsOstatokOnSklads]    Script Date: 13.07.2016 17:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductsOstatokOnSklads]
	@p int

AS
BEGIN
	select t.idSklad 'SkladID', t.Name, t.idNomenklatura, SUM(t.CountIn) 'sum_in', ISNULL(SUM(m_out.CountOut),0) 'sum_out' from Materials_Out m_out 
	right join (select n.Name, m_in.idNomenklatura, m_in.idSklad, m_in.CountIn from Nomenklatura n inner join Materials_In m_in on (n.id=m_in.idNomenklatura)) t
	on (t.idSklad=m_out.idSklad) where @p=t.idSklad
		group by  t.idSklad, t.idNomenklatura, t.Name order by t.idSklad
END


GO
