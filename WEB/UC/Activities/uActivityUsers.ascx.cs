using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uActivityUsers : BaseUserControl
{
    private int ShowCount = 24;

    private bool IsF = false;
    private bool IsAll = false;

    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? 0 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (LIB.Util.IsNumeric(Request.QueryString["j"]))
            {

                this.ActivityID = Convert.ToInt32(Request.QueryString["j"]);

                if (LIB.Util.IsNumeric(Request.QueryString["IsF"]))
                    IsF = (Convert.ToInt32(Request.QueryString["IsF"]) == 1) ? true : false;

                if (LIB.Util.IsNumeric(Request.QueryString["IsAll"]))
                    IsAll = (Convert.ToInt32(Request.QueryString["IsAll"]) == 1) ? true : false;

                BindData();
            }
            else
                this.qoDefaultPage();
        }
    }

    private void BindData()
    {
        DataTable dt = BUS.Activities.GetActivityDetail(this.ActivityID, this.smUserID);
        DataTable dtActivityUsers = BUS.Activities.GetActivityUsers(this.ActivityID);
        DataTable dtFriendsAll = dtActivityUsers.Clone();

        if ((dt == null) || (dt.Rows.Count < 1))
            this.qoDefaultPage();
        else
        {
            hdCategory.Value = dt.Rows[0]["CategoryName"].ToString();
            lblActivityTitle.Text = dt.Rows[0]["ActivityTitle"].ToString();
            ltlActivityDate.Text = dt.Rows[0]["ActivityDate"].ToString();
            ltlPlace.Text = dt.Rows[0]["Place"].ToString();
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CATEGORYID||", dt.Rows[0]["CategoryID"].ToString());
            imgBus.Visible = (Convert.ToBoolean(dt.Rows[0]["HasService"]));
            Page.Title = "Hayatı Doldur - " + lblActivityTitle.Text;

            int i;
            if ((this.smIsLogin) && (this.smIsFacebookUser))
            {
                DataRow dr;
                int ExistIndex = -1;

                FacebookService F = new FacebookService();
                IList<facebook.Schema.user> Friends = F.gFriends();
                foreach (facebook.Schema.user user in Friends)
                {
                    ExistIndex = LIB.DataTableHelper.ExistValueIndex(dtActivityUsers, "FacebookID", user.uid.ToString());
                    if (ExistIndex != -1)
                    {
                        dr = dtFriendsAll.NewRow();
                        dr["UserID"] = dtActivityUsers.Rows[ExistIndex]["UserID"];
                        dr["FirstName"] = user.first_name;
                        dr["Surname"] = user.last_name;
                        dr["FacebookID"] = user.uid;
                        dr["Photo"] = user.pic_square;
                        dtFriendsAll.Rows.Add(dr);
                    }
                }
            }
            else
                pnlFriends.Visible = false;

            if (IsAll)
            {
                if (!IsF)
                {
                    dvOtherAllUsers.Visible = false;
                    uPagingAll.GeneratePager(ref dtActivityUsers, rptUsers, 52);
                    pnlFriends.Visible = false;
                    pnlAllUsers.Visible = true;
                }
                else {
                    dvOtherAllFriends.Visible = false;
                    uPagingAll.GeneratePager(ref dtFriendsAll, rptFriends, 52);
                    pnlFriends.Visible = true;
                    pnlAllUsers.Visible = false;
                }
                hlBackActivityUsers.Visible = true;
                hlBackActivityUsers.NavigateUrl = "~/ActivityUsers.aspx?j=" + this.ActivityID.ToString();
            }
            else
            {
                dvOtherAllUsers.Visible = dtActivityUsers.Rows.Count > ShowCount;
                lblAllUserCount.Text = dtActivityUsers.Rows.Count.ToString();

                DataTable dtUsers = dtActivityUsers.Clone();
                if (dtFriendsAll.Rows.Count > 0)
                {
                    DataTable dtFriends = dtFriendsAll.Clone();
                    i = 1;
                    foreach (DataRow dr1 in dtFriendsAll.Rows)
                    {
                        if (i > ShowCount)
                            break;
                        dtFriends.Rows.Add(dr1.ItemArray);
                        i++;
                    }

                    LIB.DataBindHelper.BindRepeater(ref rptFriends, dtFriends);

                    dvOtherAllFriends.Visible = dtFriendsAll.Rows.Count > ShowCount;
                    lblAllFriendsCount.Text = dtFriendsAll.Rows.Count.ToString();

                    if (dvOtherAllFriends.Visible)
                        hlAllFriends.NavigateUrl = "~/ActivityUsers.aspx?j=" + this.ActivityID.ToString() + "&IsF=1&IsAll=1";

                }
                else
                    pnlFriends.Visible = false;
                                
                i = 1;
                foreach (DataRow dr in dtActivityUsers.Rows)
                {
                    if (i > ShowCount)
                        break;
                    dtUsers.Rows.Add(dr.ItemArray);
                    i++;
                }

                LIB.DataBindHelper.BindRepeater(ref rptUsers, dtUsers);

                if (dvOtherAllUsers.Visible)
                    hlAllUsers.NavigateUrl = "~/ActivityUsers.aspx?j=" + this.ActivityID.ToString() + "&IsF=0&IsAll=1";

                hlBackActivityUsers.Visible = false;
            }

            hlBackActivity.NavigateUrl = this.strActivityDetailPage(this.ActivityID, hdCategory.Value, lblActivityTitle.Text);
        }
    }
}
