
<%
	/**
	 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
	 *
	 * This library is free software; you can redistribute it and/or modify it under
	 * the terms of the GNU Lesser General Public License as published by the Free
	 * Software Foundation; either version 2.1 of the License, or (at your option)
	 * any later version.
	 *
	 * This library is distributed in the hope that it will be useful, but WITHOUT
	 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
	 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
	 * details.
	 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<portlet:defineObjects />

<%@ page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.model.User" %>

<% 
	ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	User user = themeDisplay.getUser();
%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<style>
.thumbnail2 {
	border: 1px;
	background-color: white;
	width: 96px;
	padding: 0.4em;
	margin: 0 0.4em 0.4em 0;
	text-align: center;
}

.thumbnailImage2 {
	width: 80px;
	height: 60px
}

.imageTitle2 {
	background-color: grey;
	color: white;
	margin: 0 0 0.4em
}
</style>


<table id="camerasTable">
	<tr>
		<td>Cargando datos...</td>
	</tr>
</table>

<script>

var Base64 = {
		 
		// private property
		_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
	 
		// public method for encoding
		encode : function (input) {
			var output = "";
			var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
			var i = 0;
	 
			input = Base64._utf8_encode(input);
	 
			while (i < input.length) {
	 
				chr1 = input.charCodeAt(i++);
				chr2 = input.charCodeAt(i++);
				chr3 = input.charCodeAt(i++);
	 
				enc1 = chr1 >> 2;
				enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
				enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
				enc4 = chr3 & 63;
	 
				if (isNaN(chr2)) {
					enc3 = enc4 = 64;
				} else if (isNaN(chr3)) {
					enc4 = 64;
				}
	 
				output = output +
				this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
				this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
	 
			}
	 
			return output;
		},
	 
		// public method for decoding
		decode : function (input) {
			var output = "";
			var chr1, chr2, chr3;
			var enc1, enc2, enc3, enc4;
			var i = 0;
	 
			input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
	 
			while (i < input.length) {
	 
				enc1 = this._keyStr.indexOf(input.charAt(i++));
				enc2 = this._keyStr.indexOf(input.charAt(i++));
				enc3 = this._keyStr.indexOf(input.charAt(i++));
				enc4 = this._keyStr.indexOf(input.charAt(i++));
	 
				chr1 = (enc1 << 2) | (enc2 >> 4);
				chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
				chr3 = ((enc3 & 3) << 6) | enc4;
	 
				output = output + String.fromCharCode(chr1);
	 
				if (enc3 != 64) {
					output = output + String.fromCharCode(chr2);
				}
				if (enc4 != 64) {
					output = output + String.fromCharCode(chr3);
				}
	 
			}
	 
			output = Base64._utf8_decode(output);
	 
			return output;
	 
		},
	 
		// private method for UTF-8 encoding
		_utf8_encode : function (string) {
			string = string.replace(/\r\n/g,"\n");
			var utftext = "";
	 
			for (var n = 0; n < string.length; n++) {
	 
				var c = string.charCodeAt(n);
	 
				if (c < 128) {
					utftext += String.fromCharCode(c);
				}
				else if((c > 127) && (c < 2048)) {
					utftext += String.fromCharCode((c >> 6) | 192);
					utftext += String.fromCharCode((c & 63) | 128);
				}
				else {
					utftext += String.fromCharCode((c >> 12) | 224);
					utftext += String.fromCharCode(((c >> 6) & 63) | 128);
					utftext += String.fromCharCode((c & 63) | 128);
				}
	 
			}
	 
			return utftext;
		},
	 
		// private method for UTF-8 decoding
		_utf8_decode : function (utftext) {
			var string = "";
			var i = 0;
			var c = c1 = c2 = 0;
	 
			while ( i < utftext.length ) {
	 
				c = utftext.charCodeAt(i);
	 
				if (c < 128) {
					string += String.fromCharCode(c);
					i++;
				}
				else if((c > 191) && (c < 224)) {
					c2 = utftext.charCodeAt(i+1);
					string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
					i += 2;
				}
				else {
					c2 = utftext.charCodeAt(i+1);
					c3 = utftext.charCodeAt(i+2);
					string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
					i += 3;
				}
	 
			}
	 
			return string;
		}
	 
	};

	var user = "user";
	var password = "password";
	
		
	auth = Base64.encode(user+":"+password);

	//TODO hay que obtener el nombre del telescopio con el id de la reserva
	
	$.ajax({
			//url: 'https://ws.users.gloria-project.eu:8443/GLORIAAPI/telescopes/BART/devices/list?detailed=true',
			url: 'https://venus.datsi.fi.upm.es:8443/GLORIAAPI/experiments/context/87/parameters/cameras',
			method : 'GET',
			headers: {'Authorization': auth},
			dataType: 'json',
			success: function(json){
				
				drawCameras(json);
				
				
			}, 
			error: function(json){
				
			}
		});
	

	 function drawCameras(cameras) {
	
	
		 //Draw scam cameras


		var htmlCode;
	
		$("#camerasTable").empty();
	
		
		for ( var scamCont = 0; scamCont < cameras.scam.length; scamCont++) {
			htmlCode = htmlCode + "<tr><td><div id='"+cameras.scam[scamCont].name+"' class='thumbnail2'><div class='imageTitle2'><p>"
					+ cameras.scam[scamCont].name
					+ "</p></div><div><img title=\"<liferay-ui:message key='tooltip-camera' />\" class='thumbnailImage2' src='"+cameras.scam[scamCont].url+"' width='80' /></div></div></td></tr>";
		}
		
		for ( var ccdCont = 0; ccdCont < cameras.ccd.length; ccdCont++) {
			htmlCode = htmlCode + "<tr><td><div id='"+cameras.ccd[ccdCont].ccd+"' class='thumbnail2'><div class='imageTitle2'><p>"
					+ cameras.ccd[ccdCont].name
					+ "</p></div><div><img title=\"<liferay-ui:message key='tooltip-camera' />\" class='thumbnailImage2' src='"+cameras.ccd[ccdCont].cont+"' width='80' /></div></div></td></tr>";
		}

	
		
	
		$("#camerasTable").append(htmlCode);
		
		
		$(function() {
			$(".thumbnail2").draggable({
				revert : "invalid",
				helper : "clone"
			});
			$(".thumbnail2").tooltip();
		});
	
} 
	
</script>
