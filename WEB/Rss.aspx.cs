using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Xml;
using System.Text;
using System.Data;

public partial class Rss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/xml";

        XmlTextWriter XTW = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        XTW.WriteStartDocument();

        //rss, channel, link, descripton gibi tanımlar 
        //bir standart tüm rss dosyalarında bu şekilde tanımlanırlar...
        XTW.WriteStartElement("rss");
        XTW.WriteAttributeString("version", "2.0");

        XTW.WriteStartElement("channel");
        XTW.WriteElementString("title", "hayatidoldur.com Etkinlikler");
        XTW.WriteElementString("link", "http://www.hayatidoldur.com/Rss.aspx");
        XTW.WriteElementString("description", "hayatidoldur.com | Hayatı Doldur");
        XTW.WriteElementString("copyright", "(c) 2009, Hayatı Doldur");
        XTW.WriteElementString("pubDate", "02/02/2010");
        XTW.WriteElementString("language", "tr-TR");
        XTW.WriteElementString("Author", "info@hayatidoldur.com");

        DataTable dt = BUS.Activities.GetActivities();

        string Title = "";
        string Description = "";
        string Link = "";
        string ImageUrl = "";

        foreach (DataRow dr in dt.Rows)
        {
            Title = dr["CategoryName"].ToString() + " / " + dr["ActivityTitle"].ToString();
            Description = dr["Place"].ToString() + " - " + dr["LocationName"].ToString() + " (" + dr["ActivityDate"].ToString() + ")";
            Link = "http://www.hayatidoldur.com/" + COM.Util.UrlMap(Convert.ToInt32(dr["ActivityID"]), dr["CategoryName"].ToString(), dr["ActivityTitle"].ToString()).Replace("~/", "");
            //ImageUrl = "http://www.hayatidoldur.com/Image.ashx?t=1&p=" + dr["ActivityPhoto"].ToString() + "&sz=1";
            ImageUrl = "http://admin.hayatidoldur.com/Upload/Images/Activities/" + dr["ActivityPhoto"].ToString();

            XTW.WriteStartElement("image");
            XTW.WriteElementString("url", ImageUrl);
            XTW.WriteElementString("title", dr["ActivityTitle"].ToString());
            XTW.WriteElementString("link", Link);
            XTW.WriteElementString("description", Title);
            XTW.WriteEndElement();

            XTW.WriteStartElement("item");
            XTW.WriteElementString("title",  Title);
            XTW.WriteElementString("description", Description);
            XTW.WriteElementString("link", Link);
            XTW.WriteElementString("pubDate", DateTime.Now.ToShortDateString());
            XTW.WriteEndElement();
        }

        XTW.WriteEndElement();
        XTW.WriteEndElement();
        XTW.WriteEndDocument();
        
        XTW.Flush();
        XTW.Close();
        Response.End();
    }
}
