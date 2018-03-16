<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="UC_Common_Banner" %>

<div id="swfBanner" class="banner"></div>
<br /><br />
<a href="KampusRehberi.aspx"><img alt="" src="Images/KampusRehberiBanner.jpg"></a>
<br /><br />
<div id="swfBanner2" class="banner"></div>


<script type="text/javascript">
    function randomBanner() {
        return "HayatiDoldurBanner" + String(RandomNumber(2)) + ".swf";
    }
</script>

<script type="text/javascript">

    var swfPath = 'Swf/Banner/TribunSesi.swf';
    var swfDivID = "swfBanner";
    
    so = new SWFObject(swfPath, "Banner", "319", "171", "9", "#FFFFFF");
    so.addVariable("clickTAG", "TribununSesi.aspx");
    if ($get(swfDivID) != null) so.write(swfDivID);

    var sRndBannerName = "HayatiDoldurBanner" + '<%=this.Session["sRndBannerName"].ToString() %>' + ".swf";
    //sRndBannerName = randomBanner();
    swfPath = 'Swf/Banner/' + sRndBannerName
    //swfPath = 'Swf/Banner/Almanca.swf';
    swfDivID = "swfBanner2";

    so = new SWFObject(swfPath, "Banner2", "319", "171", "9", "#FFFFFF");
    //so.addVariable("clickTAG", "http://www.millermusicworld.com");
    if ($get(swfDivID) != null) so.write(swfDivID);
    
</script>