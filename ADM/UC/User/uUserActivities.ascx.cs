using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;

public partial class UC_User_uUserActivities :BaseUserControl
{
    public DataTable vsDataSource
    {
        get { return (ViewState["vsDataSource"] == null ? null : (DataTable)(ViewState["vsDataSource"])); }
        set { ViewState["vsDataSource"] = value; }
    }

    protected int ActivityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataBindHelper.BindDDL(ref ddlActivities, BUS.Activities.GetActivityListDetailTitle(), "ActivityTitle", "ActivityID", "0", "Etkinlik Seçiniz", "0");
            if (int.TryParse(Request.QueryString["j"], out ActivityID))
                BindData(); 
            else
                pnlPage.Visible = false;
        }
    }

    protected void BindData()
    {
        DataTable dtActivites = BUS.Activities.GetActivityDetail(this.ActivityID);
        if (dtActivites.Rows.Count > 0)
            ltlActivityTitle.Text = dtActivites.Rows[0]["ActivityTitle"].ToString();

        DataTable dt = BUS.Activities.GetActivityUsersDetails(this.ActivityID);

        this.vsDataSource = dt;

        if ((dt != null) && (dt.Rows.Count > 0))
        {
            pnlNoData.Visible = false;
            Paging1.GeneratePager(ref dt, rptList);
        }
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;

        ddlActivities.SelectedValue = this.ActivityID.ToString();
    }

    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            bool IsFacebookUser = bool.Parse(((Literal)e.Item.FindControl("ltlIsFacebookUser")).Text);
            Image imgUser = (Image)e.Item.FindControl("imgUser");

            imgUser.Visible = (imgUser.ImageUrl.Trim().Length > 0);

            if (!IsFacebookUser)
                imgUser.ImageUrl = "~/" + this.Config(COM.ADM.EnumUtil.Config.PathUserImg) + imgUser.ImageUrl;
        }
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DataTable dtSource = this.vsDataSource;

        DataTable dt = new DataTable();
        dt.Columns.Add("UyeID");
        dt.Columns.Add("Servis");
        dt.Columns.Add("BasvuruTarihi");
        dt.Columns.Add("Adi");
        dt.Columns.Add("Soyadi");
        dt.Columns.Add("FacebookKullanicisi");
        dt.Columns.Add("Cinsiyet");
        dt.Columns.Add("Email");
        dt.Columns.Add("Gsm");
        dt.Columns.Add("Sehir");
        dt.Columns.Add("EgitimDurumu");
        dt.Columns.Add("MezuniyetDurumu");
        dt.Columns.Add("Universite");
        dt.Columns.Add("EkKriter1");
        dt.Columns.Add("EkKriter2");
        dt.Columns.Add("EkKriter3");
        dt.Columns.Add("EkKriter4");
        dt.Columns.Add("EkKriter5");
        dt.Columns.Add("EkKriter6");

        DataRow dr;

        for (int i = 0; i < dtSource.Rows.Count; i++)
        {
            dr = dt.NewRow();
            dr["UyeID"] = dtSource.Rows[i]["UserID"].ToString();
            dr["Servis"] = (dtSource.Rows[i]["HasService"] == DBNull.Value) ? "" : (Convert.ToBoolean(dtSource.Rows[i]["HasService"]) ? "Var" : "Yok");
            dr["BasvuruTarihi"] = dtSource.Rows[i]["JoinDate"].ToString();
            dr["Adi"] = dtSource.Rows[i]["FirstName"].ToString();
            dr["Soyadi"] = dtSource.Rows[i]["Surname"].ToString();
            dr["FacebookKullanicisi"] = (dtSource.Rows[i]["IsFacebookUser"] == DBNull.Value) ? "" : (Convert.ToBoolean(dtSource.Rows[i]["IsFacebookUser"]) ? "Evet" : "Hayır");
            dr["Cinsiyet"] = (dtSource.Rows[i]["IsFemale"] == DBNull.Value) ? "" : (Convert.ToBoolean(dtSource.Rows[i]["IsFemale"]) ? "Bayan" : "Bay");
            dr["Email"] = dtSource.Rows[i]["Email"].ToString();
            dr["Gsm"] = dtSource.Rows[i]["Gsm"].ToString();
            dr["Sehir"] = dtSource.Rows[i]["LocationName"].ToString();
            dr["EgitimDurumu"] = dtSource.Rows[i]["EducationLevel"].ToString();
            dr["MezuniyetDurumu"] = dtSource.Rows[i]["EducationStatus"].ToString();
            dr["Universite"] = dtSource.Rows[i]["UniversityName"].ToString();
            dr["EkKriter1"] = dtSource.Rows[i]["Label1"].ToString() + " <b>" + dtSource.Rows[i]["Value1"].ToString() + "</b> ";
            dr["EkKriter2"] = dtSource.Rows[i]["Label2"].ToString() + " <b>" + dtSource.Rows[i]["Value2"].ToString() + "</b> ";
            dr["EkKriter3"] = dtSource.Rows[i]["Label3"].ToString() + " <b>" + dtSource.Rows[i]["Value3"].ToString() + "</b> ";
            dr["EkKriter4"] = dtSource.Rows[i]["Label4"].ToString() + " <b>" + dtSource.Rows[i]["Value4"].ToString() + "</b> ";
            dr["EkKriter5"] = dtSource.Rows[i]["Label5"].ToString() + " <b>" + dtSource.Rows[i]["Value5"].ToString() + "</b> ";
            dr["EkKriter6"] = dtSource.Rows[i]["Label6"].ToString() + " <b>" + dtSource.Rows[i]["Value6"].ToString() + "</b> ";
            dt.Rows.Add(dr);
        }

        LIB.ExportFile Export = new LIB.ExportFile();
        Export.Export(LIB.ExportFile.ExportTypes.Excel, "EtkinligeKatilanlar", dt);
    }
    protected void ddlActivities_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ActivityID = int.Parse(ddlActivities.SelectedValue);
        Response.Redirect("UserActivities.aspx?j=" + this.ActivityID.ToString());
    }
}