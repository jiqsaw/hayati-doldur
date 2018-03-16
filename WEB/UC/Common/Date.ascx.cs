using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIB;

public partial class UC_Common_Date : System.Web.UI.UserControl
{
    public int MinDate = 1910;
    public int MaxDate = DateTime.Now.Year;
    public bool IsBirthDate {
        set { 
            if (value)
                this.MaxDate = DateTime.Now.Year - 16; 
        }
    }

    public string ErrorMsgReq = "Lütfen Tarih Seçiniz";
    public string ErrorMsgCtrl = "Doğru bir tarih seçiniz";

    public string ErrorCssClass = "error";

    public string ValidationGrup = "";

    public bool IsReqValidate {
        set { cvDateReq.Visible = value; }
    }

    public DateTime Date
    {
        get {
            string Day = ddlDay.SelectedValue.PadLeft(2, '0');
            string Month = ddlMonth.SelectedValue.PadLeft(2, '0');
            string Year = ddlYear.SelectedValue.PadLeft(4, '0');
            
            try
            { return DateTime.Parse(Day + "." + Month + "." + Year); }
            
            catch (Exception) 
            { return DateTime.MinValue; }
        }
        set
        {
            string[] Date = value.ToString().Split('.');
            ddlDay.SelectedValue = Date[0];
            ddlMonth.SelectedValue = Date[1];
            ddlYear.SelectedValue = LIB.Util.Left(Date[2], 4);
        }
    }

    public string Text
    {
        get
        {
            string Day = ddlDay.SelectedValue.PadLeft(2, '0');
            string Month = ddlMonth.SelectedValue.PadLeft(2, '0');
            string Year = ddlYear.SelectedValue.PadLeft(4, '0');

            try
            {
                if ((Day == "00") || (Month == "00") || (Year == "0000"))
                    return "";
                return Day + "." + Month + "." + Year; 
            }

            catch (Exception)
            { return ""; }
        }
        set
        {
            if (value != "")
            {
                string[] Date = value.Split('.');
                ddlDay.SelectedValue = Date[0];
                ddlMonth.SelectedValue = Date[1];
                if (Date.Length > 2)
                    try
                    {
                        ddlYear.SelectedValue = LIB.Util.Left(Date[2], 4);
                    }
                    catch (Exception)
                    {}                    
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData();

            cvDateReq.ErrorMessage = this.ErrorMsgReq;
            cvDateCtrl.ErrorMessage = this.ErrorMsgCtrl;

            cvDateReq.CssClass = this.ErrorCssClass;
            cvDateCtrl.CssClass = this.ErrorCssClass;

            ddlDay.ValidationGroup = ValidationGrup;
            ddlMonth.ValidationGroup = ValidationGrup;
            ddlYear.ValidationGroup = ValidationGrup;
            cvDateReq.ValidationGroup = ValidationGrup;
            cvDateCtrl.ValidationGroup = ValidationGrup;
        }
    }

    public void FillData()
    {
        DataBindHelper.LoadNumberDDL(ref ddlDay, 31, true);
        DataBindHelper.LoadNumberDDL(ref ddlMonth, 12, true);
        DataBindHelper.LoadNumberDDL(ref ddlYear, -1 * MinDate, 1, -1 * MaxDate);

        foreach (ListItem li in ddlMonth.Items)
            li.Text = LIB.Util.MonthName(int.Parse(li.Value));

        ddlDay.Items.Insert(0, new ListItem("Gün", "0"));
        ddlMonth.Items.Insert(0, new ListItem("Ay", "0"));
        ddlYear.Items.Insert(0, new ListItem("Yıl", "0"));
    }

}