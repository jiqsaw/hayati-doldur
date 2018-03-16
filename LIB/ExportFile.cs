using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;

namespace LIB
{
    public class ExportFile
    {
        public enum ExportTypes
        {
            Txt,
            Word,
            Csv,
            Excel,
            Pdf
        }

        public void Export(ExportTypes ExportType, string FileName, DataTable dt)
        {
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new System.Web.UI.HtmlTextWriter(stringWrite);

            DataGrid grid = new DataGrid();
            grid.HeaderStyle.Font.Bold = true;
            grid.DataSource = dt;
            grid.DataBind();

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();

            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
            HttpContext.Current.Response.Charset = "windows-1254";
            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

            switch (ExportType)
            {
                case ExportTypes.Txt:
                    HttpContext.Current.Response.ContentType = "text/plain";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".txt");
                    break;
                case ExportTypes.Word:
                    HttpContext.Current.Response.ContentType = "application/vnd.word";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".doc");
                    break;
                case ExportTypes.Csv:
                    HttpContext.Current.Response.ContentType = "text/csv";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".csv");
                    break;
                case ExportTypes.Excel:
                    HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".xls");
                    break;
                case ExportTypes.Pdf:
                    HttpContext.Current.Response.ContentType = "application/pdf";
                    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".pdf");
                    break;
            }

            grid.RenderControl(htmlWrite);

            string strHeader = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<title></title>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1254\" />\n<style>\n</style>\n</head>\n<body>\n";

            HttpContext.Current.Response.Write(strHeader + stringWrite.ToString());

            HttpContext.Current.Response.End();
        }
    }
}
