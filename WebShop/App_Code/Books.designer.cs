﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="BookShop")]
public partial class BooksDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertProductCategory(ProductCategory instance);
  partial void UpdateProductCategory(ProductCategory instance);
  partial void DeleteProductCategory(ProductCategory instance);
  partial void InsertProduct(Product instance);
  partial void UpdateProduct(Product instance);
  partial void DeleteProduct(Product instance);
  partial void InsertOrder(Order instance);
  partial void UpdateOrder(Order instance);
  partial void DeleteOrder(Order instance);
  partial void InsertComment_tb(Comment_tb instance);
  partial void UpdateComment_tb(Comment_tb instance);
  partial void DeleteComment_tb(Comment_tb instance);
  partial void InsertOrderLine(OrderLine instance);
  partial void UpdateOrderLine(OrderLine instance);
  partial void DeleteOrderLine(OrderLine instance);
  #endregion
	
	public BooksDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["BookShopConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public BooksDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public BooksDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public BooksDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public BooksDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<ProductCategory> ProductCategories
	{
		get
		{
			return this.GetTable<ProductCategory>();
		}
	}
	
	public System.Data.Linq.Table<Product> Products
	{
		get
		{
			return this.GetTable<Product>();
		}
	}
	
	public System.Data.Linq.Table<Order> Orders
	{
		get
		{
			return this.GetTable<Order>();
		}
	}
	
	public System.Data.Linq.Table<Comment_tb> Comment_tbs
	{
		get
		{
			return this.GetTable<Comment_tb>();
		}
	}
	
	public System.Data.Linq.Table<OrderLine> OrderLines
	{
		get
		{
			return this.GetTable<OrderLine>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ProductCategory")]
public partial class ProductCategory : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _CategoryId;
	
	private string _Name;
	
	private EntitySet<Product> _Products;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCategoryIdChanging(int value);
    partial void OnCategoryIdChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
	
	public ProductCategory()
	{
		this._Products = new EntitySet<Product>(new Action<Product>(this.attach_Products), new Action<Product>(this.detach_Products));
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CategoryId", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int CategoryId
	{
		get
		{
			return this._CategoryId;
		}
		set
		{
			if ((this._CategoryId != value))
			{
				this.OnCategoryIdChanging(value);
				this.SendPropertyChanging();
				this._CategoryId = value;
				this.SendPropertyChanged("CategoryId");
				this.OnCategoryIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="NVarChar(50)")]
	public string Name
	{
		get
		{
			return this._Name;
		}
		set
		{
			if ((this._Name != value))
			{
				this.OnNameChanging(value);
				this.SendPropertyChanging();
				this._Name = value;
				this.SendPropertyChanged("Name");
				this.OnNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="ProductCategory_Product", Storage="_Products", ThisKey="CategoryId", OtherKey="CatgryId")]
	public EntitySet<Product> Products
	{
		get
		{
			return this._Products;
		}
		set
		{
			this._Products.Assign(value);
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_Products(Product entity)
	{
		this.SendPropertyChanging();
		entity.ProductCategory = this;
	}
	
	private void detach_Products(Product entity)
	{
		this.SendPropertyChanging();
		entity.ProductCategory = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Products")]
public partial class Product : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _ProductID;
	
	private string _Name;
	
	private string _Description;
	
	private decimal _Price;
	
	private string _PictureURL;
	
	private System.Nullable<int> _CatgryId;
	
	private string _UserName;
	
	private string _ISBN;
	
	private System.Nullable<int> _Status;
	
	private string _SKU;
	
	private System.Nullable<int> _Votes;
	
	private System.Nullable<System.DateTime> _AddedDate;
	
	private System.Nullable<int> _UnitsInStock;
	
	private EntitySet<Comment_tb> _Comment_tbs;
	
	private EntityRef<ProductCategory> _ProductCategory;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnPriceChanging(decimal value);
    partial void OnPriceChanged();
    partial void OnPictureURLChanging(string value);
    partial void OnPictureURLChanged();
    partial void OnCatgryIdChanging(System.Nullable<int> value);
    partial void OnCatgryIdChanged();
    partial void OnUserNameChanging(string value);
    partial void OnUserNameChanged();
    partial void OnISBNChanging(string value);
    partial void OnISBNChanged();
    partial void OnStatusChanging(System.Nullable<int> value);
    partial void OnStatusChanged();
    partial void OnSKUChanging(string value);
    partial void OnSKUChanged();
    partial void OnVotesChanging(System.Nullable<int> value);
    partial void OnVotesChanged();
    partial void OnAddedDateChanging(System.Nullable<System.DateTime> value);
    partial void OnAddedDateChanged();
    partial void OnUnitsInStockChanging(System.Nullable<int> value);
    partial void OnUnitsInStockChanged();
    #endregion
	
	public Product()
	{
		this._Comment_tbs = new EntitySet<Comment_tb>(new Action<Comment_tb>(this.attach_Comment_tbs), new Action<Comment_tb>(this.detach_Comment_tbs));
		this._ProductCategory = default(EntityRef<ProductCategory>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int ProductID
	{
		get
		{
			return this._ProductID;
		}
		set
		{
			if ((this._ProductID != value))
			{
				this.OnProductIDChanging(value);
				this.SendPropertyChanging();
				this._ProductID = value;
				this.SendPropertyChanged("ProductID");
				this.OnProductIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Name
	{
		get
		{
			return this._Name;
		}
		set
		{
			if ((this._Name != value))
			{
				this.OnNameChanging(value);
				this.SendPropertyChanging();
				this._Name = value;
				this.SendPropertyChanged("Name");
				this.OnNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="NText", UpdateCheck=UpdateCheck.Never)]
	public string Description
	{
		get
		{
			return this._Description;
		}
		set
		{
			if ((this._Description != value))
			{
				this.OnDescriptionChanging(value);
				this.SendPropertyChanging();
				this._Description = value;
				this.SendPropertyChanged("Description");
				this.OnDescriptionChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="Money NOT NULL")]
	public decimal Price
	{
		get
		{
			return this._Price;
		}
		set
		{
			if ((this._Price != value))
			{
				this.OnPriceChanging(value);
				this.SendPropertyChanging();
				this._Price = value;
				this.SendPropertyChanged("Price");
				this.OnPriceChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PictureURL", DbType="VarChar(255)")]
	public string PictureURL
	{
		get
		{
			return this._PictureURL;
		}
		set
		{
			if ((this._PictureURL != value))
			{
				this.OnPictureURLChanging(value);
				this.SendPropertyChanging();
				this._PictureURL = value;
				this.SendPropertyChanged("PictureURL");
				this.OnPictureURLChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CatgryId", DbType="Int")]
	public System.Nullable<int> CatgryId
	{
		get
		{
			return this._CatgryId;
		}
		set
		{
			if ((this._CatgryId != value))
			{
				if (this._ProductCategory.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnCatgryIdChanging(value);
				this.SendPropertyChanging();
				this._CatgryId = value;
				this.SendPropertyChanged("CatgryId");
				this.OnCatgryIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserName", DbType="NChar(10)")]
	public string UserName
	{
		get
		{
			return this._UserName;
		}
		set
		{
			if ((this._UserName != value))
			{
				this.OnUserNameChanging(value);
				this.SendPropertyChanging();
				this._UserName = value;
				this.SendPropertyChanged("UserName");
				this.OnUserNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ISBN", DbType="NVarChar(50)")]
	public string ISBN
	{
		get
		{
			return this._ISBN;
		}
		set
		{
			if ((this._ISBN != value))
			{
				this.OnISBNChanging(value);
				this.SendPropertyChanging();
				this._ISBN = value;
				this.SendPropertyChanged("ISBN");
				this.OnISBNChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="Int")]
	public System.Nullable<int> Status
	{
		get
		{
			return this._Status;
		}
		set
		{
			if ((this._Status != value))
			{
				this.OnStatusChanging(value);
				this.SendPropertyChanging();
				this._Status = value;
				this.SendPropertyChanged("Status");
				this.OnStatusChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SKU", DbType="NVarChar(50)")]
	public string SKU
	{
		get
		{
			return this._SKU;
		}
		set
		{
			if ((this._SKU != value))
			{
				this.OnSKUChanging(value);
				this.SendPropertyChanging();
				this._SKU = value;
				this.SendPropertyChanged("SKU");
				this.OnSKUChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Votes", DbType="Int")]
	public System.Nullable<int> Votes
	{
		get
		{
			return this._Votes;
		}
		set
		{
			if ((this._Votes != value))
			{
				this.OnVotesChanging(value);
				this.SendPropertyChanging();
				this._Votes = value;
				this.SendPropertyChanged("Votes");
				this.OnVotesChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AddedDate", DbType="SmallDateTime")]
	public System.Nullable<System.DateTime> AddedDate
	{
		get
		{
			return this._AddedDate;
		}
		set
		{
			if ((this._AddedDate != value))
			{
				this.OnAddedDateChanging(value);
				this.SendPropertyChanging();
				this._AddedDate = value;
				this.SendPropertyChanged("AddedDate");
				this.OnAddedDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UnitsInStock", DbType="Int")]
	public System.Nullable<int> UnitsInStock
	{
		get
		{
			return this._UnitsInStock;
		}
		set
		{
			if ((this._UnitsInStock != value))
			{
				this.OnUnitsInStockChanging(value);
				this.SendPropertyChanging();
				this._UnitsInStock = value;
				this.SendPropertyChanged("UnitsInStock");
				this.OnUnitsInStockChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_Comment_tb", Storage="_Comment_tbs", ThisKey="ProductID", OtherKey="ProductID")]
	public EntitySet<Comment_tb> Comment_tbs
	{
		get
		{
			return this._Comment_tbs;
		}
		set
		{
			this._Comment_tbs.Assign(value);
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="ProductCategory_Product", Storage="_ProductCategory", ThisKey="CatgryId", OtherKey="CategoryId", IsForeignKey=true)]
	public ProductCategory ProductCategory
	{
		get
		{
			return this._ProductCategory.Entity;
		}
		set
		{
			ProductCategory previousValue = this._ProductCategory.Entity;
			if (((previousValue != value) 
						|| (this._ProductCategory.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._ProductCategory.Entity = null;
					previousValue.Products.Remove(this);
				}
				this._ProductCategory.Entity = value;
				if ((value != null))
				{
					value.Products.Add(this);
					this._CatgryId = value.CategoryId;
				}
				else
				{
					this._CatgryId = default(Nullable<int>);
				}
				this.SendPropertyChanged("ProductCategory");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_Comment_tbs(Comment_tb entity)
	{
		this.SendPropertyChanging();
		entity.Product = this;
	}
	
	private void detach_Comment_tbs(Comment_tb entity)
	{
		this.SendPropertyChanging();
		entity.Product = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Orders")]
public partial class Order : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _OrderID;
	
	private System.DateTime _OrderDate;
	
	private System.Nullable<System.DateTime> _OrderSentDate;
	
	private string _MemberName;
	
	private string _Name;
	
	private string _Address;
	
	private string _County;
	
	private string _PostCode;
	
	private string _Country;
	
	private System.Nullable<decimal> _SubTotal;
	
	private System.Nullable<decimal> _Discount;
	
	private System.Nullable<decimal> _Total;
	
	private System.Nullable<int> _Status;
	
	private System.Nullable<int> _TrackingID;
	
	private System.Nullable<int> _TransactionID;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderIDChanging(int value);
    partial void OnOrderIDChanged();
    partial void OnOrderDateChanging(System.DateTime value);
    partial void OnOrderDateChanged();
    partial void OnOrderSentDateChanging(System.Nullable<System.DateTime> value);
    partial void OnOrderSentDateChanged();
    partial void OnMemberNameChanging(string value);
    partial void OnMemberNameChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnAddressChanging(string value);
    partial void OnAddressChanged();
    partial void OnCountyChanging(string value);
    partial void OnCountyChanged();
    partial void OnPostCodeChanging(string value);
    partial void OnPostCodeChanged();
    partial void OnCountryChanging(string value);
    partial void OnCountryChanged();
    partial void OnSubTotalChanging(System.Nullable<decimal> value);
    partial void OnSubTotalChanged();
    partial void OnDiscountChanging(System.Nullable<decimal> value);
    partial void OnDiscountChanged();
    partial void OnTotalChanging(System.Nullable<decimal> value);
    partial void OnTotalChanged();
    partial void OnStatusChanging(System.Nullable<int> value);
    partial void OnStatusChanged();
    partial void OnTrackingIDChanging(System.Nullable<int> value);
    partial void OnTrackingIDChanged();
    partial void OnTransactionIDChanging(System.Nullable<int> value);
    partial void OnTransactionIDChanged();
    #endregion
	
	public Order()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int OrderID
	{
		get
		{
			return this._OrderID;
		}
		set
		{
			if ((this._OrderID != value))
			{
				this.OnOrderIDChanging(value);
				this.SendPropertyChanging();
				this._OrderID = value;
				this.SendPropertyChanged("OrderID");
				this.OnOrderIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderDate", DbType="DateTime NOT NULL")]
	public System.DateTime OrderDate
	{
		get
		{
			return this._OrderDate;
		}
		set
		{
			if ((this._OrderDate != value))
			{
				this.OnOrderDateChanging(value);
				this.SendPropertyChanging();
				this._OrderDate = value;
				this.SendPropertyChanged("OrderDate");
				this.OnOrderDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderSentDate", DbType="DateTime")]
	public System.Nullable<System.DateTime> OrderSentDate
	{
		get
		{
			return this._OrderSentDate;
		}
		set
		{
			if ((this._OrderSentDate != value))
			{
				this.OnOrderSentDateChanging(value);
				this.SendPropertyChanging();
				this._OrderSentDate = value;
				this.SendPropertyChanged("OrderSentDate");
				this.OnOrderSentDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MemberName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string MemberName
	{
		get
		{
			return this._MemberName;
		}
		set
		{
			if ((this._MemberName != value))
			{
				this.OnMemberNameChanging(value);
				this.SendPropertyChanging();
				this._MemberName = value;
				this.SendPropertyChanged("MemberName");
				this.OnMemberNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Name
	{
		get
		{
			return this._Name;
		}
		set
		{
			if ((this._Name != value))
			{
				this.OnNameChanging(value);
				this.SendPropertyChanging();
				this._Name = value;
				this.SendPropertyChanged("Name");
				this.OnNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Address", DbType="VarChar(255) NOT NULL", CanBeNull=false)]
	public string Address
	{
		get
		{
			return this._Address;
		}
		set
		{
			if ((this._Address != value))
			{
				this.OnAddressChanging(value);
				this.SendPropertyChanging();
				this._Address = value;
				this.SendPropertyChanged("Address");
				this.OnAddressChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_County", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string County
	{
		get
		{
			return this._County;
		}
		set
		{
			if ((this._County != value))
			{
				this.OnCountyChanging(value);
				this.SendPropertyChanging();
				this._County = value;
				this.SendPropertyChanged("County");
				this.OnCountyChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PostCode", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string PostCode
	{
		get
		{
			return this._PostCode;
		}
		set
		{
			if ((this._PostCode != value))
			{
				this.OnPostCodeChanging(value);
				this.SendPropertyChanging();
				this._PostCode = value;
				this.SendPropertyChanged("PostCode");
				this.OnPostCodeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Country", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string Country
	{
		get
		{
			return this._Country;
		}
		set
		{
			if ((this._Country != value))
			{
				this.OnCountryChanging(value);
				this.SendPropertyChanging();
				this._Country = value;
				this.SendPropertyChanged("Country");
				this.OnCountryChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SubTotal", DbType="Money")]
	public System.Nullable<decimal> SubTotal
	{
		get
		{
			return this._SubTotal;
		}
		set
		{
			if ((this._SubTotal != value))
			{
				this.OnSubTotalChanging(value);
				this.SendPropertyChanging();
				this._SubTotal = value;
				this.SendPropertyChanged("SubTotal");
				this.OnSubTotalChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Discount", DbType="Money")]
	public System.Nullable<decimal> Discount
	{
		get
		{
			return this._Discount;
		}
		set
		{
			if ((this._Discount != value))
			{
				this.OnDiscountChanging(value);
				this.SendPropertyChanging();
				this._Discount = value;
				this.SendPropertyChanged("Discount");
				this.OnDiscountChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Total", DbType="Money")]
	public System.Nullable<decimal> Total
	{
		get
		{
			return this._Total;
		}
		set
		{
			if ((this._Total != value))
			{
				this.OnTotalChanging(value);
				this.SendPropertyChanging();
				this._Total = value;
				this.SendPropertyChanged("Total");
				this.OnTotalChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="Int")]
	public System.Nullable<int> Status
	{
		get
		{
			return this._Status;
		}
		set
		{
			if ((this._Status != value))
			{
				this.OnStatusChanging(value);
				this.SendPropertyChanging();
				this._Status = value;
				this.SendPropertyChanged("Status");
				this.OnStatusChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TrackingID", DbType="Int")]
	public System.Nullable<int> TrackingID
	{
		get
		{
			return this._TrackingID;
		}
		set
		{
			if ((this._TrackingID != value))
			{
				this.OnTrackingIDChanging(value);
				this.SendPropertyChanging();
				this._TrackingID = value;
				this.SendPropertyChanged("TrackingID");
				this.OnTrackingIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TransactionID", DbType="Int")]
	public System.Nullable<int> TransactionID
	{
		get
		{
			return this._TransactionID;
		}
		set
		{
			if ((this._TransactionID != value))
			{
				this.OnTransactionIDChanging(value);
				this.SendPropertyChanging();
				this._TransactionID = value;
				this.SendPropertyChanged("TransactionID");
				this.OnTransactionIDChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Comment_tb")]
public partial class Comment_tb : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _CommentId;
	
	private string _FeedBackMessage;
	
	private System.Nullable<int> _ProductID;
	
	private string _AddedBy;
	
	private System.Nullable<System.DateTime> _AddedDate;
	
	private EntityRef<Product> _Product;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCommentIdChanging(int value);
    partial void OnCommentIdChanged();
    partial void OnFeedBackMessageChanging(string value);
    partial void OnFeedBackMessageChanged();
    partial void OnProductIDChanging(System.Nullable<int> value);
    partial void OnProductIDChanged();
    partial void OnAddedByChanging(string value);
    partial void OnAddedByChanged();
    partial void OnAddedDateChanging(System.Nullable<System.DateTime> value);
    partial void OnAddedDateChanged();
    #endregion
	
	public Comment_tb()
	{
		this._Product = default(EntityRef<Product>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CommentId", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int CommentId
	{
		get
		{
			return this._CommentId;
		}
		set
		{
			if ((this._CommentId != value))
			{
				this.OnCommentIdChanging(value);
				this.SendPropertyChanging();
				this._CommentId = value;
				this.SendPropertyChanged("CommentId");
				this.OnCommentIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FeedBackMessage", DbType="Text", UpdateCheck=UpdateCheck.Never)]
	public string FeedBackMessage
	{
		get
		{
			return this._FeedBackMessage;
		}
		set
		{
			if ((this._FeedBackMessage != value))
			{
				this.OnFeedBackMessageChanging(value);
				this.SendPropertyChanging();
				this._FeedBackMessage = value;
				this.SendPropertyChanged("FeedBackMessage");
				this.OnFeedBackMessageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int")]
	public System.Nullable<int> ProductID
	{
		get
		{
			return this._ProductID;
		}
		set
		{
			if ((this._ProductID != value))
			{
				if (this._Product.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnProductIDChanging(value);
				this.SendPropertyChanging();
				this._ProductID = value;
				this.SendPropertyChanged("ProductID");
				this.OnProductIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AddedBy", DbType="NVarChar(50)")]
	public string AddedBy
	{
		get
		{
			return this._AddedBy;
		}
		set
		{
			if ((this._AddedBy != value))
			{
				this.OnAddedByChanging(value);
				this.SendPropertyChanging();
				this._AddedBy = value;
				this.SendPropertyChanged("AddedBy");
				this.OnAddedByChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AddedDate", DbType="DateTime")]
	public System.Nullable<System.DateTime> AddedDate
	{
		get
		{
			return this._AddedDate;
		}
		set
		{
			if ((this._AddedDate != value))
			{
				this.OnAddedDateChanging(value);
				this.SendPropertyChanging();
				this._AddedDate = value;
				this.SendPropertyChanged("AddedDate");
				this.OnAddedDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Product_Comment_tb", Storage="_Product", ThisKey="ProductID", OtherKey="ProductID", IsForeignKey=true)]
	public Product Product
	{
		get
		{
			return this._Product.Entity;
		}
		set
		{
			Product previousValue = this._Product.Entity;
			if (((previousValue != value) 
						|| (this._Product.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._Product.Entity = null;
					previousValue.Comment_tbs.Remove(this);
				}
				this._Product.Entity = value;
				if ((value != null))
				{
					value.Comment_tbs.Add(this);
					this._ProductID = value.ProductID;
				}
				else
				{
					this._ProductID = default(Nullable<int>);
				}
				this.SendPropertyChanged("Product");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.OrderLines")]
public partial class OrderLine : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _OrderLineID;
	
	private int _OrderID;
	
	private int _ProductID;
	
	private short _Quantity;
	
	private decimal _Price;
	
	private string _UserName;
	
	private System.Nullable<System.DateTime> _OrderDate;
	
	private string _ProductName;
	
	private string _SKU;
	
	private System.Nullable<int> _Status;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnOrderLineIDChanging(int value);
    partial void OnOrderLineIDChanged();
    partial void OnOrderIDChanging(int value);
    partial void OnOrderIDChanged();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    partial void OnQuantityChanging(short value);
    partial void OnQuantityChanged();
    partial void OnPriceChanging(decimal value);
    partial void OnPriceChanged();
    partial void OnUserNameChanging(string value);
    partial void OnUserNameChanged();
    partial void OnOrderDateChanging(System.Nullable<System.DateTime> value);
    partial void OnOrderDateChanged();
    partial void OnProductNameChanging(string value);
    partial void OnProductNameChanged();
    partial void OnSKUChanging(string value);
    partial void OnSKUChanged();
    partial void OnStatusChanging(System.Nullable<int> value);
    partial void OnStatusChanged();
    #endregion
	
	public OrderLine()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderLineID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int OrderLineID
	{
		get
		{
			return this._OrderLineID;
		}
		set
		{
			if ((this._OrderLineID != value))
			{
				this.OnOrderLineIDChanging(value);
				this.SendPropertyChanging();
				this._OrderLineID = value;
				this.SendPropertyChanged("OrderLineID");
				this.OnOrderLineIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderID", DbType="Int NOT NULL")]
	public int OrderID
	{
		get
		{
			return this._OrderID;
		}
		set
		{
			if ((this._OrderID != value))
			{
				this.OnOrderIDChanging(value);
				this.SendPropertyChanging();
				this._OrderID = value;
				this.SendPropertyChanged("OrderID");
				this.OnOrderIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductID", DbType="Int NOT NULL")]
	public int ProductID
	{
		get
		{
			return this._ProductID;
		}
		set
		{
			if ((this._ProductID != value))
			{
				this.OnProductIDChanging(value);
				this.SendPropertyChanging();
				this._ProductID = value;
				this.SendPropertyChanged("ProductID");
				this.OnProductIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Quantity", DbType="SmallInt NOT NULL")]
	public short Quantity
	{
		get
		{
			return this._Quantity;
		}
		set
		{
			if ((this._Quantity != value))
			{
				this.OnQuantityChanging(value);
				this.SendPropertyChanging();
				this._Quantity = value;
				this.SendPropertyChanged("Quantity");
				this.OnQuantityChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="Money NOT NULL")]
	public decimal Price
	{
		get
		{
			return this._Price;
		}
		set
		{
			if ((this._Price != value))
			{
				this.OnPriceChanging(value);
				this.SendPropertyChanging();
				this._Price = value;
				this.SendPropertyChanged("Price");
				this.OnPriceChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserName", DbType="NVarChar(50)")]
	public string UserName
	{
		get
		{
			return this._UserName;
		}
		set
		{
			if ((this._UserName != value))
			{
				this.OnUserNameChanging(value);
				this.SendPropertyChanging();
				this._UserName = value;
				this.SendPropertyChanged("UserName");
				this.OnUserNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OrderDate", DbType="DateTime")]
	public System.Nullable<System.DateTime> OrderDate
	{
		get
		{
			return this._OrderDate;
		}
		set
		{
			if ((this._OrderDate != value))
			{
				this.OnOrderDateChanging(value);
				this.SendPropertyChanging();
				this._OrderDate = value;
				this.SendPropertyChanged("OrderDate");
				this.OnOrderDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProductName", DbType="NVarChar(50)")]
	public string ProductName
	{
		get
		{
			return this._ProductName;
		}
		set
		{
			if ((this._ProductName != value))
			{
				this.OnProductNameChanging(value);
				this.SendPropertyChanging();
				this._ProductName = value;
				this.SendPropertyChanged("ProductName");
				this.OnProductNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SKU", DbType="NVarChar(50)")]
	public string SKU
	{
		get
		{
			return this._SKU;
		}
		set
		{
			if ((this._SKU != value))
			{
				this.OnSKUChanging(value);
				this.SendPropertyChanging();
				this._SKU = value;
				this.SendPropertyChanged("SKU");
				this.OnSKUChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="Int")]
	public System.Nullable<int> Status
	{
		get
		{
			return this._Status;
		}
		set
		{
			if ((this._Status != value))
			{
				this.OnStatusChanging(value);
				this.SendPropertyChanging();
				this._Status = value;
				this.SendPropertyChanged("Status");
				this.OnStatusChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591