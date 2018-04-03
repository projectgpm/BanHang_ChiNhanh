﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KobePaint
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="BanHang_GPM")]
	public partial class KobePaintDBDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertnvNhanVien(nvNhanVien instance);
    partial void UpdatenvNhanVien(nvNhanVien instance);
    partial void DeletenvNhanVien(nvNhanVien instance);
    partial void InsertnvNhom(nvNhom instance);
    partial void UpdatenvNhom(nvNhom instance);
    partial void DeletenvNhom(nvNhom instance);
    partial void InsertnvNhanVien1(nvNhanVien1 instance);
    partial void UpdatenvNhanVien1(nvNhanVien1 instance);
    partial void DeletenvNhanVien1(nvNhanVien1 instance);
    partial void InserthhNhomHang(hhNhomHang instance);
    partial void UpdatehhNhomHang(hhNhomHang instance);
    partial void DeletehhNhomHang(hhNhomHang instance);
    #endregion
		
		public KobePaintDBDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["KobePaintConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public KobePaintDBDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public KobePaintDBDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public KobePaintDBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public KobePaintDBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<nvNhanVien> nvNhanViens
		{
			get
			{
				return this.GetTable<nvNhanVien>();
			}
		}
		
		public System.Data.Linq.Table<nvNhom> nvNhoms
		{
			get
			{
				return this.GetTable<nvNhom>();
			}
		}
		
		public System.Data.Linq.Table<nvNhanVien1> nvNhanVien1s
		{
			get
			{
				return this.GetTable<nvNhanVien1>();
			}
		}
		
		public System.Data.Linq.Table<hhNhomHang> hhNhomHangs
		{
			get
			{
				return this.GetTable<hhNhomHang>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.nvNhanVien")]
	public partial class nvNhanVien : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _IDNhanVien;
		
		private string _TenDangNhap;
		
		private string _MatKhau;
		
		private string _HoTen;
		
		private string _DienThoai;
		
		private string _DiaChi;
		
		private string _GhiChu;
		
		private System.Nullable<int> _NhomID;
		
		private System.Nullable<bool> _DaXoa;
		
		private System.Nullable<System.DateTime> _NgayTao;
		
		private System.Nullable<int> _IDChiNhanh;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDNhanVienChanging(int value);
    partial void OnIDNhanVienChanged();
    partial void OnTenDangNhapChanging(string value);
    partial void OnTenDangNhapChanged();
    partial void OnMatKhauChanging(string value);
    partial void OnMatKhauChanged();
    partial void OnHoTenChanging(string value);
    partial void OnHoTenChanged();
    partial void OnDienThoaiChanging(string value);
    partial void OnDienThoaiChanged();
    partial void OnDiaChiChanging(string value);
    partial void OnDiaChiChanged();
    partial void OnGhiChuChanging(string value);
    partial void OnGhiChuChanged();
    partial void OnNhomIDChanging(System.Nullable<int> value);
    partial void OnNhomIDChanged();
    partial void OnDaXoaChanging(System.Nullable<bool> value);
    partial void OnDaXoaChanged();
    partial void OnNgayTaoChanging(System.Nullable<System.DateTime> value);
    partial void OnNgayTaoChanged();
    partial void OnIDChiNhanhChanging(System.Nullable<int> value);
    partial void OnIDChiNhanhChanged();
    #endregion
		
		public nvNhanVien()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDNhanVien", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int IDNhanVien
		{
			get
			{
				return this._IDNhanVien;
			}
			set
			{
				if ((this._IDNhanVien != value))
				{
					this.OnIDNhanVienChanging(value);
					this.SendPropertyChanging();
					this._IDNhanVien = value;
					this.SendPropertyChanged("IDNhanVien");
					this.OnIDNhanVienChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenDangNhap", DbType="NVarChar(50)")]
		public string TenDangNhap
		{
			get
			{
				return this._TenDangNhap;
			}
			set
			{
				if ((this._TenDangNhap != value))
				{
					this.OnTenDangNhapChanging(value);
					this.SendPropertyChanging();
					this._TenDangNhap = value;
					this.SendPropertyChanged("TenDangNhap");
					this.OnTenDangNhapChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MatKhau", DbType="NVarChar(50)")]
		public string MatKhau
		{
			get
			{
				return this._MatKhau;
			}
			set
			{
				if ((this._MatKhau != value))
				{
					this.OnMatKhauChanging(value);
					this.SendPropertyChanging();
					this._MatKhau = value;
					this.SendPropertyChanged("MatKhau");
					this.OnMatKhauChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HoTen", DbType="NVarChar(50)")]
		public string HoTen
		{
			get
			{
				return this._HoTen;
			}
			set
			{
				if ((this._HoTen != value))
				{
					this.OnHoTenChanging(value);
					this.SendPropertyChanging();
					this._HoTen = value;
					this.SendPropertyChanged("HoTen");
					this.OnHoTenChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DienThoai", DbType="NVarChar(30)")]
		public string DienThoai
		{
			get
			{
				return this._DienThoai;
			}
			set
			{
				if ((this._DienThoai != value))
				{
					this.OnDienThoaiChanging(value);
					this.SendPropertyChanging();
					this._DienThoai = value;
					this.SendPropertyChanged("DienThoai");
					this.OnDienThoaiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DiaChi", DbType="NVarChar(250)")]
		public string DiaChi
		{
			get
			{
				return this._DiaChi;
			}
			set
			{
				if ((this._DiaChi != value))
				{
					this.OnDiaChiChanging(value);
					this.SendPropertyChanging();
					this._DiaChi = value;
					this.SendPropertyChanged("DiaChi");
					this.OnDiaChiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GhiChu", DbType="NVarChar(500)")]
		public string GhiChu
		{
			get
			{
				return this._GhiChu;
			}
			set
			{
				if ((this._GhiChu != value))
				{
					this.OnGhiChuChanging(value);
					this.SendPropertyChanging();
					this._GhiChu = value;
					this.SendPropertyChanged("GhiChu");
					this.OnGhiChuChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NhomID", DbType="Int")]
		public System.Nullable<int> NhomID
		{
			get
			{
				return this._NhomID;
			}
			set
			{
				if ((this._NhomID != value))
				{
					this.OnNhomIDChanging(value);
					this.SendPropertyChanging();
					this._NhomID = value;
					this.SendPropertyChanged("NhomID");
					this.OnNhomIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DaXoa", DbType="Bit")]
		public System.Nullable<bool> DaXoa
		{
			get
			{
				return this._DaXoa;
			}
			set
			{
				if ((this._DaXoa != value))
				{
					this.OnDaXoaChanging(value);
					this.SendPropertyChanging();
					this._DaXoa = value;
					this.SendPropertyChanged("DaXoa");
					this.OnDaXoaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NgayTao", DbType="SmallDateTime")]
		public System.Nullable<System.DateTime> NgayTao
		{
			get
			{
				return this._NgayTao;
			}
			set
			{
				if ((this._NgayTao != value))
				{
					this.OnNgayTaoChanging(value);
					this.SendPropertyChanging();
					this._NgayTao = value;
					this.SendPropertyChanged("NgayTao");
					this.OnNgayTaoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDChiNhanh", DbType="Int")]
		public System.Nullable<int> IDChiNhanh
		{
			get
			{
				return this._IDChiNhanh;
			}
			set
			{
				if ((this._IDChiNhanh != value))
				{
					this.OnIDChiNhanhChanging(value);
					this.SendPropertyChanging();
					this._IDChiNhanh = value;
					this.SendPropertyChanged("IDChiNhanh");
					this.OnIDChiNhanhChanged();
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.nvNhom")]
	public partial class nvNhom : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _IDNhom;
		
		private string _TenNhom;
		
		private System.Nullable<bool> _DaXoa;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDNhomChanging(int value);
    partial void OnIDNhomChanged();
    partial void OnTenNhomChanging(string value);
    partial void OnTenNhomChanged();
    partial void OnDaXoaChanging(System.Nullable<bool> value);
    partial void OnDaXoaChanged();
    #endregion
		
		public nvNhom()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDNhom", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int IDNhom
		{
			get
			{
				return this._IDNhom;
			}
			set
			{
				if ((this._IDNhom != value))
				{
					this.OnIDNhomChanging(value);
					this.SendPropertyChanging();
					this._IDNhom = value;
					this.SendPropertyChanged("IDNhom");
					this.OnIDNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenNhom", DbType="NVarChar(50)")]
		public string TenNhom
		{
			get
			{
				return this._TenNhom;
			}
			set
			{
				if ((this._TenNhom != value))
				{
					this.OnTenNhomChanging(value);
					this.SendPropertyChanging();
					this._TenNhom = value;
					this.SendPropertyChanged("TenNhom");
					this.OnTenNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DaXoa", DbType="Bit")]
		public System.Nullable<bool> DaXoa
		{
			get
			{
				return this._DaXoa;
			}
			set
			{
				if ((this._DaXoa != value))
				{
					this.OnDaXoaChanging(value);
					this.SendPropertyChanging();
					this._DaXoa = value;
					this.SendPropertyChanged("DaXoa");
					this.OnDaXoaChanged();
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.nvNhanVien")]
	public partial class nvNhanVien1 : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _IDNhanVien;
		
		private string _TenDangNhap;
		
		private string _MatKhau;
		
		private string _HoTen;
		
		private string _DienThoai;
		
		private string _DiaChi;
		
		private string _GhiChu;
		
		private System.Nullable<int> _NhomID;
		
		private System.Nullable<bool> _DaXoa;
		
		private System.Nullable<System.DateTime> _NgayTao;
		
		private System.Nullable<int> _IDChiNhanh;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDNhanVienChanging(int value);
    partial void OnIDNhanVienChanged();
    partial void OnTenDangNhapChanging(string value);
    partial void OnTenDangNhapChanged();
    partial void OnMatKhauChanging(string value);
    partial void OnMatKhauChanged();
    partial void OnHoTenChanging(string value);
    partial void OnHoTenChanged();
    partial void OnDienThoaiChanging(string value);
    partial void OnDienThoaiChanged();
    partial void OnDiaChiChanging(string value);
    partial void OnDiaChiChanged();
    partial void OnGhiChuChanging(string value);
    partial void OnGhiChuChanged();
    partial void OnNhomIDChanging(System.Nullable<int> value);
    partial void OnNhomIDChanged();
    partial void OnDaXoaChanging(System.Nullable<bool> value);
    partial void OnDaXoaChanged();
    partial void OnNgayTaoChanging(System.Nullable<System.DateTime> value);
    partial void OnNgayTaoChanged();
    partial void OnIDChiNhanhChanging(System.Nullable<int> value);
    partial void OnIDChiNhanhChanged();
    #endregion
		
		public nvNhanVien1()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDNhanVien", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int IDNhanVien
		{
			get
			{
				return this._IDNhanVien;
			}
			set
			{
				if ((this._IDNhanVien != value))
				{
					this.OnIDNhanVienChanging(value);
					this.SendPropertyChanging();
					this._IDNhanVien = value;
					this.SendPropertyChanged("IDNhanVien");
					this.OnIDNhanVienChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenDangNhap", DbType="NVarChar(50)")]
		public string TenDangNhap
		{
			get
			{
				return this._TenDangNhap;
			}
			set
			{
				if ((this._TenDangNhap != value))
				{
					this.OnTenDangNhapChanging(value);
					this.SendPropertyChanging();
					this._TenDangNhap = value;
					this.SendPropertyChanged("TenDangNhap");
					this.OnTenDangNhapChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MatKhau", DbType="NVarChar(50)")]
		public string MatKhau
		{
			get
			{
				return this._MatKhau;
			}
			set
			{
				if ((this._MatKhau != value))
				{
					this.OnMatKhauChanging(value);
					this.SendPropertyChanging();
					this._MatKhau = value;
					this.SendPropertyChanged("MatKhau");
					this.OnMatKhauChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HoTen", DbType="NVarChar(50)")]
		public string HoTen
		{
			get
			{
				return this._HoTen;
			}
			set
			{
				if ((this._HoTen != value))
				{
					this.OnHoTenChanging(value);
					this.SendPropertyChanging();
					this._HoTen = value;
					this.SendPropertyChanged("HoTen");
					this.OnHoTenChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DienThoai", DbType="NVarChar(30)")]
		public string DienThoai
		{
			get
			{
				return this._DienThoai;
			}
			set
			{
				if ((this._DienThoai != value))
				{
					this.OnDienThoaiChanging(value);
					this.SendPropertyChanging();
					this._DienThoai = value;
					this.SendPropertyChanged("DienThoai");
					this.OnDienThoaiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DiaChi", DbType="NVarChar(250)")]
		public string DiaChi
		{
			get
			{
				return this._DiaChi;
			}
			set
			{
				if ((this._DiaChi != value))
				{
					this.OnDiaChiChanging(value);
					this.SendPropertyChanging();
					this._DiaChi = value;
					this.SendPropertyChanged("DiaChi");
					this.OnDiaChiChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GhiChu", DbType="NVarChar(500)")]
		public string GhiChu
		{
			get
			{
				return this._GhiChu;
			}
			set
			{
				if ((this._GhiChu != value))
				{
					this.OnGhiChuChanging(value);
					this.SendPropertyChanging();
					this._GhiChu = value;
					this.SendPropertyChanged("GhiChu");
					this.OnGhiChuChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NhomID", DbType="Int")]
		public System.Nullable<int> NhomID
		{
			get
			{
				return this._NhomID;
			}
			set
			{
				if ((this._NhomID != value))
				{
					this.OnNhomIDChanging(value);
					this.SendPropertyChanging();
					this._NhomID = value;
					this.SendPropertyChanged("NhomID");
					this.OnNhomIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DaXoa", DbType="Bit")]
		public System.Nullable<bool> DaXoa
		{
			get
			{
				return this._DaXoa;
			}
			set
			{
				if ((this._DaXoa != value))
				{
					this.OnDaXoaChanging(value);
					this.SendPropertyChanging();
					this._DaXoa = value;
					this.SendPropertyChanged("DaXoa");
					this.OnDaXoaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NgayTao", DbType="SmallDateTime")]
		public System.Nullable<System.DateTime> NgayTao
		{
			get
			{
				return this._NgayTao;
			}
			set
			{
				if ((this._NgayTao != value))
				{
					this.OnNgayTaoChanging(value);
					this.SendPropertyChanging();
					this._NgayTao = value;
					this.SendPropertyChanged("NgayTao");
					this.OnNgayTaoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDChiNhanh", DbType="Int")]
		public System.Nullable<int> IDChiNhanh
		{
			get
			{
				return this._IDChiNhanh;
			}
			set
			{
				if ((this._IDChiNhanh != value))
				{
					this.OnIDChiNhanhChanging(value);
					this.SendPropertyChanging();
					this._IDChiNhanh = value;
					this.SendPropertyChanged("IDChiNhanh");
					this.OnIDChiNhanhChanged();
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.hhNhomHang")]
	public partial class hhNhomHang : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _IDNhomHH;
		
		private string _TenNhom;
		
		private System.Nullable<bool> _DaXoa;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDNhomHHChanging(int value);
    partial void OnIDNhomHHChanged();
    partial void OnTenNhomChanging(string value);
    partial void OnTenNhomChanged();
    partial void OnDaXoaChanging(System.Nullable<bool> value);
    partial void OnDaXoaChanged();
    #endregion
		
		public hhNhomHang()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IDNhomHH", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int IDNhomHH
		{
			get
			{
				return this._IDNhomHH;
			}
			set
			{
				if ((this._IDNhomHH != value))
				{
					this.OnIDNhomHHChanging(value);
					this.SendPropertyChanging();
					this._IDNhomHH = value;
					this.SendPropertyChanged("IDNhomHH");
					this.OnIDNhomHHChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TenNhom", DbType="NVarChar(250)")]
		public string TenNhom
		{
			get
			{
				return this._TenNhom;
			}
			set
			{
				if ((this._TenNhom != value))
				{
					this.OnTenNhomChanging(value);
					this.SendPropertyChanging();
					this._TenNhom = value;
					this.SendPropertyChanged("TenNhom");
					this.OnTenNhomChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DaXoa", DbType="Bit")]
		public System.Nullable<bool> DaXoa
		{
			get
			{
				return this._DaXoa;
			}
			set
			{
				if ((this._DaXoa != value))
				{
					this.OnDaXoaChanging(value);
					this.SendPropertyChanging();
					this._DaXoa = value;
					this.SendPropertyChanged("DaXoa");
					this.OnDaXoaChanged();
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
}
#pragma warning restore 1591
