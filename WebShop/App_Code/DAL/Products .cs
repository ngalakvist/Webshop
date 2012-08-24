using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Products
/// </summary>
public class Book : BaseEntity
{

    public int ProductID { get; set; }
    public decimal Price { get; set; }
    public string Name { get; set; }
    public string ISBN { get; set; }
    public string PictureUrl { get; set; }
    public string Decription { get; set; }
    public Book(int id, decimal price, string isbn, string picUrl)
    {
        id = ProductID;
        price = Price;
        isbn = ISBN;
        picUrl = PictureUrl;

    }

    public static IEnumerable<Product> GetBooks(int ProductID)
    {
        using (BooksDataContext bookData = new BooksDataContext())
        {
            return bookData.Products.Where(b => b.ProductID == ProductID).OrderBy(b => b.ProductID).ToList();
        }
    }

    public static void UpdateArticle(Product changedProduct)
    {
        //changedArticle.Title = ConvertNullToEmptyString(changedArticle.Title);
        //changedArticle.Abstract = ConvertNullToEmptyString(changedArticle.Abstract);
        //changedArticle.Body = ConvertNullToEmptyString(changedArticle.Body);
        //changedArticle.Country = ConvertNullToEmptyString(changedArticle.Country);
        //changedArticle.State = ConvertNullToEmptyString(changedArticle.State);
        //changedArticle.City = ConvertNullToEmptyString(changedArticle.City);


        //using (BooksDataContext bookData = new BooksDataContext())
        //{
        //    context.tbh_Articles.Attach(changedArticle, true);
        //    context.SubmitChanges();
        //}
    }

    public static void DeleteArticle(Product book)
    {
        using (BooksDataContext context = new BooksDataContext())
        {
            context.Products.Attach(book);
            context.Products.DeleteOnSubmit(book);
            context.SubmitChanges();
        }
     }

    public static void DeleteArticle(int bookID)
    {
        using (BooksDataContext bookData = new BooksDataContext())
        {
            Product book = bookData.Products.Where(a => a.ProductID == bookID).SingleOrDefault();
            bookData.Products.DeleteOnSubmit(book);
            bookData.SubmitChanges();
        }
       // //new RecordDeletedEvent("article", articleID, null).Raise();
    }


}
