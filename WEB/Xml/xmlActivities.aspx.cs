using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

public partial class Xml_xmlActivities : System.Web.UI.Page
{
    string tmpItem = "<date year='||Year||' month='||Month||' day='||Day||'>";
    string tmpItemDetail = "<activity categoryPath='Images/Categories/||CategoryPath||.png' title='||ActivityTitle||' activityDate='||ActivityDate||'" +
                           " time='' place='||Place||' location='||Location||' url='||URL||' target='_self' />";

    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = BUS.Activities.GetActivities();
        DataTable dtFiltered = dt.Clone();

        foreach (DataRow dr in dt.Rows) {
            dtFiltered = LIB.DataTableHelper.Filter(dt, "Date", dr["Date"].ToString());
            if ((dtFiltered.Rows.Count > 0) && (dtFiltered.Rows[0]["IsItemHeader"].ToString() == "0"))
                dr["IsItemHeader"] = 1;
        }

        StringBuilder sXml = new StringBuilder();

        sXml.Append("<?xml version='1.0' encoding='utf-8' ?>");
        sXml.Append("<data>");
        sXml.Append("<setup>");
        sXml.Append("<defaultText>");
        sXml.Append("<![CDATA[Etkinliklere ulaşmak için tarih seçin]]>");
        sXml.Append("</defaultText>");
        sXml.Append("</setup>");


        bool IsFirstRow = true;

        foreach (DataRow dr in dt.Rows)
        {

            if (dr["IsItemHeader"].ToString() == "1") {

                if (!IsFirstRow)
                    sXml.Append("</date>");                

                sXml.Append(addItem(
                            Convert.ToInt32(dr["Year"]), 
                            Convert.ToInt32(dr["Month"]), 
                            Convert.ToInt32(dr["Day"])
                            )
                        );
                }

            sXml.Append(addItemDetail(
                            Convert.ToInt32(dr["CategoryID"]), 
                            dr["ActivityTitle"].ToString(), 
                            dr["ActivityDate"].ToString(),
                            dr["Place"].ToString(), 
                            dr["LocationName"].ToString(), 
                            Convert.ToInt32(dr["ActivityID"]),
                            dr["CategoryName"].ToString()
                            )
                        );

            IsFirstRow = false;
        }

        sXml.Append("</date></data>");

        Response.Write(sXml);
    }

    protected int fullDate(string Year, string Month, string Day) {
        return Convert.ToInt32(Year + Month.PadLeft(2, '0') + Day.PadLeft(2, '0'));
    }

    protected string addItem(int Year, int Month, int Day) {
        string str = this.tmpItem;

        str = str.Replace("||Year||", Year.ToString());
        str = str.Replace("||Month||", Month.ToString());
        str = str.Replace("||Day||", Day.ToString());

        //return LIB.Util.PurifyStrFromTRChars(str);
        return str;
    }

    protected string addItemDetail(int CategoryID, string ActivityTitle, string ActivityDate, string Place, string Location, int ActivityID, string Category)
    {
        string str = this.tmpItemDetail;

        str = str.Replace("||CategoryPath||", CategoryID.ToString());
        str = str.Replace("||ActivityTitle||", LIB.Util.CodeRplc(ActivityTitle));
        str = str.Replace("||ActivityDate||", ActivityDate);
        str = str.Replace("||Place||", LIB.Util.CodeRplc(Place));
        str = str.Replace("||Location||", Location);
        str = str.Replace("||ActivityID||", ActivityID.ToString());
        str = str.Replace("||URL||", COM.Util.UrlMap(ActivityID, Category, ActivityTitle).Replace("~/", ""));

        //return LIB.Util.PurifyStrFromTRChars(str);
        return str;
    }
}