<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FreeTextBox.ascx.cs" Inherits="UC_Common_FreeTextBox" %>

<script type="text/javascript" src="ckEditor/ckeditor.js"></script>
<script type="text/javascript" src="ckEditor/ckEditorPublish.js"></script>

<textarea cols="80" id="txtCKEditor" name="txtCKEditor" rows="10" runat="server"></textarea>

<script type="text/javascript">
    //<![CDATA[

    CKEDITOR.replace('<%=txtCKEditor.ClientID %>',
		{
		    skin: 'office2003'
		});

    //]]>
</script>