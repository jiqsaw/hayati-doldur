﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Comment_uApprovedComments : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            uCommentList1.BindData(BUS.Comments.GetCommentsForAdmin(true, false));
    }
}