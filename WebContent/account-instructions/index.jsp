<%@ include file="../_include.jsp"%>
<html>
<jsp:include page="../head.jsp">
	<jsp:param name="page" value="Account Instructions"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp" />
		<div class="row flex-nowrap main-block">
			<div class="block">
				<strapi:tenantAccountCreations ID="1">
					<h1><strapi:tenantAccountCreationsHeader/></h1>
					<strapi:foreachTenantAccountCreationsIntroLinks var="x">
						<strapi:tenantAccountCreationsIntroLinks>
							<jsp:include page="../blocks/text_right.jsp">
								<jsp:param name="id" value="${tag_tenantAccountCreationsIntroLinks.contentImageBlockRightId}"/>
								<jsp:param name="type" value="api::content-image-block-right.content-image-block-right"/>
								<jsp:param name="field" value="image"/>
								<jsp:param name="image_pos" value="1"/>
							</jsp:include>
						</strapi:tenantAccountCreationsIntroLinks>
					</strapi:foreachTenantAccountCreationsIntroLinks>
					
					<div class="center shade">
						<h3><strapi:tenantAccountCreationsBeforeStartingHeader/></h3>
						<util:markdown2html><strapi:tenantAccountCreationsBeforeStartingBlock/></util:markdown2html>
					</div>

					<h2><strapi:tenantAccountCreationsHeader2/></h2>
					<strapi:foreachTenantAccountCreationsInstructionsLinks var="x" sortCriteria="content_image_block_right_order">
						<strapi:tenantAccountCreationsInstructionsLinks>
							<jsp:include page="../blocks/text_right.jsp">
								<jsp:param name="id" value="${tag_tenantAccountCreationsInstructionsLinks.contentImageBlockRightId}"/>
								<jsp:param name="type" value="api::content-image-block-right.content-image-block-right"/>
								<jsp:param name="field" value="image"/>
								<jsp:param name="image_pos" value="1"/>
								<jsp:param name="width" value="11"/>
							</jsp:include>
						</strapi:tenantAccountCreationsInstructionsLinks>
					</strapi:foreachTenantAccountCreationsInstructionsLinks>
				</strapi:tenantAccountCreations>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>