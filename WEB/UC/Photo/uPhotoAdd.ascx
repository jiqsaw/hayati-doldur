<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uPhotoAdd.ascx.cs" Inherits="UC_Photo_uPhotoAdd" %>
<%@ Register src="~/UC/Photo/uPhotoAddContent.ascx" tagname="uPhotoAddContent" tagprefix="PhotoAddContent" %>

<script type="text/javascript">

    function PhotoPanelShow(eShowID, eHideID) {        
        ShowHideChng(eShowID, eHideID);
        PhotoPanelShowCtrl();
    }

    function PhotoPanelShowCtrl() {
        var pnlWrap1 = '<%=uPhotoAddContent1.pnlWrapID %>';
        var pnlWrap2 = '<%=uPhotoAddContent2.pnlWrapID %>';
        var pnlWrap3 = '<%=uPhotoAddContent3.pnlWrapID %>';
        var pnlWrap4 = '<%=uPhotoAddContent4.pnlWrapID %>';
        var pnlWrap5 = '<%=uPhotoAddContent5.pnlWrapID %>';

        var PhotoPanel1 = '<%=uPhotoAddContent1.pnlPhotoID %>';
        var PhotoPanel2 = '<%=uPhotoAddContent2.pnlPhotoID %>';
        var PhotoPanel3 = '<%=uPhotoAddContent3.pnlPhotoID %>';
        var PhotoPanel4 = '<%=uPhotoAddContent4.pnlPhotoID %>';
        var PhotoPanel5 = '<%=uPhotoAddContent5.pnlPhotoID %>';

        PanelsPrep(pnlWrap4, PhotoPanel4, pnlWrap5);
        PanelsPrep(pnlWrap3, PhotoPanel3, pnlWrap4);
        PanelsPrep(pnlWrap2, PhotoPanel2, pnlWrap3);
        PanelsPrep(pnlWrap1, PhotoPanel1, pnlWrap2);
    }

    function PanelsPrep(eWrapID, ePhotoPanelID, eNextWrapID) {
        if (($get(eWrapID).style.display != 'none') && ($get(ePhotoPanelID).style.display != 'none'))
            $get(eNextWrapID).style.display = 'block';
    }

    function cvRequired(source, args) {
        args.IsValid = false;

        var UpFile1 = $get('<%=uPhotoAddContent1.FileUploadID %>').value;
        var UpFile2 = $get('<%=uPhotoAddContent2.FileUploadID %>').value;
        var UpFile3 = $get('<%=uPhotoAddContent3.FileUploadID %>').value;
        var UpFile4 = $get('<%=uPhotoAddContent4.FileUploadID %>').value;
        var UpFile5 = $get('<%=uPhotoAddContent5.FileUploadID %>').value;

        if ((UpFile1 != "") || (UpFile2 != "") || (UpFile3 != "") || (UpFile4 != "") || (UpFile5  != ""))
            args.IsValid = true;
    }
    
</script>

    <div class="add-photo">

	<h1>Fotoğraf Ekle</h1>
	<div class="header">
        <div class="row1">
            <asp:Image runat="server" ID="imgCategory" ImageUrl="~/Images/Categories/||CATEGORYID||.png" />
        </div>
        <div class="row2"><h5>
            <asp:Literal runat="server" ID="ltlActivityTitle"></asp:Literal>
        </h5></div>
        <div class="row3"><h4>
            <asp:Literal runat="server" ID="ltlPlace"></asp:Literal>
        </h4></div>
        <div class="row4"><h3>
            <asp:Literal runat="server" ID="ltlActivityDate"></asp:Literal>
        </h3></div>
        <div class="clear"></div>
    </div>
    <div class="warning">
        <p>Dosya büyüklüğü 6 MB'ı geçmeyen bir fotoğrafınızı, JPG veya GIF formatında yükleyin.</p>
        <p>Yüklediğiniz fotoğraflar onaylandıktan sonra sitede görüntülenecektir.</p>
    </div>
    
    <asp:HiddenField runat="server" ID="hdActivityID" Value="0" />
    
    <PhotoAddContent:uPhotoAddContent ID="uPhotoAddContent1" runat="server" PhotoNo="1" />
    <PhotoAddContent:uPhotoAddContent ID="uPhotoAddContent2" runat="server" PhotoNo="2" />
    <PhotoAddContent:uPhotoAddContent ID="uPhotoAddContent3" runat="server" PhotoNo="3" />
    <PhotoAddContent:uPhotoAddContent ID="uPhotoAddContent4" runat="server" PhotoNo="4" />
    <PhotoAddContent:uPhotoAddContent ID="uPhotoAddContent5" runat="server" PhotoNo="5" />
    
    <p class="pre">
        <asp:CustomValidator ID="cvRequired" runat="server" Display="Static" ClientValidationFunction="cvRequired" ErrorMessage="Devam etmeden önce uygun bir fotoğrafınızı yükleyin." ValidationGroup="vgPhoto" />    
    </p>
            
    <asp:ImageButton CssClass="yukle" runat="server" ID="BtnImgUpload" 
            ImageUrl="~/Images/yukle.jpg" ValidationGroup="vgPhoto" 
            onclick="BtnImgUpload_Click" />
    
    <asp:HyperLink CssClass="yukle" runat="server" ID="hlClose" ImageUrl="~/Images/close-btn.gif" NavigateUrl="javascript:window.close();"></asp:HyperLink>
    
    </div>
    
<script type="text/javascript">

    PhotoPanelShowCtrl();
    
</script>