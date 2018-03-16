using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace LIB
{
    public class DataTableHelper
    {
        /// <summary>
        /// LÝSTBOXTAKÝLERÝ DATATABLE A AKTARIR
        /// </summary>
        /// <param name="lb"></param>
        /// <returns></returns>
        public static DataTable ListboxToDataTable(System.Web.UI.WebControls.ListBox lb)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn(lb.DataValueField.ToString()));
            dt.Columns.Add(new DataColumn(lb.DataTextField.ToString()));
            DataRow dr;

            foreach (System.Web.UI.WebControls.ListItem li in lb.Items)
            {
                if (li.Selected)
                {
                    dr = dt.NewRow();
                    dr[lb.DataValueField.ToString()] = li.Value;
                    dr[lb.DataTextField.ToString()] = li.Text;
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

        public static bool ExistValue(DataTable dtSource, string ColumnName, string Value)
        {

            foreach (DataRow dr in dtSource.Rows)
            {
                if (dr[ColumnName].ToString() == Value)
                {
                    return true;
                }
            }
            return false;
        }

        public static int ExistValueIndex(DataTable dtSource, string ColumnName, string Value)
        {
            int i = 0;
            foreach (DataRow dr in dtSource.Rows)
            {
                if (dr[ColumnName].ToString() == Value)
                    return i;
                i++;
            }
            return -1;
        }

        public static DataTable Distinct(DataTable dtSource, string DataColumn) {
            return Distinct(dtSource, DataColumn, String.Empty);
        }
        public static DataTable Distinct(DataTable dtSource, string DataColumn, string IDColumn)
        {
            DataTable dtDistinct = new DataTable();
            if (IDColumn != String.Empty) { dtDistinct.Columns.Add(IDColumn); }
            dtDistinct.Columns.Add(DataColumn);

            foreach (DataRow dr in dtSource.Rows)
            {
                if (!ExistValue(dtDistinct, DataColumn, dr[DataColumn].ToString()))
                {
                    DataRow drNew = dtDistinct.NewRow();
                    if (IDColumn != String.Empty) { drNew[IDColumn] = dr[IDColumn].ToString(); } 
                    drNew[DataColumn] = dr[DataColumn].ToString();
                    dtDistinct.Rows.Add(drNew);
                }
            }
            return dtDistinct;
        }

        public static DataTable Filter(DataTable dtSource, string FilterColumnName, string FilterValue)
        {
            DataTable dtFilter = dtSource.Clone();
            foreach (DataRow dr in dtSource.Rows)
            {
                if (dr[FilterColumnName].ToString() == FilterValue) {
                    dtFilter.Rows.Add(dr.ItemArray);
                }
            }
            return dtFilter;
        }

    }
}