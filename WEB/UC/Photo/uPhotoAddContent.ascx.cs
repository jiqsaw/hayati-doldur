using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Photo_uPhotoAddContent : BaseUserControl
{
    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? 0 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    public int PhotoNo {
        set {
            if (value <= 2)
            {
                if (value == 1)
                {
                    pnlWrap.Style.Add("display", "block");
                    pnlHead.Style.Add("display", "none");
                    pnlPhoto.Style.Add("display", "block");
                }
                else if (value == 2)
                {
                    pnlWrap.Style.Add("display", "block");
                    pnlHead.Style.Add("display", "block");
                    pnlPhoto.Style.Add("display", "none");
                }
            }
            else
            {
                pnlWrap.Style.Add("display", "none");
                pnlPhoto.Style.Add("display", "none");
            }

            ltlPhotoNo.Text = value.ToString();
        }
    }

    public string pnlWrapID {
        get { return pnlWrap.ClientID; }
    }

    public string pnlPhotoID
    {
        get { return pnlPhoto.ClientID; }
    }

    public string FileUploadID
    {
        get { return fuPhoto.ClientID; }
    }

    public bool HasFile
    {
        get { return fuPhoto.HasFile; }
    }

    public string Desc
    {
        get { return txtDesc.Text; }
    }

    public bool pnlForm { set { pnlPhoto.Visible = value; } }
    public bool pnlHeader { set { pnlHead.Visible = value; } }
    public bool pnlWrapper { set { pnlWrap.Visible = value; pnlWrap.Style.Add("display", (value) ? "block" : "none"); } }    

    public bool Succ
    {
        get { return SuccUpload.Visible; }
        set { SuccUpload.Visible = value; }
    }

    public bool Err
    {
        get { return ErrorUpload.Visible; }
        set { ErrorUpload.Visible = value; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hlPhotoAdd.Attributes.Add("onclick", "PhotoPanelShow('" + pnlPhoto.ClientID + "','" + pnlHead.ClientID +"')");
        }
    }

    public string Photo()
    {
        string PhotoName;
        string PhotoDBName;
        string PhotoSource;
        string SavePath;
        string PhotoPath = Request.MapPath(this.Config(COM.ADM.EnumUtil.Config.PathActivityImgByUser));

        int SizeActivityUserPhoto = int.Parse(this.Config(COM.ADM.EnumUtil.Config.SizeActivityUserPhoto));
        int SizeActivityUserPhotoThumb = int.Parse(this.Config(COM.ADM.EnumUtil.Config.SizeActivityUserPhotoThumb));
        int SizeActivityUserPhotoThumbSquare = int.Parse(this.Config(COM.ADM.EnumUtil.Config.SizeActivityUserPhotoThumbSquare));

        PhotoPath = PhotoPath.Replace("/", "\\");

        int MaxKBSize = int.Parse(this.Config(COM.ADM.EnumUtil.Config.MaxKBActivityPhoto));

        if ((fuPhoto.PostedFile != null && fuPhoto.PostedFile.ContentLength > 0) && (PhotoPath != String.Empty) && (MaxKBSize > 0))
        {
            int FileSize = fuPhoto.PostedFile.ContentLength;

            if ((FileSize <= 0) || (FileSize > MaxKBSize)) return this.smPhoto;

            string FileName = fuPhoto.PostedFile.FileName;
            try
            {
                PhotoName = COM.Util.genAcByUserName(this.ActivityID, this.smUserID, 0) + LIB.Util.GetExtension(FileName);
                fuPhoto.PostedFile.SaveAs(PhotoPath + PhotoName);

                ImageHelper ImgHelper = new ImageHelper();

                PhotoDBName = PhotoName.Replace(",0.", ",1.");
                PhotoSource = PhotoPath + PhotoName;
                SavePath = PhotoPath + PhotoDBName;
                ImgHelper.Resize(PhotoSource, SavePath, SizeActivityUserPhoto);

                PhotoSource = SavePath;
                SavePath = PhotoPath + PhotoName.Replace(",0.", ",2.");
                ImgHelper.Resize(PhotoSource, SavePath, SizeActivityUserPhotoThumb);

                PhotoSource = SavePath;
                SavePath = PhotoPath + PhotoName.Replace(",0.", ",3.");
                ImgHelper.Crop(PhotoSource, SavePath, 0, 0, SizeActivityUserPhotoThumbSquare, SizeActivityUserPhotoThumbSquare);

                return PhotoDBName;
            }
            catch (Exception)
            {
                return "";
            }
        }
        return "";
    }
}