using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_btnJoinActivity : BaseUserControl
{
    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? 0 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    public string Category
    {
        get { return (ViewState["Category"] == null ? "" : ViewState["Category"].ToString()); }
        set { ViewState["Category"] = value; }
    }

    public string ActivityTitle
    {
        get { return (ViewState["ActivityTitle"] == null ? "" : ViewState["ActivityTitle"].ToString()); }
        set { ViewState["ActivityTitle"] = value; }
    }

    private int _UserCount;
    public int UserCount { set { _UserCount = value; } }

    private int _JoinCount;
    public int JoinCount { set { _JoinCount = value; } }

    private int _AlternateUserCount;
    public int AlternateUserCount { set { _AlternateUserCount = value; } }

    private bool _IsJoinUser;
    public bool IsJoinUser { set { _IsJoinUser = value; } }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (!this.smIsLogin)
                lnkUserActivity_Del.Visible = false;
            else
                lnkUserActivity_Del.Visible = _IsJoinUser;

            hlUserActivity_Add.Visible = !lnkUserActivity_Del.Visible;

            if (!lnkUserActivity_Del.Visible)
            {
                hlUserActivity_End.Visible = (_JoinCount >= (_UserCount + _AlternateUserCount));
                hlUserActivity_Add.Visible = !hlUserActivity_End.Visible;
            }

            if (hlUserActivity_Add.Visible)
                if (!this.smIsLogin)
                    mpUserActivityAdd.TargetControlID = hlUserActivity_Add.ID;
                else
                {
                    hlUserActivity_Add.NavigateUrl = "~/ActivityJoin.aspx?j=" + this.ActivityID.ToString();
                    mpUserActivityAdd.Visible = false;
                }
        }
    }

    protected void lnkUserActivity_Del_Click(object sender, EventArgs e)
    {
        if (BUS.Users.UserActivitiesDel(this.smUserID, this.ActivityID))
        {
            hlUserActivity_Add.Visible = true;
            hlUserActivity_Add.NavigateUrl = "ActivityJoin.aspx?j=" + this.ActivityID.ToString();
            hlUserActivity_End.Visible = false;
            this.qoActivityDetail(this.ActivityID, this.Category, this.ActivityTitle);
        }
    }
}