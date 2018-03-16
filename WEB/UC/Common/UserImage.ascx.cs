using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_UserImage : BaseUserControl
{
    protected int _UserID = 0;
    protected long _uid = 0;
    protected string width = "";
    private COM.Enum.FacebookPhotoSizes _size = 0;

    public int UserID
    {
        set {
            hlUser.NavigateUrl = this.strUserPage(value);
            pnlFacebookImg.Attributes.Add("onclick", "go('User.aspx?j=" + value.ToString() + "')");
        }
    }

    public COM.Enum.FacebookPhotoSizes size
    {
        get { return this._size; }
        set { this._size = value; }
    }

    public long uid
    {
        get { return this._uid; }
        set { this._uid = value; }
    }

    public string Photo
    {
        set {
            if (value != "") {
                hlUser.Visible = true;
                imgPhoto.ImageUrl = this.ImageUrl(COM.Enum.ImageTypes.User, value.ToString(), (int)this.size);
            } 
            else {
                if (this.uid == 0)
                {
                    hlUser.Visible = true;
                    imgPhoto.ImageUrl = this.ImageUrl(COM.Enum.ImageTypes.User, value.ToString(), (int)this.size);
                }
                else {
                    hlUser.Visible = false;          
                }
            }
            pnlFacebookImg.Visible = !hlUser.Visible;
        }
    }

    public bool IsLoginArea
    {
        set
        {
            this.width = "25";
            imgPhoto.Width = new Unit(25);
        }
    }

    public void SetPhoto(int UserID, COM.Enum.FacebookPhotoSizes FacebookPhotoSize, long FacebookID, string Photo)
    {
        this.UserID = UserID;
        this.size = FacebookPhotoSize;
        this.uid = FacebookID;
        this.Photo = Photo;
    }

    public void SetPhotoSession(COM.Enum.FacebookPhotoSizes FacebookPhotoSize)
    {
        SetPhoto(this.smUserID, FacebookPhotoSize, this.smFacebookID, this.smPhoto);        
    }

    public void SetPhotoSession(COM.Enum.FacebookPhotoSizes FacebookPhotoSize, string Photo)
    {
        SetPhoto(this.smUserID, FacebookPhotoSize, this.smFacebookID, Photo);
    }
}