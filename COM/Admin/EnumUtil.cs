using System;
using System.Collections.Generic;
using System.Text;

namespace COM.ADM
{
    public class EnumUtil
    {
        public enum Config
        {
            EMailServer,
            ToAdmin,
            MailMain,
            PathUserImg,
            AdminRoot,
            PathActivityImg,
            PathActivityVideo,
            PathActivityImgByUser,
            MaxKBActivityPhoto,
            MaxKBActivityVideo,
            MaxKBUser,
            SizeActivityPhotoW,
            SizeActivityPhotoH,
            SizeActivityPhotoSmallH,
            SizeActivityPhotoGalleryThumbW,
            SizeActivityUserPhoto,
            SizeActivityUserPhotoThumb,
            SizeActivityUserPhotoThumbSquare
        }

        public enum Sess
        {
            IsLogin,
            AdminID,
            Permissions,
            Photo
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
            //PageType = 120,            
        }
    }
}
