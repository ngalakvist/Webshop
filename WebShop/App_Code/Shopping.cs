using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.VisualBasic;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace BookShop.Commerce
{
    [Serializable]
    public class CartItem
    {
        private int _productID;
        private string _productName;
        private string _productImageUrl;
        private int _quantity;
        private double _price;
        private double _lineTotal;

        public void New()
        {
        }

        public void New(int ProductID, string ProductName,
          string ProductImageUrl, int Quantity,
          double Price)
        {
            _productID = ProductID;
            _productName = ProductName;
            _productImageUrl = ProductImageUrl;
            _quantity = Quantity;
            _price = Price;
            _lineTotal = Quantity * Price;

        }

        public int ProductID
        {
            get
            {
                return _productID;
            }
            set
            {
                _productID = value;
            }
        }

        public string ProductName
        {
            get
            {
                return _productName;
            }
            set
            {
                _productName = value;
            }
        }

        public string ProductImageUrl
        {
            get
            {
                return _productImageUrl;
            }
            set
            {
                _productImageUrl = value;
            }
        }

        public int Quantity
        {
            get
            {
                return _quantity;
            }
            set
            {
                _quantity = value;
            }
        }

        public double Price
        {
            get
            {
                return _price;
            }
            set
            {
                _price = value;
            }
        }

        public double LineTotal
        {
            get
            {
                return _quantity * _price;
            }
        }

    }
    [Serializable]
    public class BooksShoppingCart
    {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private Dictionary<int, CartItem> _items = new Dictionary<int, CartItem>();

        public Dictionary<int, CartItem>.ValueCollection Items
        {
            get { return _items.Values; }
        }    

        public BooksShoppingCart()
        {
            if (this._items == null)
            {
                this._dateCreated = DateTime.Now;
            }
        }


        /// <summary>
        /// Adds a new item to the shopping cart
        /// </summary>
        

        public void Insert(int ProductID, double Price,
                          int Quantity, string ProductName,
                          string ProductImageUrl)
        {
            if (_items.ContainsKey(ProductID))
                _items[ProductID].Quantity += 1;
            else
            {
                CartItem NewItem = new CartItem();
                NewItem.ProductID = ProductID;
                NewItem.Quantity = Quantity;
                NewItem.Price = Price;
                NewItem.ProductName = ProductName;
                NewItem.ProductImageUrl = ProductImageUrl;
                _items.Add(ProductID,NewItem);
            }
            _lastUpdate = DateTime.Now;
        }




        /// <summary>
        /// Gets the sum total of the items' prices
        /// </summary>
        public double Total
        {
            get
            {
                double sum = 0.0;
                foreach (CartItem item in _items.Values)
                    sum += item.Price * item.Quantity;
                return sum;
            }
        }

      
        /// <summary>
        /// Removes an item from the shopping cart
        /// </summary>
        public void DeleteItem(int id)
        {
            if (_items.ContainsKey(id))
            {
                CartItem item = _items[id];
                item.Quantity -= 1;
                if (item.Quantity == 0)
                    _items.Remove(id);
            }
        }

        /// <summary>
        /// Removes all items of a specified product from the shopping cart
        /// </summary>
        public void DeleteProduct(int id)
        {
            if (_items.ContainsKey(id))
            {
                _items.Remove(id);
            }
        }

        /// <summary>
        /// Updates the quantity for an item
        /// </summary>
        public void UpdateItemQuantity(int id, int quantity)
        {
            if (_items.ContainsKey(id))
            {
                CartItem item = _items[id];
                item.Quantity = quantity;
                if (item.Quantity <= 0)
                    _items.Remove(id);
            }
        }

        /// <summary>
        /// Clears the cart
        /// </summary>
        public void Clear()
        {
            _items.Clear();
        }
    }
}


