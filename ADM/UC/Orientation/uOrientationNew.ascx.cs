using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Orientation_uOrientationNew : BaseUserControl
{
    private int OrientationUniversityID = 0;

    public DataTable vwValues
    {
        get { return (ViewState["vwValues"] == null ? null : (DataTable)(ViewState["vwValues"])); }
        set { ViewState["vwValues"] = value; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindParameters();
            if (int.TryParse(Request.QueryString["j"], out OrientationUniversityID))
                FillData();

        }
    }

    private DataTable prepValues() 
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Index");
        dt.Columns.Add("OrientationParameterID");
        dt.Columns.Add("OrientationParameterValue");
        dt.Columns.Add("OrientationParameterDesc");
        return dt;
    }

    private void AddValues(int OrientationParameterID, string OrientationParameterValue, string OrientationParameterDesc) {
        DataTable dt = this.vwValues == null ? prepValues() : this.vwValues;
        DataRow dr = dt.NewRow();
        dr["Index"] = dt.Rows.Count;
        dr["OrientationParameterID"] = OrientationParameterID;
        dr["OrientationParameterValue"] = OrientationParameterValue;
        dr["OrientationParameterDesc"] = OrientationParameterDesc;
        dt.Rows.Add(dr);
        this.vwValues = dt;
    }

    private void DelValues(int Index) {
        foreach (DataRow dr in this.vwValues.Rows)
        {
            if (Convert.ToInt32(dr["Index"]) == Index)
            {
                this.vwValues.Rows.Remove(dr);
                break;
            }
        }
    }

    private void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "0", "Lütfen Seçiniz", "0");        
    }

    protected void BindParameters() {
        DataTable dtOrientationParameters = BUS.Orientation.GetOrientationParameters();
        LIB.DataBindHelper.BindRepeater(ref rptOrientationParameters, dtOrientationParameters);
    }

    protected void FillData()
    {
        DataTable dt = BUS.Orientation.GetOrientationDetail(this.OrientationUniversityID);
        if (dt.Rows.Count > 0)
        {
            hdOrientationUniversityID.Value = this.OrientationUniversityID.ToString();
            ddlUniversityID.SelectedValue = dt.Rows[0]["UniversityID"].ToString();
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtWeb.Text = dt.Rows[0]["Web"].ToString();
            txtUlasim.Text = dt.Rows[0]["Ulasim"].ToString();

            foreach (DataRow dr in dt.Rows)
                AddValues(Convert.ToInt32(dr["OrientationParameterID"]), dr["OrientationParameterValue"].ToString(), dr["OrientationParameterDesc"].ToString());

            foreach (RepeaterItem item in rptOrientationParameters.Items)
            {
                int OrientationParameterID = Convert.ToInt32(((HiddenField)item.FindControl("hdOrientationParameterID")).Value);
                Repeater rptOrientationParameterValues = (Repeater)item.FindControl("rptOrientationParameterValues");                
                BindValues(ref rptOrientationParameterValues, OrientationParameterID);
            }
        }      
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        bool IsSave = BUS.Orientation.Save(int.Parse(hdOrientationUniversityID.Value), int.Parse(ddlUniversityID.SelectedValue), txtAddress.Text, txtWeb.Text, txtUlasim.Text, this.vwValues);
        if (IsSave)
        {
            if (hdOrientationUniversityID.Value != "")
                succSave.Visible = true;
            else
                succUpdate.Visible = true;
        }
        else
            err.Visible = true;
        //pnlForm.Visible = succSave.Visible || succUpdate.Visible;
    }

    protected void rptOrientationParameters_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            if (e.CommandName == "Add")
            {
                int OrientationParameterID = Convert.ToInt32(((HiddenField)e.Item.FindControl("hdOrientationParameterID")).Value);
                TextBox OrientationParameterValue = (TextBox)e.Item.FindControl("txtOrientationParameterValue");
                TextBox OrientationParameterDesc = (TextBox)e.Item.FindControl("txtOrientationParameterDesc");

                AddValues(OrientationParameterID, OrientationParameterValue.Text, OrientationParameterDesc.Text);
                
                Repeater rptOrientationParameterValues = (Repeater)e.Item.FindControl("rptOrientationParameterValues");
                BindValues(ref rptOrientationParameterValues, OrientationParameterID);

                OrientationParameterValue.Text = "";
                OrientationParameterDesc.Text = "";
            }
        }
    }

    protected void rptOrientationParameters_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            int OrientationParameterID = Convert.ToInt32(((HiddenField)e.Item.FindControl("hdOrientationParameterID")).Value);
            Repeater rptOrientationParameterValues = (Repeater)e.Item.FindControl("rptOrientationParameterValues");
        }
    }

    protected void rptOrientationParameterValues_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            int Index = Convert.ToInt32(e.CommandArgument);            
            int OrientationParameterID = Convert.ToInt32(((HiddenField)e.Item.FindControl("hdOrientationParameterID")).Value);

            switch (e.CommandName)
            {
                case "Edit":
                    DelValues(Index);
                    Literal ltlOrientationParameterValue = ((Literal)e.Item.FindControl("ltlOrientationParameterValue"));
                    Literal ltlOrientationParameterDesc = ((Literal)e.Item.FindControl("ltlOrientationParameterDesc"));
                    foreach (RepeaterItem item in rptOrientationParameters.Items)
                    {
                        if (((HiddenField)item.FindControl("hdOrientationParameterID")).Value == OrientationParameterID.ToString())
                        {
                            ((TextBox)item.FindControl("txtOrientationParameterValue")).Text = ltlOrientationParameterValue.Text;
                            ((TextBox)item.FindControl("txtOrientationParameterDesc")).Text = ltlOrientationParameterDesc.Text;
                        }
                    }
                break;
                case "Delete":
                DelValues(Index);
                break;
            }

            foreach (RepeaterItem item in rptOrientationParameters.Items)
            {
                if (((HiddenField)item.FindControl("hdOrientationParameterID")).Value == OrientationParameterID.ToString())
                {
                    Repeater rpt = ((Repeater)item.FindControl("rptOrientationParameterValues"));
                    BindValues(ref rpt, OrientationParameterID);
                }
            }
        }
    }    

    private void BindValues(ref Repeater rpt, int OrientationParameterID)
    {        
        if (this.vwValues != null)
        {
            DataTable dtParameterValues = LIB.DataTableHelper.Filter(this.vwValues, "OrientationParameterID", OrientationParameterID.ToString());
            dtParameterValues.DefaultView.Sort = "OrientationParameterValue";
            dtParameterValues = dtParameterValues.DefaultView.ToTable();
            LIB.DataBindHelper.BindRepeater(ref rpt, dtParameterValues);
        }
    }

}