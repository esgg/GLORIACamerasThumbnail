package eu.gloria.website.liferay.experiments.online.portlets.cameras;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.util.bridges.mvc.MVCPortlet;

public class GloriaCamerasThumbnail extends MVCPortlet {

private static Log log = LogFactory.getLog(GloriaCamerasThumbnail.class);
	
	protected String viewJSP;
	protected String errorImageUrl;

	public void init() throws PortletException {
		
		viewJSP = getInitParameter("view-jsp");
		errorImageUrl = getInitParameter("error-image-url");
		
		super.init();	
	}
	
	public void doView(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		include(viewJSP, request, response);
		
	}
	
	public void serveResource(ResourceRequest request, ResourceResponse response)
			throws PortletException, IOException {
		
	}
	
	protected void include(String path, RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		PortletRequestDispatcher portletRequestDispatcher = getPortletContext()
				.getRequestDispatcher(path);
		if (portletRequestDispatcher == null) {
			log.error(path + " is not a valid include");
		} else {
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}
}
