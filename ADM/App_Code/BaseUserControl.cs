using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Collections;

/// <summary>
/// Summary description for BaseUserControl
/// </summary>
public class BaseUserControl : SM
{

    public string Config(COM.ADM.EnumUtil.Config Param)
    {
        return (ConfigurationManager.AppSettings[Param.ToString()] == null) ? String.Empty : ConfigurationManager.AppSettings[Param.ToString()].ToString();
    }

    public bool HasUserPermission(string PageName) {
        return (LIB.DataTableHelper.ExistValue(this.smPermissions, "PageName", PageName));
    }

    protected void CheckAll(Repeater rp, bool IsChecked)
    {
        foreach (RepeaterItem e in rp.Items)
        {
            if ((e.ItemType == ListItemType.Item) || (e.ItemType == ListItemType.AlternatingItem))
                foreach (Control c in e.Controls)
                    if (c.GetType().Name == "CheckBox")
                        ((CheckBox)c).Checked = IsChecked;
        }
    }

    protected void CheckAll(DataList dl, bool IsChecked)
    {
        foreach (DataListItem e in dl.Items)
        {
            if ((e.ItemType == ListItemType.Item) || (e.ItemType == ListItemType.AlternatingItem))
                foreach (Control c in e.Controls)
                    if (c.GetType().Name == "CheckBox")
                        ((CheckBox)c).Checked = IsChecked;
        }
    }

    protected ArrayList Checkeds(Repeater rp)
    {
        CheckBox ch;
        ArrayList arrCheckeds = new ArrayList();
        foreach (RepeaterItem e in rp.Items)
        {
            if ((e.ItemType == ListItemType.Item) || (e.ItemType == ListItemType.AlternatingItem))
                foreach (Control c in e.Controls)
                    if (c.GetType().Name == "CheckBox")
                    {
                        ch = (CheckBox)c;
                        if ((ch.ID != "chAll") && (ch.Checked))
                            arrCheckeds.Add(ch.Attributes["CommandValue"].ToString());
                    }
        }
        return arrCheckeds;
    }

    protected ArrayList Checkeds(DataList dl)
    {
        CheckBox ch;
        ArrayList arrCheckeds = new ArrayList();
        foreach (DataListItem e in dl.Items)
        {
            if ((e.ItemType == ListItemType.Item) || (e.ItemType == ListItemType.AlternatingItem))
                foreach (Control c in e.Controls)
                    if (c.GetType().Name == "CheckBox")
                    {
                        ch = (CheckBox)c;
                        if ((ch.ID != "chAll") && (ch.Checked))
                            arrCheckeds.Add(ch.Attributes["CommandValue"].ToString());
                    }
        }
        return arrCheckeds;
    } 
}