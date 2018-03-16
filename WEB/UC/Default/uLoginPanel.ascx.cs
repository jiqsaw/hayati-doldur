using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class UC_Default_uLoginPanel : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.smIsLogin)
            HasCookie();

        pnlOnline.Visible = (this.smIsLogin);
        pnlOffline.Visible = !pnlOnline.Visible;

        if (pnlOnline.Visible)
        {
            hlFullName.Text = this.smFirstName + " " + this.smSurname;
            hlFullName.NavigateUrl = this.strUserPage(this.smUserID);

            uUserImage1.SetPhotoSession(COM.Enum.FacebookPhotoSizes.square, this.smPhotoSquare);
            uUserImage1.IsLoginArea = true;

            int UpcomingActivitiesCount = BUS.Activities.GetUpcomingActivitesCount(this.smUserID);
            lblUpcomingAcitivitiesCount.Text = UpcomingActivitiesCount.ToString();
            pnlUpcomingActivities.Visible = UpcomingActivitiesCount > 0;
            pnlUpcomingActivitiesNone.Visible = !pnlUpcomingActivities.Visible;

            if (pnlUpcomingActivities.Visible)
            {
                pnlUpcomingActivities.Attributes.Add("onclick", "go('ActivityList.aspx?lt=2')");
                pnlUpcomingActivities.Style.Add("cursor", "pointer");
            }

            if (this.smIsFacebookUser)
                lnkLogOut.OnClientClick = "FB.Connect.logout(function() { });";
        }
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();

        Cookie cookie = new Cookie();
        cookie.Delete(COM.EnumUtil.Cookies.UserID);

        FacebookService F = new FacebookService();
        F.LogOff();

        this.qoDefaultPage();
    }

    private bool HasCookie()
    {
        Cookie C = new Cookie();
        int UserID;
        if (int.TryParse(C.Read(COM.EnumUtil.Cookies.UserID), out UserID))
        {
            DataTable dt = BUS.Users.GetUserDetail(UserID);
            if (dt.Rows.Count > 0)
            {
                string Email = dt.Rows[0]["Email"].ToString();
                string FirstName = dt.Rows[0]["FirstName"].ToString();
                string Surname = dt.Rows[0]["Surname"].ToString();
                string Photo = String.Empty;
                string PhotoSmall = String.Empty;
                string PhotoBig = String.Empty;
                string PhotoSquare = String.Empty;

                if ((dt.Rows[0]["Photo"] != DBNull.Value))
                {
                    Photo = dt.Rows[0]["Photo"].ToString();
                    PhotoSmall = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Small50);
                    PhotoBig = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Big200);
                    PhotoSquare = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Square50);
                }

                this.SetUserSession(false, UserID, Email, FirstName, Surname, Photo, PhotoSmall, PhotoBig, PhotoSquare);
                this.qoDefaultPage();
            }
        }
        return false;
    }

}
