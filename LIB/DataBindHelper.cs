using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace LIB
{
    public class DataBindHelper
    {
        public static void BindListbox(ref System.Web.UI.WebControls.ListBox ListBoxControl, DataTable dt, string DataTextField, string DataValueField, params string[] SelectedValues)
        {
            ListBoxControl.DataTextField = DataTextField;
            ListBoxControl.DataValueField = DataValueField;
            ListBoxControl.DataSource = dt;
            ListBoxControl.DataBind();
            for (int i = 0; i < SelectedValues.Length; i++)
            {
                for (int j = 0; j < ListBoxControl.Items.Count; j++)
                {
                   ListBoxControl.Items[j].Selected = (ListBoxControl.Items[j].Value == SelectedValues[i].ToString());
                }
            }
        }

        /// <summary>
        /// Checkbox list DataBind
        /// </summary>
        /// <param name="chControl">chList</param>
        /// <param name="dt">Datasource Datatable</param>
        /// <param name="DataTextField">Görüntülenecek Hücre</param>
        /// <param name="DataValueField">Value Hücre</param>
        public static void BindCheckBoxList(ref System.Web.UI.WebControls.CheckBoxList chControl, DataTable dt, string DataTextField, string DataValueField)
        {
            chControl.DataTextField = DataTextField;
            chControl.DataValueField = DataValueField;
            chControl.DataSource = dt;
            chControl.DataBind();
        }

        public static void BindRadioButtonList(ref System.Web.UI.WebControls.RadioButtonList rdControl, DataTable dt, string DataTextField, string DataValueField, string SelectedValue)
        {
            rdControl.DataTextField = DataTextField;
            rdControl.DataValueField = DataValueField;
            rdControl.DataSource = dt;
            rdControl.DataBind();
            if (SelectedValue != String.Empty) {
                rdControl.SelectedValue = SelectedValue;
            }
        }


        /// <summary>
        /// DropDown Bound Baþlangýç Item YOK
        /// </summary>
        /// <param name="ddlControl">Dropdownlist</param>
        /// <param name="dt">Datasource Datatable</param>
        /// <param name="DataTextField">Görüntülenecek Hücre</param>
        /// <param name="DataValueField">Value Hücre</param>
        /// <param name="SelectedValue">Seçili Hücre</param>
        public static void BindDDL(ref System.Web.UI.WebControls.DropDownList ddlControl, DataTable dt, string DataTextField, string DataValueField, string SelectedValue)
        {
            BindDDL(ref ddlControl, dt, DataTextField, DataValueField, SelectedValue, "", "");
        }

        /// <summary>
        /// DropDown Bound Baþlangýç Item VAR
        /// </summary>
        /// <param name="ddlControl">Dropdownlist</param>
        /// <param name="dt">Datasource Datatable</param>
        /// <param name="DataTextField">Görüntülenecek Hücre</param>
        /// <param name="DataValueField">Value Hücre</param>
        /// <param name="SelectedValue">Seçili Hücre</param>
        /// <param name="InitialValueText">Baþlangýç Item Text</param>
        /// <param name="InitialValue">Baþlangýç item value</param>
        public static void BindDDL(ref System.Web.UI.WebControls.DropDownList ddlControl, DataTable dt, string DataTextField, string DataValueField, string SelectedValue, string InitialValueText, string InitialValue)
        {
            ddlControl.DataTextField = DataTextField;
            ddlControl.DataValueField = DataValueField;
            ddlControl.DataSource = dt;
            ddlControl.DataBind();
            if (InitialValueText != "")
            {
                ddlControl.Items.Insert(0, new System.Web.UI.WebControls.ListItem(InitialValueText, InitialValue));
            }
            if (SelectedValue != "")
            {
                ddlControl.SelectedValue = SelectedValue;
            }
        }

        /// <summary>
        /// DROPDOWNLIST I VALUE ÝLE TEXT AYNI OLACAK ÞEKÝLDE RAKAM ÝLE DOLDURUR.
        /// </summary>
        /// <param name="ddl">DropDownlList Ref Parametre</param>
        /// <param name="count">Kaça kadar?</param>
        public static void LoadNumberDDL(ref System.Web.UI.WebControls.DropDownList ddl, int count)
        {
            LoadNumberDDL(ref ddl, count, 1, 1, false);
        }

        /// <summary>
        /// DROPDOWNLIST I VALUE ÝLE TEXT AYNI OLACAK ÞEKÝLDE RAKAM ÝLE DOLDURUR.
        /// </summary>
        /// <param name="ddl">DropDownlList Ref Parametre</param>
        /// <param name="count">Kaça kadar?</param>
        /// <param name="count">Tek Hanelilerin Soluna '0' eklensin mi?</param>
        public static void LoadNumberDDL(ref System.Web.UI.WebControls.DropDownList ddl, int count, bool PadLeft)
        {
            LoadNumberDDL(ref ddl, count, 1, 1, PadLeft);
        }

        /// <summary>
        /// DROPDOWNLIST I VALUE ÝLE TEXT AYNI OLACAK ÞEKÝLDE RAKAM ÝLE ÝSTENEN SAYIDA ARTARAK DOLDURUR.
        /// </summary>
        /// <param name="ddl">DropDownlList Ref Parametre</param>
        /// <param name="Count">Kaça kadar?</param>
        /// <param name="Step">Kaç Kaç Artsýn?</param>
        /// <param name="StartNumber">Kaçtan Baþlasýn?</param>
        public static void LoadNumberDDL(ref System.Web.UI.WebControls.DropDownList ddl, int Count, int Step, int StartNumber)
        {
            LoadNumberDDL(ref ddl, Count, Step, StartNumber, false);
        }
        
        /// <summary>
        /// DROPDOWNLIST I VALUE ÝLE TEXT AYNI OLACAK ÞEKÝLDE RAKAM ÝLE ÝSTENEN SAYIDA ARTARAK DOLDURUR.
        /// </summary>
        /// <param name="ddl">DropDownlList Ref Parametre</param>
        /// <param name="Count">Kaça kadar?</param>
        /// <param name="Step">Kaç Kaç Artsýn?</param>
        /// <param name="StartNumber">Kaçtan Baþlasýn?</param>
        /// <param name="count">Tek Hanelilerin Soluna '0' eklensin mi?</param>
        public static void LoadNumberDDL(ref System.Web.UI.WebControls.DropDownList ddl, int Count, int Step, int StartNumber, bool PadLeft)
        {
            ddl.Items.Clear();
            int Var = 0;
            for (int i = StartNumber; i <= Count; i += Step)
            {
                Var = Math.Abs(i);
                if (!PadLeft)
                {
                    ddl.Items.Add(new System.Web.UI.WebControls.ListItem(Var.ToString(), Var.ToString()));
                }
                else
                {
                    ddl.Items.Add(new System.Web.UI.WebControls.ListItem(Var.ToString().PadLeft(2, '0'), Var.ToString().PadLeft(2, '0')));
                }
            }
        }

        public static void BindRepeater(ref System.Web.UI.WebControls.Repeater Repeater, DataTable dtData) {
            Repeater.DataSource = dtData;
            Repeater.DataBind();
        }

        public static void BindDatalist(ref System.Web.UI.WebControls.DataList DataList, DataTable dtData)
        {
            DataList.DataSource = dtData;
            DataList.DataBind();
        }
    }
}
