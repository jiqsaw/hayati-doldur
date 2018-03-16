using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using COM;

public class Cookie : System.Web.UI.UserControl
{
    private void Write(string CookieName, int TimeOut, string Value)
    {
        HttpRequest Request = HttpContext.Current.Request;
        HttpResponse Response = HttpContext.Current.Response;
        if (Request != null)
        {
            if (Request.Cookies[CookieName] != null) { Response.Cookies.Set(Request.Cookies[CookieName]); }
            else { Response.Cookies.Set(new HttpCookie(CookieName)); }

            Response.Cookies[CookieName][CookieName] = Value;
            Response.Cookies[CookieName].Expires = DateTime.Now.AddMinutes(TimeOut);
        }
    }
    public void Write(EnumUtil.Cookies CookieName, string Value) {
        Write(CookieName.ToString(), (int)CookieName, Value);
    }

    private string Read(string CookieName) {
        HttpRequest Request = HttpContext.Current.Request;
        return (Request.Cookies[CookieName] != null) ? Request.Cookies[CookieName][CookieName].ToString() : String.Empty;
    }

    public string Read(EnumUtil.Cookies Cookie) {
        return Read(Cookie.ToString());
    }

    private void Delete(string CookieName)
    {
        HttpRequest Request = HttpContext.Current.Request;
        if (this.Read(CookieName) != "")
            Request.Cookies.Remove(CookieName);
    }

    public void Delete(EnumUtil.Cookies Cookie)
    {
        Delete(Cookie.ToString());
    }
}