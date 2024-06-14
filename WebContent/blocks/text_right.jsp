<%@ include file="../_include.jsp"%>

<c:set var="left" value="3"/>
<c:set var="right" value="9"/>

<c:if test="${not empty param.width}">
	<fmt:parseNumber var="width" value="${param.width}" integerOnly="true" parseLocale="en_US" />
	<c:set var="left" value="${12 - width}"/>
	<c:set var="right" value="${width}"/>
</c:if>

<fmt:parseNumber var="pos" value="${param.image_pos}" integerOnly="true" parseLocale="en_US" />

<strapi:contentImageBlockRights ID="${param.id}">
	<div class="row flex-nowrap block">
		<div class="col col-${left}">
			<c:choose>
				<c:when test="${not empty param.copy}">
					<div class="center">
						<a href="" onclick="
								var r = document.createRange();
								r.selectNode(document.getElementById('copy-${param.id}'));
								window.getSelection().removeAllRanges();
								window.getSelection().addRange(r);
								document.execCommand('copy');
								window.getSelection().removeAllRanges();
							">
							<jsp:include page="../files/related_image_pos.jsp">
								<jsp:param name="id" value="${param.id}" />
								<jsp:param name="type" value="${param.type}" />
								<jsp:param name="field" value="${param.field}" />
								<jsp:param name="pos" value="${pos}" />
								<jsp:param name="format" value="auto" />
							</jsp:include>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<jsp:include page="../files/related_image_pos.jsp">
						<jsp:param name="id" value="${param.id}" />
						<jsp:param name="type" value="${param.type}" />
						<jsp:param name="field" value="${param.field}" />
						<jsp:param name="pos" value="${pos}" />
						<jsp:param name="format" value="auto" />
					</jsp:include>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="copy-${param.id}" class="col col-${right}">
			<h4><strapi:contentImageBlockRightsHeader /></h4>
			<util:markdown2html><strapi:contentImageBlockRightsContent /></util:markdown2html>

			<c:if test="${not empty tag_contentImageBlockRights.url}">
					<c:choose>
						<c:when test="${param.link_format == 'button' }">
						<div class="center">
							<a class="btn btn-primary btn-n3c active" href="<strapi:contentImageBlockRightsUrl/>"><strapi:contentImageBlockRightsUrlLabel /></a>
						</div>
					</c:when>
						<c:otherwise>
							<a href="<strapi:contentImageBlockRightsUrl/>"><strapi:contentImageBlockRightsUrlLabel /></a>
						</c:otherwise>
					</c:choose>
			</c:if>
		</div>
	</div>
</strapi:contentImageBlockRights>
