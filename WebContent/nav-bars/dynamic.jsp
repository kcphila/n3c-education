<%@ include file="../_include.jsp"%>

<strapi:navBars ID="${param.navbar}">
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand" href="#"><img src="<util:applicationRoot/>/resources/images/logo.png" height=50px><strapi:navBarsName/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<strapi:foreachNavColumnsNavBarLinks var="column" sortCriteria="nav_column_order">
					<strapi:navColumnsNavBarLinks>
						<strapi:navColumns ID="${tag_navColumnsNavBarLinks.navColumnId}">
							<c:choose>
								<c:when test="${strapi:navColumnsHasNavItemsNavColumnLinks(tag_navColumnsNavBarLinks.navColumnId) }">
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="<util:applicationRoot/><strapi:navColumnsUrl/>" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <strapi:navColumnsLabel/> </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<strapi:foreachNavItemsNavColumnLinks var="item" sortCriteria="nav_item_order">
												<strapi:navItemsNavColumnLinks>
													<strapi:navItems ID="${tag_navItemsNavColumnLinks.navItemId}">
														<a class="dropdown-item" href="<util:applicationRoot/><strapi:navItemsUrl/>"><strapi:navItemsLabel/></a>
													</strapi:navItems>
												</strapi:navItemsNavColumnLinks>
											</strapi:foreachNavItemsNavColumnLinks>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<li class="nav-item active"><a class="nav-link" href="<util:applicationRoot/><strapi:navColumnsUrl/>"><strapi:navColumnsLabel/></a></li>			
								</c:otherwise>
							</c:choose>
						</strapi:navColumns>
					</strapi:navColumnsNavBarLinks>
				</strapi:foreachNavColumnsNavBarLinks>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="<util:applicationRoot/>/search" >
				<input class="form-control mr-sm-2" name="query" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
</strapi:navBars>
