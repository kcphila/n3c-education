<%@ include file="_include.jsp"%>
<html>
<jsp:include page="head.jsp" />

<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />
		<div class="main-block">
			<h2>URL Redirects and Rewrites</h2>
			<a href="redirectMap" class="btn btn-primary btn-n3c active" role="button" aria-pressed="true">Reload</a>
			<div class="col-8 block">
				<table>
					<thead>
						<tr>
							<th>Source</th>
							<th>Target</th>
						</tr>
					</thead>
					<tbody>
						<strapi:foreachRedirects var="x" sortCriteria="source">
							<strapi:redirects>
								<tr>
									<td><a href="<strapi:redirectsSource/>"><strapi:redirectsSource /></a></td>
									<td><a href="<strapi:redirectsTarget />"><strapi:redirectsTarget /></a></td>
								</tr>
							</strapi:redirects>
						</strapi:foreachRedirects>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
