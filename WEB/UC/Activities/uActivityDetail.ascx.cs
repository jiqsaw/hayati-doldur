using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;
using System.Text;

public partial class UC_Activities_uActivityDetail : BaseUserControl
{
    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? 0 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {

            btnImgCommentSend.Attributes.Add("onclick", Util.DblClickBlock(this.Page, btnImgCommentSend));

            if (LIB.Util.IsNumeric(Request.QueryString["j"]))
            {

                this.ActivityID = Convert.ToInt32(Request.QueryString["j"]);

                BindData();
                Hit();

                btnPhotoAdd1.ActivityID = this.ActivityID;

                if (this.smIsLogin)
                    UserLog();
            }
            else
                this.qoDefaultPage();
        }
    }

    private void UserLog()
    {
        BUS.Users.UserLogsIn(this.smUserID, this.ActivityID);
    }

    private void Hit()
    {
        BUS.Activities.ActivitesHitUp(this.ActivityID);
    }

    private void BindData()
    {
        DataTable dt = BUS.Activities.GetActivityDetail(this.ActivityID, this.smUserID);
        if ((dt == null) || (dt.Rows.Count < 1))
            this.qoDefaultPage();
        else
        {
            lblActivityTitle.Text = dt.Rows[0]["ActivityTitle"].ToString();
            hdCategory.Value = dt.Rows[0]["CategoryName"].ToString();
            ltlActivityDate.Text = dt.Rows[0]["ActivityDate"].ToString();
            ltlPlace.Text = dt.Rows[0]["Place"].ToString();
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CATEGORYID||", dt.Rows[0]["CategoryID"].ToString());
            dvDetail.InnerHtml = dt.Rows[0]["ActivityDetail"].ToString();
            imgPhoto.ImageUrl = this.ImageUrl(COM.Enum.ImageTypes.Activity, dt.Rows[0]["ActivityPhoto"].ToString(), COM.Enum.PhotoSizes.Default100);

            imgBus.Visible = (Convert.ToBoolean(dt.Rows[0]["HasService"]));

            uComment1.CommentTypeID = this.ActivityID;
            uActivityPhotos1.ActivityID = this.ActivityID;
            uActivityNews1.ActivityID = this.ActivityID;

            pnlNoLogin.Visible = !this.smIsLogin;

            uActivityRelations1.ActivityID = Convert.ToInt32(dt.Rows[0]["ActivityID"]);

            lblCommentCount.Text = dt.Rows[0]["CommentCount"].ToString();
            int JoinCount = Convert.ToInt32(dt.Rows[0]["JoinCount"]);
            lblJoinCount.Text = JoinCount.ToString();

            int UserCount = Convert.ToInt32(dt.Rows[0]["UserCount"]);
            int AlternateUserCount = Convert.ToInt32(dt.Rows[0]["AlternateUserCount"]);
            bool IsJoinUser = ((Convert.ToInt32(dt.Rows[0]["IsJoinUser"])) > 0);

            if (Convert.ToDateTime(dt.Rows[0]["ActivityEndDate"]) < DateTime.Now.AddDays(-1))
            {
                btnJoinActivity1.Visible = false;
                hlShareThis.Visible = false;
            }
            else
            {
                btnJoinActivity1.ActivityID = this.ActivityID;
                btnJoinActivity1.UserCount = UserCount;
                btnJoinActivity1.JoinCount = JoinCount;
                btnJoinActivity1.AlternateUserCount = AlternateUserCount;
                btnJoinActivity1.IsJoinUser = IsJoinUser;
                btnJoinActivity1.Category = hdCategory.Value;
                btnJoinActivity1.ActivityTitle = lblActivityTitle.Text;
            }

            Page.Title = "Hayatı Doldur - " + lblActivityTitle.Text;

            hlActivityUsers.NavigateUrl = "~/ActivityUsers.aspx?j=" + this.ActivityID.ToString();
        }
        ltlCommentSended.Visible = LIB.Util.IsNumeric(Request.QueryString["Cmnt"]);
    }

    protected void btnImgCommentSend_Click(object sender, ImageClickEventArgs e)
    {
        if (BUS.Comments.Insert(this.smUserID, this.ActivityID, COM.Enum.CommentTypeCode.Activity, txtComment.Text, txtCommentByName.Text, txtCommentByEmail.Text, chIsNotifyMe.Checked))
        {
            //ltlCommentSended.Visible = true;
            DataTable dtNotifyMails = BUS.Comments.GetCommentNotifyEmails(this.ActivityID);

            try
            {
                Mailing Mail = new Mailing();

                foreach (DataRow dr in dtNotifyMails.Rows)
                    Mail.SendCommentNotify(dtNotifyMails.Rows[0]["Email"].ToString(), txtComment.Text, lblActivityTitle.Text, this.strActivityDetailPage(this.ActivityID, hdCategory.Value, lblActivityTitle.Text));

            }
            catch (Exception)
            {}
            Response.Redirect(this.strActivityDetailPage(this.ActivityID, hdCategory.Value, lblActivityTitle.Text) + "?Cmnt=1");
        }
    }
}