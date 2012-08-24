using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for ConfigSection
/// </summary>
public class ConfigSection: ConfigurationSection
{
	public ConfigSection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    [ConfigurationProperty("books", IsRequired = true)]
    public BookElement Books
    {
        get { return (BookElement)base["books"]; }
    }
    public class BookElement : ConfigurationElement
    {

    }

}
