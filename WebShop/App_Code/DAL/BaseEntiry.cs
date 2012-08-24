using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;

/// <summary>
/// Summary description for BaseEntiry
/// </summary>
public abstract class BaseEntity
{
     

    protected static IPrincipal CurrentUser
    {
        get { return HttpContext.Current.User; }
    }

    protected static string CurrentUserName
    {
        get
        {
            if (CurrentUser.Identity.IsAuthenticated)
                return CurrentUser.Identity.Name;
            else
                return String.Empty;
        }
    }

    protected static string CurrentUserIP
    {
        get { return HttpContext.Current.Request.UserHostAddress; }
    }

    protected static string ConvertNullToEmptyString(string input)
    {
        return (input == null ? "" : input);
    }

     
}