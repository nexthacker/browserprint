<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%><%-- These comments are to prevent excess whitespace in the output.
--%><%@page session="false"%><%--
--%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Libre-Panopticlick</title>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="PluginDetect.js"></script>
	<script type="text/javascript" src="fingerprint.js"></script>
	<script type="text/javascript">
	window.onload = function(){
		//PluginDetails
		$('<input>').attr({
    		type: 'hidden',
    		id: 'PluginDetails',
    		name: 'PluginDetails',
    		value: getPluginDetails()
		}).appendTo('#formdiv');
		
		//TimeZone
		$('<input>').attr({
    		type: 'hidden',
    		id: 'TimeZone',
    		name: 'TimeZone',
    		value: getTimeZone()
		}).appendTo('#formdiv');

		//ScreenDetails
		$('<input>').attr({
    		type: 'hidden',
    		id: 'ScreenDetails',
    		name: 'ScreenDetails',
    		value: getScreenDetails()
		}).appendTo('#formdiv');
		
		//Fonts
		$('<input>').attr({
    		type: 'hidden',
    		id: 'Fonts',
    		name: 'Fonts'
		}).appendTo('#formdiv');
		
		//SuperCookie
		$('<input>').attr({
    		type: 'hidden',
    		id: 'SuperCookie',
    		name: 'SuperCookie',
    		value: getSuperCookie()
		}).appendTo('#formdiv');
		
		//Time, for clock skew test.
		$('<input>').attr({
    		type: 'hidden',
    		id: 'Time',
    		name: 'Time',
    		value: getTime()
		}).appendTo('#formdiv');
		
		//Wait for a while before submitting the page.
		//We do this to allow time for the Flash to detect and write the fonts out.
		window.setTimeout(submitDetailsForm, 4000);
	}
	
	function submitDetailsForm(){
		$('#detailsForm').submit();
	}

	//For the FontList swf to call
	function populateFontList(fontArr)
	{
		var fonts = "";
		fonts = fontArr[0];
		for(var i = 1; i < fontArr.length; ++i){
			fonts += ", ";
			fonts += fontArr[i];
		}
		$('#Fonts').attr('value', fonts);
	}
	</script>
</head>
<body>
	<p>
		Please wait...
	</p>
	<form id="detailsForm" action="Test?js_enabled=true" method="POST">
		<div id="formdiv">
		</div>
	</form>
	<div>
		<object type="application/x-shockwave-flash" data="FontList.swf"></object>
	</div>
</body>
</html>