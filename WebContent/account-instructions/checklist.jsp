<%@ include file="../_include.jsp"%>
<html>
<jsp:include page="../head.jsp">
	<jsp:param name="page" value="Tenant Account Checklist"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp" />
		<div class="row flex-nowrap main-block">
			<div class="block">
				<strapi:tenantAccountChecklists ID="1">
					<h1><strapi:tenantAccountChecklistsHeader/></h1>
					<div class="center">
						<h2><strapi:tenantAccountChecklistsHeader2/></h2>
						<util:markdown2html><strapi:tenantAccountChecklistsIntro/></util:markdown2html>
					</div>
					<util:markdown2html><strapi:tenantAccountChecklistsChecklist/></util:markdown2html>
					<div class="center">
						<util:markdown2html><strapi:tenantAccountChecklistsTrailer/></util:markdown2html>
					</div>
				</strapi:tenantAccountChecklists>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>