<%@ include file="_include.jsp"%>
<html>

<jsp:include page="head.jsp">
	<jsp:param name="page" value="Home"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp">
			<jsp:param value="3" name="navbar"/>
			<jsp:param value="3" name="profile"/>
		</jsp:include>
		<div class="main-block">
			<div class="block">
				<strapi:tenantProfiles ID="3">
					<h2><strapi:tenantProfilesLabel /></h2>
					<util:markdown2html><strapi:tenantProfilesDescription /></util:markdown2html>
				</strapi:tenantProfiles>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
