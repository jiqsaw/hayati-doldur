using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;

public partial class UC_KampusRehberi_uKampusRehberiDetay : System.Web.UI.UserControl
{
    private DataTable dtOrientationDetail;
    private int OrientationUniversityID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Util.IsNumeric(Request.QueryString["j"]))
            {
                this.OrientationUniversityID = Convert.ToInt32(Request.QueryString["j"]);
                Bind();
            }
        }
    }

    protected void Bind()
    {
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Orientation.GetOrientationUniversities(), "UniversityName", "OrientationUniversityID", this.OrientationUniversityID.ToString());

        this.dtOrientationDetail = BUS.Orientation.GetOrientationDetail(this.OrientationUniversityID);
        if (dtOrientationDetail.Rows.Count > 0)
        {

            uUniversityItem1.OrientationUniversityID = Convert.ToInt32(this.dtOrientationDetail.Rows[0]["OrientationUniversityID"].ToString());
            uUniversityItem1.University = this.dtOrientationDetail.Rows[0]["UniversityName"].ToString();
            uUniversityItem1.Address = this.dtOrientationDetail.Rows[0]["Address"].ToString();
            uUniversityItem1.Web = this.dtOrientationDetail.Rows[0]["Web"].ToString();

            uKAMPUSLER.Bind(Filtered(COM.Enum.KampusRehberiParameters.KAMPUSLER));
            uYURTLAR.Bind(Filtered(COM.Enum.KampusRehberiParameters.YURTLAR));
            uUNV_ICI_KUTUPHANE.Bind(Filtered(COM.Enum.KampusRehberiParameters.UNV_ICI_KUTUPHANE));
            uCEVRE_KUTUPHANE_ADRES.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_KUTUPHANE_ADRES));
            uKONFERANS_SALONLARI.Bind(Filtered(COM.Enum.KampusRehberiParameters.KONFERANS_SALONLARI));
            uUNV_ICI_FOTOKOPICI.Bind(Filtered(COM.Enum.KampusRehberiParameters.UNV_ICI_FOTOKOPICI));
            uCEVRE_FOTOKOPICI.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_FOTOKOPICI));
            uUNIVERSITE_KULUPLERI.Bind(Filtered(COM.Enum.KampusRehberiParameters.UNIVERSITE_KULUPLERI));
            uKANTIN.Bind(Filtered(COM.Enum.KampusRehberiParameters.KANTIN));
            uCEVRE_CAFELER.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_CAFELER));
            uCEVRE_MARKETLER.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_MARKETLER));
            uALISVERIS_MERKEZLERI.Bind(Filtered(COM.Enum.KampusRehberiParameters.ALISVERIS_MERKEZLERI));
            uTIYATROLAR.Bind(Filtered(COM.Enum.KampusRehberiParameters.TIYATROLAR));
            uCEVRE_SINEMALAR.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_SINEMALAR));
            uCEVRE_BAR_KULUP.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_BAR_KULUP));
            uCEVRE_MUZE__TARIHI_MEKANLAR.Bind(Filtered(COM.Enum.KampusRehberiParameters.CEVRE_MUZE__TARIHI_MEKANLAR));
            uSPOR_SALONLARI.Bind(Filtered(COM.Enum.KampusRehberiParameters.SPOR_SALONLARI));
            uTAKSI_DURAKLARI.Bind(Filtered(COM.Enum.KampusRehberiParameters.TAKSI_DURAKLARI));
        }
    }



    private DataTable Filtered(COM.Enum.KampusRehberiParameters Parameter)
    {
        return DataTableHelper.Filter(this.dtOrientationDetail, "OrientationParameterID", ((int)Parameter).ToString());
    }
}