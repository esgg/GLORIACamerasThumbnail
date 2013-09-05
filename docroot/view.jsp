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

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  
<style>
  .thumbmail2 {border:1px; background-color:white; width: 96px; padding: 0.4em; margin: 0 0.4em 0.4em 0; text-align: center;}
  .thumbmailImage2 {width:80px; height:60px}
  .imageTitle2 {background-color:grey; color:white; margin: 0 0 0.4em}
 </style>
 <script>
 $(function() {
	    $( "#draggable" ).draggable({ revert: "invalid", helper: "clone"  });
	    $( "#draggable2" ).draggable({ revert: "invalid", helper: "clone"  });
	  }); 
  </script>

<table>
	<tr>
		<td>
			<div id="draggable" class="thumbmail2">
				<div class="imageTitle2">
					<p>Surveillance</p>
				</div>
				<div>
					<img class="thumbmailImage2" src="http://161.72.128.32/cgi-bin/faststream.jpg" width="80"/>
				</div>
			</div>
		</td>
		<td>
			<div id="draggable2" class="thumbmail2">
				<div class="imageTitle2">
					<p>Surveillance</p>
				</div>
				<div>
					<img class="thumbmailImage2" src="http://161.72.128.29/cgi-bin/faststream.jpg" width="80"/>
				</div>
			</div>		
		</td>
		<td>
			<div class="thumbmail2">
				<div class="imageTitle2">
					<p>Surveillance</p>
				</div>
				<div>
					<img class="thumbmailImage2" src="" width="80"/>
				</div>
			</div>
		</td>
	</tr>
</table>
