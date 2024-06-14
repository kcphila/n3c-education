<%@ include file="../_include.jsp"%>
<html>
<jsp:include page="../head.jsp">
	<jsp:param name="page" value="Tenant Data Use Requests"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp" />
		<div class="main-block">
			<strapi:tenantDurRequests ID="1">
				<h1><strapi:tenantDurRequestsHeader/></h1>
				
				<h2><strapi:tenantDurRequestsRequestHeader/></h2>
				<util:markdown2html><strapi:tenantDurRequestsRequestBlock/></util:markdown2html>
				
				<h3><strapi:tenantDurRequestsOverviewHeader/></h3>
				<util:markdown2html><strapi:tenantDurRequestsOverviewBlock/></util:markdown2html>
				
				<h3><strapi:tenantDurRequestsProcessHeader/></h3>
				<h4><strapi:tenantDurRequestsPrereqHeader/></h4>
				<div class="center">
					<jsp:include page="../files/related_image_pos.jsp">
						<jsp:param name="id" value="1" />
						<jsp:param name="type" value="api::dur-request.dur-request" />
						<jsp:param name="field" value="prereq_graphic" />
						<jsp:param name="pos" value="1" />
						<jsp:param name="format" value="small" />
					</jsp:include>
				</div>
				<util:markdown2html><strapi:tenantDurRequestsPrereqBlock/></util:markdown2html>
				
				<h4><strapi:tenantDurRequestsSubmitHeader/></h4>
				<div class="center">
					<jsp:include page="../files/related_image_pos.jsp">
						<jsp:param name="id" value="1" />
						<jsp:param name="type" value="api::dur-request.dur-request" />
						<jsp:param name="field" value="submit_graphic" />
						<jsp:param name="pos" value="1" />
						<jsp:param name="format" value="small" />
					</jsp:include>
				</div>

				<util:markdown2html><strapi:tenantDurRequestsSubmitBlock/></util:markdown2html>
				<util:markdown2html><strapi:tenantDurRequestsSubmitBlock2/></util:markdown2html>
				<util:markdown2html><strapi:tenantDurRequestsSubmitBlock3/></util:markdown2html>
			</strapi:tenantDurRequests>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>