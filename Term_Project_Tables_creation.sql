USE [master]
GO
/****** Object:  Database [TermProject]    Script Date: 12/2/2014 5:02:18 PM ******/
CREATE DATABASE [TermProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TermProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TermProject.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TermProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TermProject_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TermProject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TermProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TermProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TermProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TermProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TermProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TermProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [TermProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TermProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TermProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TermProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TermProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TermProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TermProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TermProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TermProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TermProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TermProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TermProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TermProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TermProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TermProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TermProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TermProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TermProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TermProject] SET  MULTI_USER 
GO
ALTER DATABASE [TermProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TermProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TermProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TermProject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TermProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TermProject', N'ON'
GO
USE [TermProject]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[UserName] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NULL,
	[StreetName] [nvarchar](50) NULL,
	[StreetType] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](9) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerEmail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerEmail](
	[CustomerEmailID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmailType] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceDate] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[InvoiceDetailID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[InvoiceID] [int] NOT NULL,
	[PaymentAmount] [money] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentReference] [nvarchar](20) NOT NULL,
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Payment__9B556A58C91FE496] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductName] [nvarchar](25) NOT NULL,
	[ProductDescription] [nvarchar](250) NOT NULL,
	[SKU] [nvarchar](12) NOT NULL,
	[Price] [money] NOT NULL,
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[QuantityOnHand] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderDate] [datetime] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierName] [nvarchar](120) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NULL,
	[StreetName] [nvarchar](50) NULL,
	[StreetType] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](9) NULL,
	[HomeEmail] [nvarchar](50) NULL,
	[WorkEmail] [nvarchar](50) NULL,
	[OtherEmail] [nvarchar](50) NULL,
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierEmail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierEmail](
	[SupplierEmailID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[EmailType] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CustomerEmail]  WITH CHECK ADD  CONSTRAINT [FK_CustomerEmail_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerEmail] CHECK CONSTRAINT [FK_CustomerEmail_Customer]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Invoice] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Customer_Invoice]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Product]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Payment] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Invoice_Payment]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_Product]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrder]
GO
ALTER TABLE [dbo].[SupplierEmail]  WITH CHECK ADD  CONSTRAINT [FK_SupplierEmail_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierEmail] CHECK CONSTRAINT [FK_SupplierEmail_Supplier]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---
---Customer Requirements
---
CREATE PROCEDURE [dbo].[AddCustomer]
/*
Procedure Description:	Allows the creation of a customer with the minimum required data
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
	@UserName nvarchar(25),		--A screen name for the customer
	@FirstName nvarchar(25),
	@LastName nvarchar(50),
	@Password nvarchar(20),
	@CustomerID int  OUTPUT	--An output of the CustomerID created
AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
		BEGIN TRAN
			Insert Into Customer(UserName, FirstName, LastName, Password)
				values (@UserName, @FirstName, @LastName, @Password)
			SELECT @CustomerID = SCOPE_IDENTITY()
			set @Return = 0
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK
		Set @Return = -1
	END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddCustomerExtended]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddCustomerExtended]
/*
Procedure Description:	Allows the creation of a customer with the all required and optional data
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
 	@UserName nvarchar(25),		--A screen name for the customer
	@FirstName nvarchar(25), 
	@LastName nvarchar(50), 
	@StreetNumber int = null,			--Optional
	@StreetName nvarchar(50) = null,	--Optional
	@StreetType nvarchar(20) = null,	--Optional, Eg. Crescent, Street, etc
	@City nvarchar(50) = null,			--Optional
	@Province nvarchar(50) = null,		--Optional
	@Country nvarchar(50) = null,		--Optional
	@PostalCode nvarchar(9) = null,		--Optional, supporting Postal and ZipCodes, including Zip+4 add on codes 
	@HomeEmail nvarchar(50) = null,		--Optional
	@WorkEmail nvarchar(50) = null,		--Optional
	@OtherEmail nvarchar(50) = null,	--Optional
	@Password nvarchar(20),
	@CustomerID int  OUTPUT	--An output of the CustomerID created

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
		BEGIN TRAN
			Insert Into Customer(UserName, FirstName, LastName,StreetNumber, StreetName, StreetType, City, Province, Country, PostalCode, Password)
				values (@UserName, @FirstName, @LastName,@StreetNumber, @StreetName, @StreetType, @City, @Province, @Country, @PostalCode, @Password)
			SELECT @CustomerID = SCOPE_IDENTITY()
			IF @HomeEmail is not null
			BEGIN	
				Insert Into CustomerEmail(CustomerID, Email, EmailType)
				values (@CustomerID, @HomeEmail, 'Home')
			END

			IF @WorkEmail is not null
			BEGIN	
				Insert Into CustomerEmail(CustomerID, Email, EmailType)
				values (@CustomerID, @WorkEmail, 'Work')
			END

			IF @OtherEmail is not null
			BEGIN	
				Insert Into CustomerEmail(CustomerID, Email, EmailType)
				values (@CustomerID, @OtherEmail, 'Other')
			END

			set @Return = 0
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK
		Set @Return = -1
	END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddInvoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- 
---Invoice Requirements
---
CREATE PROCEDURE [dbo].[AddInvoice]
/*
Procedure Description:	Add the basic header information for an invoice
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
 	@InvoiceDate datetime,	
	@CustomerID int,		--The customer for the invoice
	@InvoiceID int OUTPUT --The InvoiceID for the created invoice

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddInvoiceDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddInvoiceDetail]
/*
Procedure Description:	Add a line item to the invoice.  Each invoice can have any number of InvoiceDetails.  Each invoice can only list a particular product once, multiple invoice details for a product are not allowed.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
 	@InvoiceID int,					--The invoice to associate the invoice detail line item with
	@ProductID int,					--The product being purchased
	@Quantity int,					--The number of products being purchased
	@InvoiceDetailID int OUTPUT		--The ID for the line item just created

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddPayment]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- 
---Payment Requirements
---
CREATE PROCEDURE [dbo].[AddPayment]
/*
Procedure Description:	Adds a new Payment to an Invoice.  Note that multiple payments to an invoice are allowed.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
	@InvoiceID int,  --The invoice to apply the payment to
	@PaymentAmount money,	--The amount paid
	@PaymentDate datetime,	--The date of the payment
	@PaymentReference nvarchar(20), --A reference for the payment, could be a Cheque number, credit card type, PayPal reference, etc
	@PaymentID int  OUTPUT --The ID of the Payment just added

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
/*
Procedure Description:	Adds a new product to the system
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
	@ProductName nvarchar(25),
	@ProductDescription nvarchar(250),
	@SKU nvarchar(12),
	@Price money,
	@ProductID int OUTPUT	--The ID of the product just added

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				INSERT INTO Product(ProductName, ProductDescription, SKU, Price)
				VALUES (@ProductName, @ProductDescription, @SKU, @Price)
				SELECT @ProductID = SCOPE_IDENTITY()
				SET @Return = 0	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddPurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---
---Purchase Order Requirements
---
CREATE PROCEDURE [dbo].[AddPurchaseOrder]
/*
Procedure Description:	Add the basic header information for a PurchaseOrder
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderDate datetime,
	@SupplierID int,				--The supplier for the PurchaseOrder
	@PurchaseOrderID int  OUTPUT	--The PurchaseOrderID for the created PurchaseOrder

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddPurchaseOrderDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddPurchaseOrderDetail]
/*
Procedure Description:	Add a line item to the PurchaseOrder.  Each PurchaseOrder can have any number of PurchaseOrderDetails.  Each PurchaseOrder can only list a particular product once, multiple PurchaseOrder details for a product are not allowed.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
 	@PurchaseOrderID int,	--The PurchaseOrder to associate the PurchaseOrder detail line item with
	@ProductID int,			--The product being purchased
	@Quantity int,			--The number of products being purchased
	@PurchaseOrderDetailID int  OUTPUT --The ID for the line item just created


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[AddSupplier]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- 
---Supplier Requirements
---
CREATE PROCEDURE [dbo].[AddSupplier]
/*
Procedure Description:	Allows the creation of a Supplier with the all required and optional data
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@SupplierName nvarchar(120),--Company name of the Supplier
	@FirstName nvarchar(25),	--Contact first name for the supplier
	@LastName nvarchar(50),		--Contact last name for the supplier
	@StreetNumber int = null,			--Optional
	@StreetName nvarchar(50) = null,	--Optional
	@StreetType nvarchar(20) = null,	--Optional, Eg. Crescent, Street, etc
	@City nvarchar(50) = null,			--Optional
	@Province nvarchar(50) = null,		--Optional
	@Country nvarchar(50) = null,		--Optional
	@PostalCode nvarchar(9) = null,		--Optional, supporting Postal and ZipCodes, including Zip+4 add on codes 
	@HomeEmail nvarchar(50) = null,		--Optional
	@WorkEmail nvarchar(50) = null,		--Optional
	@OtherEmail nvarchar(50) = null,	--Optional
	@SupplierID int  OUTPUT	--An output of the SupplierID created

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ChangePassword]
/*
Procedure Description:	Allows an existing customer to change their password if the current password is correct, and NewPassword1 is equal to newPassword2
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@CustomerID int,				--The customer to update
	@CurrentPassword nvarchar(20),	--The current password
	@NewPassword1 nvarchar(20),		--The first attempt for the new password
	@NewPassword2 nvarchar(20)		--The second attempt for the new password

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				declare @passoword nvarchar(20)
				select @passoword = Password from Customer where CustomerID = @CustomerID 
				IF @NewPassword1 <> @NewPassword2 or @passoword <> @CurrentPassword
				BEGIN
					Set @Return = -1
				END 
				ELSE
				BEGIN
					update Customer set Password = @NewPassword1 where CustomerID = @CustomerID
				END
				Set @Return = 0
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[CommitInvoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CommitInvoice]
/*
Procedure Description:	Locks the invoice so that it can no longer be edited, and subtracts the updates the QuantityOnHand for each Product included on the invoice details for the particular invoice.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@InvoiceID int		--The invoice to commit


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[CommitPurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CommitPurchaseOrder]
/*
Procedure Description:	Locks the PurchaseOrder so that it can no longer be edited, and subtracts the updates the QuantityOnHand for each Product included on the PurchaseOrder details for the particular PurchaseOrder.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderID int  --The PurchaseOrder to commit

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAllData]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---
---Miscellaneous Requirements
---
CREATE PROCEDURE [dbo].[DeleteAllData]
/*
Procedure Description:	Deletes all data from the database.  Note that the order of deletion must deal with any relationships.  EG. all customers cannot be deleted until all Invoices are deleted.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteCustomer]
/*
Procedure Description:	Allows an existing customer to be deleted if they have no Invoices for them
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@CustomerID int	--The customer to delete

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				declare @count int = 0
				select @count = count(InvoiceID) from Invoice where CustomerID = @CustomerID
				IF @count = 0
				BEGIN
					delete from Customer where CustomerID = @CustomerID;
					delete from CustomerEmail where CustomerID = @CustomerID;
				END
				SET  @Return = 0
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteInvoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteInvoice]
/*
Procedure Description:	Allows an existing invoice to be deleted only if it has not been committed
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@InvoiceID int  --The invoice to delete

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeletePayment]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeletePayment]
/*
Procedure Description:	Allows an existing Payment to be deleted
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PaymentID int  --	The Payment to delete

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteProduct]
/*
Procedure Description:	Allows an existing product to be deleted if there are no Invoices for it
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@ProductID int		--The product to delete

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				DELETE FROM Product
				WHERE ProductID = @ProductID	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeletePurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeletePurchaseOrder]
/*
Procedure Description:	Allows an existing PurchaseOrder to be deleted only if it has not been committed
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderID int	 --The PurchaseOrder to delete


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteSupplier]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteSupplier]
/*
Procedure Description:	Allows an existing Supplier to be deleted if they have no Purchase Orders for them
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@SupplierID int		--The Supplier to delete

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCustomerByID]
/*
Procedure Descriptio:	Allows existing customer information to be retrieved
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
 	@CustomerID int,					--The customer to retrieve
	@UserName nvarchar(25)  OUTPUT,		--The value for record
	@FirstName nvarchar(25)  OUTPUT,	--The value for record
	@LastName nvarchar(50)  OUTPUT,		--The value for record
	@StreetNumber int  OUTPUT,			--The value for record
	@StreetName nvarchar(50)  OUTPUT,	--The value for record
	@StreetType nvarchar(20)  OUTPUT,	--The value for record
	@City nvarchar(50)  OUTPUT,			--The value for record
	@Province nvarchar(50)  OUTPUT,		--The value for record
	@Country nvarchar(50)  OUTPUT,		--The value for record
	@PostalCode nvarchar(9)  OUTPUT,	--The value for record
	@HomeEmail nvarchar(50)  OUTPUT,	--The value for record
	@WorkEmail nvarchar(50)  OUTPUT,	--The value for record
	@OtherEmail nvarchar(50)  OUTPUT	--The value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
		BEGIN TRAN
			select @UserName = UserName, @FirstName=FirstName, @LastName=LastName, @StreetNumber=StreetNumber, @StreetName=StreetName, @StreetType=StreetType,
			@City=City, @Province=Province, @Country=Country, @PostalCode=PostalCode
			from Customer where CustomerID = @CustomerID

			select @HomeEmail = Email from CustomerEmail where EmailType = 'Home' and CustomerID = @CustomerID
			select @WorkEmail = Email from CustomerEmail where EmailType = 'Work' and CustomerID = @CustomerID
			select @OtherEmail = Email from CustomerEmail where EmailType = 'Other' and CustomerID = @CustomerID
			set @Return = 0
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK
		Set @Return = -1
	END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCustomerList]
/*
Procedure Description:	Get a list of customers based on a set of criteria, where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic customer information in a format to put in a grid
	CustomerID	
	UserName
	CustomerName	A combination of FirstName and LastName with appropriate spaces
	Address			A combination of all of the address fields together with appropriate 
					spaces and commas, including:
					StreetNumber
					StreetName
					StreetType
					City
					Province
					Country
					PostalCode
*/	
	@SearchFirstName nvarchar(25) = null,	--Search criteria, parameter default should be NULL or empty string
	@SearchLastName nvarchar(50) = null,	--Search criteria, parameter default should be NULL or empty string
	@SearchCity nvarchar(50) = null,		--Search criteria, parameter default should be NULL or empty string
	@SearchProvince nvarchar(50) = null,	--Search criteria, parameter default should be NULL or empty string
	@SearchCountry nvarchar(50) = null	--Search criteria, parameter default should be NULL or empty string

/* HINT:for the WHERE condition you will want something like the following that checks the optional to see if they are filled in:
WHERE (@SearchFirstName is null or FirstName like ‘%’ + @SearchFirstName + ‘%’), --
	@AND (@SearchLastName is null or LastName like ‘%’ + @SearchLastName + ‘%’), --
	@AND …

This assumes you set the default value for the parameter as @SearchFirstName nvarchar(25), -- = NULL, as well as all the other search criteria.  
If you use a default of empty string, @FirstName nvarchar(25), -- = ‘’, then you will need to modify accordingly.
*/


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				select CustomerID, UserName, CONCAT(FirstName, ' ', LastName) AS CustomerName, CONCAT(StreetNumber, ' ' + StreetName, ' ', StreetType, ', ', City, ', ', Province, ', ', Country, ' ', PostalCode) AS Address from Customer
				where (@SearchFirstName is null or FirstName like '%' + @SearchFirstName + '%') and (@SearchLastName is null or LastName like '%' + @SearchLastName + '%')
				and (@SearchCity is null or City like '%' + @SearchCity + '%') and (@SearchProvince is null or Province like '%' + @SearchProvince + '%')
				and (@SearchCountry is null or Country like '%' + @SearchCountry + '%')
				set @Return = 0
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetInvoiceByID]
/*
Procedure Description:	Get the basic header information for an existing invoice
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@InvoiceID int,					--The invoice to get
	@InvoiceDate datetime OUTPUT,	--The value for the record
	@CustomerID int  OUTPUT		--The value for the record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceDetailByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetInvoiceDetailByID]
/*
Procedure Description:	Get the information about a particular Invoice Detail
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@InvoiceDetailID int,	--The invoice detail line item to get
	@ProductID int  OUTPUT,	--The value for the record
	@Quantity int  OUTPUT	--The value for the record


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceDetailList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetInvoiceDetailList]
/*
Procedure Description	:Get a list of invoice detail information for a particular invoice
Return Valu				0 for success
						-1 for any error
Dataset Returned		Yes
	InvoiceDetailID		The invoice detail line item ID
	InvoiceID			The invoice the detail belongs to
	ProductName			The product being purchased
	Quantity			The number of products being purchased
 */	
	@SearchInvoiceID int  --Criteria to indicate the InvoiceID to return all invoice detail for

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetInvoiceList]
/*
Procedure Description:	Get a list of invoices based on a set of criteria, where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes 	@Returns basic invoice information in a format to put in a grid	 
	InvoiceID,
	InvoiceDate,
	Customer		--A combination of FirstName and LastName with appropriate spaces
	InvoiceAmount	--The total amount of the invoice
	PaymentAmoun	--The total of payments for the invoice
	AmountOwing		--The amount still owing for the invoice
*/
	@SearchInvoiceID int,  -- 	@Search criteria, parameter default should be NULL or empty string
	@SearchCustomerID int  --	@Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetPaymentByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPaymentByID]
/*
Procedure Description:	Returns information about a specific Payment in the system
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PaymentID int,  --The ID of the Payment to return
	@InvoiceID int  OUTPUT, --The value for record
	@PaymentAmount money OUTPUT,	--The value for record
	@PaymentDate datetime OUTPUT,	---The value for record
	@PaymentReference nvarchar(20)  OUTPUT --	The value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetPaymentList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPaymentList]
/*
Procedure Description:	Get a list of Payments based on a set of criteria, 
						where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic Payment information in a format to put in a grid
	PaymentID	
	InvoiceID	
	PaymentAmount	
	PaymentDate	
	PaymentReference	
*/
	@SearchInvoiceID int,			--Search criteria, parameter default should be NULL or empty string
	@SearchPaymentDate datetime		--Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.
 

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetProductBackOrderList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetProductBackOrderList]
/*
Procedure Description:	Get a list of products that have a negative quantity, indicating that more products have been sold than actually exist in the store.
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic product information in a format to put in a grid
	ProductID
	ProductName
	QuantityOnHand
*/
--no parameters

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetProductByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetProductByID]
/*
Procedure Description:	Returns information about a specific product in the system
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
	@ProductID int,								--The ID of the product to return
	@ProductName nvarchar(25)  OUTPUT,			--The value for record
	@ProductDescription nvarchar(250)  OUTPUT,	--The value for record
	@SKU nvarchar(12)  OUTPUT,					--The value for record
	@Price money OUTPUT							--The value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				SELECT ProductID, ProductName, ProductDescription, SKU, Price
				FROM Product
				WHERE ProductID = @ProductID	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetProductList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetProductList]
/*
Procedure Description:	Get a list of products based on a set of criteria, where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic product information in a format to put in a grid
	ProductID
	ProductName
	SKU
	ProductDescription
	Price
 */	
	@SearchProductName nvarchar(25),		--Search criteria, parameter default should be NULL or empty string
	@SearchProductDescription nvarchar(250)	--Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				SELECT ProductID, ProductName, ProductDescription, SKU, Price
				FROM Product
				WHERE (@SearchProductName IS NULL OR ProductName LIKE '%' + @SearchProductName + '%')
					AND (@SearchProductDescription IS NULL OR ProductDescription LIKE '%' + @SearchProductDescription + '%')	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrderByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPurchaseOrderByID]
/*
Procedure Description:	Get the basic header information for an existing PurchaseOrder
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderID int,  --The PurchaseOrder to get
	@PurchaseOrderDate datetime OUTPUT,	--The value for the record
	@SupplierID int  OUTPUT --The value for the record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrderDetailByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPurchaseOrderDetailByID]
/*
Procedure Description:	Get the information about a particular PurchaseOrder Detail
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
 	@PurchaseOrderDetailID int,		--The PurchaseOrder detail line item to get
	@ProductID int  OUTPUT,			--The value for the record
	@Quantity int  OUTPUT			--The value for the record


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetPurchaseOrderList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPurchaseOrderList]
/*
Procedure Description:	Get a list of PurchaseOrders based on a set of criteria, where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic PurchaseOrder information in a format to put in a grid

	PurchaseOrderID
	PurchaseOrderDate
	SupplierName
	PurchaseOrderAmount			--The total amount of the PurchaseOrder
	PaymentAmount				--The total of payments for the PurchaseOrder
	AmountOwing					--The amount still owing for the PurchaseOrder
*/
	@SearchPurchaseOrderID int,	--Search criteria, parameter default should be NULL or empty string
	@SearchSupplierID int		--Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetSupplierByID]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetSupplierByID]
/*
Procedure Description:	Allows an existing Supplier data to be retrieved
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@SupplierID int,					--The Supplier to retrieve
	@SupplierName nvarchar(120)  OUTPUT,--The value for record
	@FirstName nvarchar(25)  OUTPUT,	--The value for record
	@LastName nvarchar(50)  OUTPUT,		--The value for record
	@StreetNumber int  OUTPUT,			--The value for record
	@StreetName nvarchar(50)  OUTPUT,	--The value for record
	@StreetType nvarchar(20)  OUTPUT,	--The value for record
	@City nvarchar(50)  OUTPUT,			--The value for record
	@Province nvarchar(50)  OUTPUT,		--The value for record
	@Country nvarchar(50)  OUTPUT,		--The value for record
	@PostalCode nvarchar(9)  OUTPUT,	--The value for record
	@HomeEmail nvarchar(50)  OUTPUT,	--The value for record
	@WorkEmail nvarchar(50)  OUTPUT,	--The value for record
	@OtherEmail nvarchar(50)  OUTPUT	--The value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetSupplierList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetSupplierList]
/*
Procedure Description:	Get a list of Suppliers based on a set of criteria, where all of the search criteria must be satisfied
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic Supplier information in a format to put in a grid
	SupplierID
	UserName
	SupplierName	--A combination of FirstName and LastName with appropriate spaces
	Address			--A combination of all of the address fields together with appropriate spaces and commas, including:
						StreetNumber
						StreetName
						StreetType
						City
						Province
						Country
						PostalCode
 */	
	@SearchSupplierName nvarchar(25),	--Search criteria, parameter default should be NULL or empty string
	@SearchCity nvarchar(50),			--Search criteria, parameter default should be NULL or empty string
	@SearchProvince nvarchar(50),		--Search criteria, parameter default should be NULL or empty string
	@SearchCountry nvarchar(50)			--Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetUnpaidInvoiceList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetUnpaidInvoiceList]
/*
Procedure Description:	Get a list of invoices based on a set of criteria, where all of the search criteria must be satisfied AND the amount owing is greater than $0
Return Value			0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic invoice information in a format to put in a grid
 	InvoiceID
	InvoiceDate
	Customer		--combination of FirstName and LastName with appropriate spaces
	InvoiceAmount	--The total amount of the invoice
	PaymentAmount	--The total of payments for the invoice
	AmountOwing		--The amount still owing for the invoice
*/
	@SearchCustomerID int  --Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[GetUnpaidPurchaseOrderList]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetUnpaidPurchaseOrderList]
/*
Procedure Description:	Get a list of PurchaseOrders based on a set of criteria, where all of the search criteria must be satisfied AND the amount owing is greater than $0
Return Valu				0 for success
						-1 for any error
Dataset Returned		Yes		Returns basic PurchaseOrder information in a format to put in a grid
	PurchaseOrderID	
	PurchaseOrderDate	
	SupplierName	
	PurchaseOrderAmount	--The total amount of the PurchaseOrder
	PaymentAmount		--The total of payments for the PurchaseOrder
	AmountOwing			--The amount still owing for the PurchaseOrder
*/	
	 @SearchSupplierID int  --	@Search criteria, parameter default should be NULL or empty string
--HINT: see hint for GetCustomerList.


AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[ReturnInvoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ReturnInvoice]
/*
Procedure Description:	Creates a new invoice based on an existing committed invoice. 
						The invoice date should be the current date, and all other information
						 from the Invoice and InvoiceDetail should be the same except:
						•	that all the quantities should be negative, indicating that the product(s), -- have been returned
						•	the newly created invoice should not be committed, so that it is still available to edit
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@ReturnInvoiceID int,  --The InvoiceID of the invoice to return
	@NewInvoiceID int  OUTPUT --The InvoiceID of the newly created invoice

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[ReturnPurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ReturnPurchaseOrder]
/*
Procedure Description:	Creates a new PurchaseOrder based on an existing committed PurchaseOrder.
						The PurchaseOrder date should be the current date, and all other information 
						from the PurchaseOrder and PurchaseOrderDetail should be the same except:
						•	that all the quantities should be negative, indicating that the product(s) have been returned
						•	the newly created PurchaseOrder should not be committed, so that it is still available to edit
Return Value			0 for success
						-1 for any error
Dataset Returned		NO
 */	
	@ReturnPurchaseOrderID int,  --The PurchaseOrderID of the PurchaseOrder to return
	@NewPurchaseOrderID int  OUTPUT --The PurchaseOrderID of the newly created PurchaseOrder

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateCustomer]
/*
Procedure Description:	Allows an existing customer to be updated
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/
	@CustomerID int,			--The customer to update
	@UserName nvarchar(25),		--New value for record
	@FirstName nvarchar(25),	--New value for record
	@LastName nvarchar(50),		--New value for record
	@StreetNumber int,			--New value for record
	@StreetName nvarchar(50),	--New value for record
	@StreetType nvarchar(20),	--New value for record
	@City nvarchar(50),			--New value for record
	@Province nvarchar(50),		--New value for record
	@Country nvarchar(50),		--New value for record
	@PostalCode nvarchar(9),	--New value for record
	@HomeEmail nvarchar(50),	--New value for record
	@WorkEmail nvarchar(50),	--New value for record
	@OtherEmail nvarchar(50)	--New value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				update Customer
				set UserName = @UserName, FirstName = @FirstName, LastName = @LastName, StreetNumber = @StreetNumber, StreetName = @StreetName, StreetType = @StreetType, City = @City,
				Province = @Province, Country = @Country, PostalCode = @PostalCode where CustomerID = @CustomerID;

				update CustomerEmail set Email = @HomeEmail where CustomerID = @CustomerID and EmailType = 'Home';
				update CustomerEmail set Email = @WorkEmail where CustomerID = @CustomerID and EmailType = 'Work';
				update CustomerEmail set Email = @OtherEmail where CustomerID = @CustomerID and EmailType = 'Other';

			set @Return = 0
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateInvoice]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateInvoice]
/*
Procedure Description:	Update the basic header information for an existing invoice
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
 	@InvoiceID int,			--	The invoice to update
	@InvoiceDate datetime,
	@CustomerID int		--The customer for the invoice

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateInvoiceDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateInvoiceDetail]
/*
Procedure Description:	Update an existing line item to the invoice.  Each invoice can have any number of InvoiceDetails.  Each invoice can only list a particular product once, multiple invoice details for a product are not allowed.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@InvoiceDetailID int,	--The invoice detail line item to update
	@ProductID int,			--The product being purchased
	@Quantity int			--The number of products being purchased

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePayment]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdatePayment]
/*
Procedure Description:	Updates an existing Payment in the system
Return Value		0 for success
					-1 for any error
Dataset Returned	No
 */	
	@PaymentID int,  --	The ID of the Payment to edit
	@InvoiceID int, 
	@PaymentAmount money,	
	@PaymentDate datetime,	
	@PaymentReference nvarchar(20)

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePurchaseOrder]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdatePurchaseOrder]
/*
Procedure Description:	Update the basic header information for an existing PurchaseOrder
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderID int,		--The PurchaseOrder to update
	@PurchaseOrderDate datetime,
	@SupplierID int			--The supplier for the PurchaseOrder

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePurchaseOrderDetail]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdatePurchaseOrderDetail]
/*
Procedure Description:	Update an existing line item to the PurchaseOrder.  Each PurchaseOrder can have any number of PurchaseOrderDetails.  Each PurchaseOrder can only list a particular product once, multiple PurchaseOrder details for a product are not allowed.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */	
	@PurchaseOrderDetailID int, --The PurchaseOrder detail line item to update
	@ProductID int,				--The product being purchased
	@Quantity int				--The number of products being purchased

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateQuantityOnHand]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateQuantityOnHand]
/*
Procedure Description:	Updates an existing product in the system to manually override the quantity of products available.  This could happen from a manual inventory count, where the actual inventory does not match the inventory that the system indicates there should be.
Return Value			0 for success
						-1 for any error
Dataset Returned		No
 */
 	@ProductID int,		--The ID of the product to edit
	@QuantityOnHand int,--The new value for the row
	@Price money

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
						
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplier]    Script Date: 12/2/2014 5:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateSupplier]
/*
Procedure Description:	Allows an existing Supplier to be updated
Return Value			0 for success
						-1 for any error
Dataset Returned		No
*/	
	@SupplierID int,			--The Supplier to update
	@SupplierName nvarchar(120),--New value for record
	@FirstName nvarchar(25),	--New value for record
	@LastName nvarchar(50),		--New value for record
	@StreetNumber int,			--New value for record
	@StreetName nvarchar(50),	--New value for record
	@StreetType nvarchar(20),	--New value for record
	@City nvarchar(50),			--New value for record
	@Province nvarchar(50),		--New value for record
	@Country nvarchar(50),		--New value for record
	@PostalCode nvarchar(9),	--New value for record
	@HomeEmail nvarchar(50),	--New value for record
	@WorkEmail nvarchar(50),	--New value for record
	@OtherEmail nvarchar(50)	--New value for record

AS
BEGIN
	SET NOCOUNT ON;

	declare @Return int = 0
	BEGIN TRY
			BEGIN TRAN
				
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK
			Set @Return = -1
		END CATCH

	RETURN @Return
END

GO
USE [master]
GO
ALTER DATABASE [TermProject] SET  READ_WRITE 
GO
