using System;
using System.Collections.Generic;
using System.Text;

namespace COM
{
    public class Enum
    {
        public enum Categories { 
            Spor = 2,
            Kariyer = 3,
            Eglence = 4,
            Muzik = 5,
            KulturSanat = 6,
            Festival = 7
        }

        public enum CommentTypeCode 
        {
            Activity = 1,
            Photo = 2
        }

        public enum PhotoSizes
        {
            Original = 0,
            Default100 = 1,
            Big200 = 2,
            Small50 = 3,
            Square50 = 4,
            Thumb75 = 5
        }

        public enum PhotoSizesW
        {
            Default100 = 100,
            Big200 = 200,
            Small50 = 50,
            Square50 = 50
        }

        public enum PhotoSizeH
        {
            SizeActivityPhotoSmallH = 88
        }

        public enum ImageTypes
        {
            Activity = 1,
            User = 2,
            None = 3,
            ActivityByUser = 4
        }

        public enum EducationLevel
        {
            Lise = 2,
            Onlisans = 3,
            Lisans = 4,
            Lisansustu = 5,
            Doktora = 6
        }

        public enum ListType
        { 
            SearchResult = 1,
            UpComingActivities = 2
        }

        public enum FacebookPhotoSizes
        {
            thumb = 3,
            small = 1,
            normal = 2,
            square = 4
        }

        public enum KampusRehberiParameters
        {
            KAMPUSLER = 1,
            YURTLAR = 2,
            UNV_ICI_KUTUPHANE = 3,
            CEVRE_KUTUPHANE_ADRES = 4,
            KONFERANS_SALONLARI = 5,
            UNV_ICI_FOTOKOPICI = 6,
            CEVRE_FOTOKOPICI = 7,
            UNIVERSITE_KULUPLERI = 8,
            KANTIN = 9,
            CEVRE_CAFELER = 10,
            CEVRE_MARKETLER = 11,
            ALISVERIS_MERKEZLERI = 12,
            TIYATROLAR = 13,
            CEVRE_SINEMALAR = 14,
            CEVRE_BAR_KULUP = 15,
            CEVRE_MUZE__TARIHI_MEKANLAR = 16,
            SPOR_SALONLARI = 17,
            TAKSI_DURAKLARI = 18
        }
    }
}
