using System;
using System.Collections.Generic;
using System.Text;

namespace COM
{
    public class EnumUtil
    {
        public enum Config
        {
            APIKey,
            Secret,

            EMailServer,
            ToAdmin,
            MailServer,
            MailDisplayName,
            MailUser,
            MailPass,
            MailMain,
            
            AdminRoot,
            PathActivityImg,
            PathActivityImgByUser,
            PathActivityVideo,
            PathUserImg,
            PathPhotoGallery,

            MaxKBActivityPhoto,
            MaxKBActivityVideo,

            SizeActivityPhotoW,
            SizeActivityPhotoH,
            SizeActivityPhotoGalleryThumbW,
            SizeActivityUserPhoto,
            SizeActivityUserPhotoThumb,

            ListPageSize
        }

        public enum Sess
        {
            IsLogin,
            IsFacebookUser,
            UserID,
            FacebookID,
            Email,
            FirstName,
            Surname,
            Photo,
            PhotoSmall,
            PhotoBig,
            PhotoSquare
        }

        public enum CacheTypes
        {
            //Errors = 1,
        }

        public enum CachePeriods
        {
            //Errors = 100,
        }

        public enum Cookies
        {
            UserID = 1
        }
    }
}
