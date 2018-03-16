using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.MasterPage
{
    protected string SwfActivityCalendarPath = LIB.Encryption.base64Encode("Swf/ActivityCalendar.swf");
    protected string strAPI = ConfigurationManager.AppSettings["APIKey"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Head1.Controls.AddAt(0, new BaseTag(Request));
            if (Request != null)
                if (Request.Url != null)
                    if (Request.Url.AbsoluteUri.IndexOf("http://hayatidoldur") != -1)
                        Response.Redirect("http://www.hayatidoldur.com");
        }
        catch (Exception)
        {
        }

    }

}


public class BaseTag : HtmlControl
{
    public BaseTag(HttpRequest Request) : base("base")
    {
        string value = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath;
        base.Attributes.Add("href", value);
    }
}