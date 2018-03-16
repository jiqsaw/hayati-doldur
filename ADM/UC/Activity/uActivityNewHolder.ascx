<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uActivityNewHolder.ascx.cs" Inherits="UC_Activity_uActivityNewHolder" %>
<%@ Register src="~/UC/Activity/uActivityNew.ascx" tagname="uActivityNew" tagprefix="uc1" %>
<%@ Register src="~/UC/Common/PhotoUpload.ascx" tagname="uPhotoUpload" tagprefix="uc2" %>
<%@ Register src="~/UC/Activity/uActivityNewRelations.ascx" tagname="uActivityNewRelations" tagprefix="uc3" %>
<%@ Register src="~/UC/Common/Success.ascx" tagname="uSuccess" tagprefix="Success" %>

<uc1:uActivityNew ID="uActivityNew1" runat="server" Visible="true" />
<uc2:uPhotoUpload ID="uPhotoUpload1" runat="server" Visible="false" PhotoPath="PathActivityImg" MaxKBSize="MaxKBActivityPhoto" SizeW="SizeActivityPhotoW" MinSizeH="SizeActivityPhotoH" ThumbSizeH="SizeActivityPhotoSmallH" />
<uc3:uActivityNewRelations ID="uActivityNewRelations1" runat="server" Visible="false" />
<Success:uSuccess ID="uSuccess1" runat="server" Visible="false" Title="KAYIT BAŞARIYLA GERÇEKLEŞTİ" Desc="Etkinliğiniz başarıyla kaydedilmiştir" />