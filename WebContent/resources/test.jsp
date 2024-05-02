<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />

<!doctype html>
<html lang="en">
    <head>
        <title>SO question 2204870</title>
        <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/">
        <script src="js/global.js"></script>
        <link rel="stylesheet" href="css/global.css">
    </head>
    <body>
    	${req.contextPath}
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="faq.jsp">FAQ</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </body>
</html>
