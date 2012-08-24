using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Search : System.Web.UI.UserControl
{
    IEnumerable<Product> filteredResults;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void butSearch_Click(object sender, EventArgs e)
    {
        string[] searchTerms = txtSearch.Text.Split(new string[] { " ", ",", ";" }, StringSplitOptions.RemoveEmptyEntries); //gets all your search terms
        lv.Visible = true;
        foreach (string s in searchTerms)
            filteredResults = iterateThroughSearchTerm(s);
        lv.DataSource = filteredResults;
        lv.DataBind();

    }
    protected IEnumerable<Product> iterateThroughSearchTerm(string term)
    {
        BooksDataContext booksData = new BooksDataContext();
        var searchResults = from booksTitles in booksData.Products
                            where booksTitles.Name.Contains(term)
                            select booksTitles;
        return searchResults;
    }
}
