<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script type="text/javascript" src="Scripts/Jquery/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.masonry.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.flash.min.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.sifr.js"></script>
    <script type="text/javascript" src="Scripts/Jquery/jquery.tipsy.js"></script>
    
    
    
    	
	<script type="text/javascript" src="jquery-1.3.2.js"></script>
	<script type="text/javascript" src="ui/ui.core.js"></script>
	<script type="text/javascript" src="ui/ui.datepicker.js"></script>

    <link type="text/css" href="base/jquery-ui-1.7.2.custom.css" rel="stylesheet" />    
	
	<script type="text/javascript">
	$(function() {	    
		$('#datepicker').datepicker( {
			changeMonth: true,
			changeYear: true,
			dateFormat: 'dd-mm-yy',
			monthNamesShort: ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'],
			dayNamesMin: ['Pz', 'Pa', 'Sa', 'Ça', 'Pe', 'Cu', 'Cmt'],
			regional: 'tr'
		});
    });

	</script>
	<style>
	body { font-size: 10px; }
	</style>
</head>
<body>
    <form id="form1" runat="server">
 <input type="text" id="datepicker">

    </form>
</body>
</html>
