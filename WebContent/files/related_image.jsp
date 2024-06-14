<%@ include file="../_include.jsp"%>

<%-- STRAPI doesn't always populate the formats field, hence the coalesce --%>
<sql:query var="media" dataSource="jdbc/STRAPITagLib">
	select
		url,
		coalesce(((formats->>'large')::jsonb)->>'url', url) as large,
		coalesce(((formats->>'small')::jsonb)->>'url', url) as small,
		coalesce(((formats->>'medium')::jsonb)->>'url', url) as medium,
		coalesce(((formats->>'thumbnail')::jsonb)->>'url', url) as thumbnail
	from
		strapi.files,
		strapi.files_related_morphs
	where files.id=files_related_morphs.file_id
	  and related_type = ?
	  and field = ?
	  and related_id = ?::int;
	<sql:param>${param.type}</sql:param>
	<sql:param>${param.field}</sql:param>
	<sql:param>${param.id}</sql:param>
</sql:query>
<c:forEach items="${media.rows}" var="row" varStatus="rowCounter">
	<c:choose>
		<c:when test="${param.format == 'large' }">
			<img src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.large}"/>
		</c:when>
		<c:when test="${param.format == 'small' }">
			<img src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.small}"/>
		</c:when>
		<c:when test="${param.format == 'medium' }">
			<img src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.medium}"/>
		</c:when>
		<c:when test="${param.format == 'thumbnail' }">
			<img src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.thumbnail}"/>
		</c:when>
		<c:when test="${param.format == 'auto' }">
			<img class="auto-image" src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.url}"/>
		</c:when>
		<c:when test="${param.format == 'auto-height' }">
			<img class="auto-image-height" src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.url}"/>
		</c:when>
		<c:otherwise>
			<img src="<util:propertyValue propertyFile="strapi" name="strapi-path"/>${row.url}" style="width: ${param.format}"/>
		</c:otherwise>
	</c:choose>
	${row.jsonb_pretty}
</c:forEach>
