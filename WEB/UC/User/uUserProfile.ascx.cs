using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class UC_User_uUserProfile : BaseUserControl
{
    protected DataTable dtUserDetail;
    private bool IsNew = false;

    protected void Page_Init(object sender, EventArgs e)
    {
        txtBirthDate.IsBirthDate = true;
        txtBirthDate.ValidationGrup = "vgPersonalInfo";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!this.smIsLogin)
            this.qoLoginPage();

        FirstLogin();
        SuccessDeleteImage.Visible = false;
        
        BindData();

        this.dtUserDetail = BUS.Users.GetUserDetail(this.smUserID);
        if ((dtUserDetail != null) && (dtUserDetail.Rows.Count > 0))
        {
            SetPersonalInfo();
            SetMemberInfo();
            SetEducation();
            SetSocial();
            SetInterest();
        }
    }

    private void FirstLogin()
    {
        SuccessActivate.Visible = (Request.QueryString["Is"] != null);
    }

    private void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlLocationID, BUS.Locations.GetCities(), "LocationName", "LocationID", "0", "Lütfen Seçiniz", "0");

        LIB.DataBindHelper.BindDDL(ref ddlEducationLevelID, BUS.Educations.GetEducationLevels(), "EducationLevel", "EducationLevelID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlEducationStatusID, BUS.Educations.GetEducationStates(), "EducationStatus", "EducationStatusID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "0", "Lütfen Seçiniz", "0");

        LIB.DataBindHelper.BindRepeater(ref rptUserLocations, BUS.Users.GetUserLocations(this.smUserID));
    }

    private void SetPersonalInfo()
    {
        lnkDeleteImage.Visible = !(this.smPhoto == "");
        UserImage1.SetPhotoSession(COM.Enum.FacebookPhotoSizes.small, this.smPhoto);
        txtFirstName.Text = this.dtUserDetail.Rows[0]["FirstName"].ToString();
        txtSurname.Text = this.dtUserDetail.Rows[0]["Surname"].ToString();
        txtGsm.Text = (this.dtUserDetail.Rows[0]["Gsm"] == DBNull.Value) ? "" : this.dtUserDetail.Rows[0]["Gsm"].ToString();
        txtBirthDate.Text = (this.dtUserDetail.Rows[0]["BirthDate"] == DBNull.Value) ? "" : Convert.ToDateTime(this.dtUserDetail.Rows[0]["BirthDate"]).Date.ToShortDateString();
        if (this.dtUserDetail.Rows[0]["IsFemale"] != DBNull.Value)
        {
            rdFemale.Checked = (Convert.ToBoolean(this.dtUserDetail.Rows[0]["IsFemale"]));
            rdMale.Checked = !rdFemale.Checked;
        }
        ddlLocationID.SelectedValue = (this.dtUserDetail.Rows[0]["LocationID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["LocationID"].ToString();
    }
        
    private void SetMemberInfo()
    {
        txtEmail.Text = (this.dtUserDetail.Rows[0]["Email"] == DBNull.Value) ? "" : this.dtUserDetail.Rows[0]["Email"].ToString();
        txtEmail.ReadOnly = (txtEmail.Text.Trim().Length > 0);
        txtPassword.Text = (this.dtUserDetail.Rows[0]["Password"] == DBNull.Value) ? "" : LIB.Encryption.Decrypt(this.dtUserDetail.Rows[0]["Password"].ToString());
        txtPassword2.Text = txtPassword.Text;
    }

    private void SetEducation()
    {
        ddlEducationLevelID.SelectedValue = (this.dtUserDetail.Rows[0]["EducationLevelID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["EducationLevelID"].ToString();
        ddlEducationStatusID.SelectedValue = (this.dtUserDetail.Rows[0]["EducationStatusID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["EducationStatusID"].ToString();
        ddlUniversityID.SelectedValue = (this.dtUserDetail.Rows[0]["UniversityID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["UniversityID"].ToString();
    }

    private void SetSocial()
    {
        hlFacebookPermission.Visible = this.smIsFacebookUser;
        if (this.smIsFacebookUser)
        {
            try
            {
                FacebookService F = new FacebookService();
                hlFacebookPermission.Visible = !F.hasAppPermission(facebook.Types.Enums.Extended_Permissions.status_update);
            }
            catch (Exception)
            { }
        }

        txtFacebook.Text = this.dtUserDetail.Rows[0]["Facebook"].ToString();
        txtTwitter.Text = this.dtUserDetail.Rows[0]["Twitter"].ToString();
        txtFriendfeed.Text = this.dtUserDetail.Rows[0]["Friendfeed"].ToString();
    }

    private void SetInterest()
    {
        DataTable dtUserCategories = BUS.Users.GetUserCategories(this.smUserID);
        if ((dtUserCategories != null) && (dtUserCategories.Rows.Count > 0))
        {
            foreach (DataRow dr in dtUserCategories.Rows)
            {
                switch ((COM.Enum.Categories)(Convert.ToInt32(dr["CategoryID"])))
                {
                    case COM.Enum.Categories.Muzik:
                        chMuzik.Checked = true;
                        break;

                    case COM.Enum.Categories.Eglence:
                        chEglence.Checked = true;
                        break;

                    case COM.Enum.Categories.Festival:
                        chFestival.Checked = true;
                        break;

                    case COM.Enum.Categories.Kariyer:
                        chKariyer.Checked = true;
                        break;

                    case COM.Enum.Categories.KulturSanat:
                        chKulturSanat.Checked = true;
                        break;

                    case COM.Enum.Categories.Spor:
                        chSpor.Checked = true;
                        break;
                }
            }
        }
    }

    protected string PhotoUpload()
    {
        string PhotoName;
        string PhotoPath = this.Config(COM.ADM.EnumUtil.Config.AdminRoot) + this.Config(COM.ADM.EnumUtil.Config.PathUserImg);
        PhotoPath = PhotoPath.Replace("/", "\\");

        int MaxKBSize = int.Parse(this.Config(COM.ADM.EnumUtil.Config.MaxKBUser));

        if ((fuPhoto.PostedFile != null) && (PhotoPath != String.Empty) && (MaxKBSize > 0))
        {
            int FileSize = fuPhoto.PostedFile.ContentLength;

            if ((FileSize <= 0) || (FileSize > MaxKBSize)) return this.smPhoto;

            string FileName = fuPhoto.PostedFile.FileName;
            try
            {
                PhotoName = COM.Util.genUserPicName(this.smUserID, COM.Enum.PhotoSizes.Original) + LIB.Util.GetExtension(FileName);
                fuPhoto.PostedFile.SaveAs(COM.Util.genPhotoUrl(PhotoPath, PhotoName));

                ImageHelper ImgHelper = new ImageHelper();

                string PhotoSource = COM.Util.genPhotoUrl(PhotoPath, PhotoName);
                string SavePath = PhotoPath + COM.Util.genUserPicName(this.smUserID, COM.Enum.PhotoSizes.Big200) + LIB.Util.GetExtension(PhotoSource);
                ImgHelper.Resize(PhotoSource, SavePath, (int)COM.Enum.PhotoSizesW.Big200);

                PhotoSource = SavePath;
                string PhotoDefault = COM.Util.genUserPicName(this.smUserID, COM.Enum.PhotoSizes.Default100) + LIB.Util.GetExtension(PhotoSource);
                SavePath = PhotoPath + PhotoDefault;
                ImgHelper.Resize(PhotoSource, SavePath, (int)COM.Enum.PhotoSizesW.Default100);

                PhotoSource = SavePath;
                SavePath = PhotoPath + COM.Util.genUserPicName(this.smUserID, COM.Enum.PhotoSizes.Small50) + LIB.Util.GetExtension(PhotoSource); ;
                ImgHelper.Resize(PhotoSource, SavePath, (int)COM.Enum.PhotoSizesW.Small50);

                PhotoSource = SavePath;
                SavePath = PhotoPath + COM.Util.genUserPicName(this.smUserID, COM.Enum.PhotoSizes.Square50) + LIB.Util.GetExtension(PhotoSource);
                ImgHelper.Crop(PhotoSource, SavePath, 0, 0, (int)COM.Enum.PhotoSizesW.Square50, (int)COM.Enum.PhotoSizesW.Square50);

                this.smPhoto = PhotoDefault;
                this.smPhotoSmall = COM.Util.genPhotoNameOfSize(this.smPhoto, COM.Enum.PhotoSizes.Small50);
                this.smPhotoBig = COM.Util.genPhotoNameOfSize(this.smPhoto, COM.Enum.PhotoSizes.Big200);

                UserImage1.SetPhotoSession(COM.Enum.FacebookPhotoSizes.small);

                return this.smPhoto;
            }
            catch (Exception)
            {
                return this.smPhoto;
            }
        }
        return "";
    }

    protected void btnImgSave_Click(object sender, ImageClickEventArgs e)
    {
        string Photo = PhotoUpload();
        int Sex = 2;
        if (rdFemale.Checked) Sex = 1;
        else if (rdMale.Checked) Sex = 0;
        SuccessPersonalInfo.Visible = BUS.Users.UserPersonelUp(this.smUserID, Photo, txtFirstName.Text, txtSurname.Text, Sex, txtBirthDate.Text, int.Parse(ddlLocationID.SelectedValue), txtGsm.Text);
    }

    protected void btnImgMemberInfo_Click(object sender, ImageClickEventArgs e)
    {
        if ((txtEmail.Text != this.smEmail) && (BUS.Users.HasUser(txtEmail.Text)))
        {
            errHasEmail.Visible = true;
            SuccessMemberInfo.Visible = false;
        }
        else
        {
            errHasEmail.Visible = false;
            SuccessMemberInfo.Visible = BUS.Users.UserMemberInfoUp(this.smUserID, txtEmail.Text, txtPassword.Text);
        }
    }

    protected void btnImgEducation_Click(object sender, ImageClickEventArgs e)
    {
        SuccessEducation.Visible = BUS.Users.UserEducationUp(this.smUserID, int.Parse(ddlEducationLevelID.SelectedValue), int.Parse(ddlEducationStatusID.SelectedValue), int.Parse(ddlUniversityID.SelectedValue));
    }

    protected void btnImgInterest_Click(object sender, ImageClickEventArgs e)
    {
        ArrayList arrUserInterest = new ArrayList();
        if (chMuzik.Checked) arrUserInterest.Add((int)COM.Enum.Categories.Muzik);
        if (chEglence.Checked) arrUserInterest.Add((int)COM.Enum.Categories.Eglence);
        if (chFestival.Checked) arrUserInterest.Add((int)COM.Enum.Categories.Festival);
        if (chKariyer.Checked) arrUserInterest.Add((int)COM.Enum.Categories.Kariyer);
        if (chKulturSanat.Checked) arrUserInterest.Add((int)COM.Enum.Categories.KulturSanat);
        if (chSpor.Checked) arrUserInterest.Add((int)COM.Enum.Categories.Spor);

        bool IsSaved = BUS.Users.UserCategoriesUp(this.smUserID, arrUserInterest);

        if (IsSaved) {
            ArrayList arrUserLocations = new ArrayList();
            foreach (RepeaterItem ri in rptUserLocations.Items)
            {
                if ((ri.ItemType == ListItemType.Item) || (ri.ItemType == ListItemType.AlternatingItem))
                    foreach (Control c in ri.Controls)
                        if (c.GetType().Name == "CheckBox")
                            if (((CheckBox)c).Checked)
                                arrUserLocations.Add(((CheckBox)c).Attributes["LocationID"].ToString());
            }
            IsSaved = BUS.Users.UserLocationsUp(this.smUserID, arrUserLocations);
        }
        SuccessInterest.Visible = IsSaved;
    }

    protected void btnImgSocial_Click(object sender, ImageClickEventArgs e)
    {
        SuccessSocial.Visible = BUS.Users.UserSocailUp(this.smUserID, txtFacebook.Text, txtFriendfeed.Text, txtTwitter.Text);
    }

    protected void lnkDeleteImage_Click(object sender, EventArgs e)
    {
        if (BUS.Users.UserPhotoDel(this.smUserID))
        {
            SuccessDeleteImage.Visible = true;
            this.smPhoto = "";
            UserImage1.SetPhotoSession(COM.Enum.FacebookPhotoSizes.small);
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        Image img = new Image();
    }
    protected void rptUserLocations_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            int HasSelected = int.Parse(((Literal)e.Item.FindControl("ltlHasSelected")).Text);
            CheckBox chUserLocation = ((CheckBox)e.Item.FindControl("chUserLocation"));
            chUserLocation.Checked = (HasSelected != 0);
        }
    }
}