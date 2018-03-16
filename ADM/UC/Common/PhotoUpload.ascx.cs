using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class UC_Common_PhotoUpload : BaseUserControl
{
    private string _PhotoPath = String.Empty;
    protected int _MaxKBSize = 0;
    protected int _SizeW = 0;
    protected int _MinSizeH = 0;
    protected int _ThumbSizeW = 0;
    protected int _ThumbSizeH = 0;

    public COM.ADM.EnumUtil.Config PhotoPath
    { set { this._PhotoPath = this.Config(value); } }

    public COM.ADM.EnumUtil.Config MaxKBSize
    { set { this._MaxKBSize = int.Parse(this.Config(value)); } }

    public COM.ADM.EnumUtil.Config SizeW
    { set { this._SizeW = int.Parse(this.Config(value)); } }

    public COM.ADM.EnumUtil.Config MinSizeH
    { set { this._MinSizeH = int.Parse(this.Config(value)); } }

    public COM.ADM.EnumUtil.Config ThumbSizeW
    { set { this._ThumbSizeW = int.Parse(this.Config(value)); } }

    public COM.ADM.EnumUtil.Config ThumbSizeH
    { set { this._ThumbSizeH = int.Parse(this.Config(value)); } }
    
    public string PhotoSaveNameOrg
    {
        get { return (ViewState["PhotoSaveNameOrg"] == null ? "" : ViewState["PhotoSaveNameOrg"].ToString()); }
        set { ViewState["PhotoSaveNameOrg"] = value; }
    }

    public string PhotoSaveNameCropped
    {
        get { return (ViewState["PhotoSaveNameCropped"] == null ? "" : ViewState["PhotoSaveNameCropped"].ToString()); }
        set { ViewState["PhotoSaveNameCropped"] = value; }
    }

    public string PhotoSaveNameThumb
    {
        get { return (ViewState["PhotoSaveNameThumb"] == null ? "" : ViewState["PhotoSaveNameThumb"].ToString()); }
        set { ViewState["PhotoSaveNameThumb"] = value; }
    }

    public bool IsSaved
    {
        get { return (ViewState["IsSaved"] == null ? false : Convert.ToBoolean((ViewState["IsSaved"]))); }
        set { ViewState["IsSaved"] = value; }
    }
    public string PhotoName
    {
        get { return (ViewState["PhotoName"] == null ? "" : ViewState["PhotoName"].ToString()); }
        set { ViewState["PhotoName"] = value; }
    }

    protected void Page_Init(object sender, EventArgs e) {
        wci1.W = this._SizeW;
        wci1.H = this._MinSizeH;
        wci1.MinSize = this._SizeW.ToString() + "," + this._MinSizeH.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlError.Visible = false;
    }
    protected void btnPhotoSave_Click(object sender, EventArgs e)
    {
        SizeInitial(PhotoUpload());
    }

    protected void SizeInitial(bool IsShow) {
        if (IsShow)
        {
            pnlSizing.Visible = true;
            imgPhoto.ImageUrl = "~/" + this._PhotoPath + this.PhotoName;
        }
        pnlPhotoForm.Visible = !pnlSizing.Visible;
    }

    protected bool PhotoUpload()
    {
        if ((fuPhoto.PostedFile != null) && (this._PhotoPath != String.Empty) && (this._MaxKBSize > 0))
        {
            int FileSize = fuPhoto.PostedFile.ContentLength;

            if ((FileSize <= 0) || (FileSize > this._MaxKBSize)) return false;

            string FileName = fuPhoto.PostedFile.FileName;            

            try
            {
                this.PhotoName = this.PhotoSaveNameOrg + LIB.Util.GetExtension(FileName);
                fuPhoto.PostedFile.SaveAs(Request.MapPath(this._PhotoPath) + this.PhotoName);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        return false;
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        this.PhotoName = this.PhotoSaveNameCropped + LIB.Util.GetExtension(this.PhotoName);
        string PhotoFullPath = this._PhotoPath + this.PhotoName;
        wci1.Crop(PhotoFullPath);

        System.IO.FileStream fs = new System.IO.FileStream(Request.MapPath(Request.ApplicationPath + "/" + PhotoFullPath), FileMode.Open, FileAccess.ReadWrite);
        byte[] imgData = new byte[fs.Length];

        fs.Read(imgData, 0, int.Parse(fs.Length.ToString()));
        fs.Close();

        System.Drawing.Image img = System.Drawing.Image.FromStream(new MemoryStream(imgData));

        int OrgW = img.Width;
        int OrgH = img.Height;

        int newW = 0;
        int newH = 0;

        if (OrgW > this._SizeW)
        {
            newW = this._SizeW;
            newH = (int)(OrgH / ((double)OrgW / this._SizeW));

            Bitmap b = new Bitmap(newW, newH);
            Graphics g = Graphics.FromImage((System.Drawing.Image)b);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.DrawImage(img, 0, 0, newW, newH);
            g.Dispose();

            img = (System.Drawing.Image)b;
            img.Save(Request.MapPath(PhotoFullPath), System.Drawing.Imaging.ImageFormat.Jpeg);            
        }

        ImageHelper ImgHelper = new ImageHelper();

        string SavePath = this.PhotoSaveNameThumb + LIB.Util.GetExtension(this.PhotoName);
        SavePath = Request.MapPath(this._PhotoPath + SavePath);
        ImgHelper.Crop(Request.MapPath(PhotoFullPath), SavePath, 0, 0, _SizeW, (int)COM.Enum.PhotoSizeH.SizeActivityPhotoSmallH);

        this.IsSaved = true;
    }
}