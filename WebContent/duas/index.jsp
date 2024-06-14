<%@ include file="../_include.jsp"%>
<html>
<jsp:include page="../head.jsp">
	<jsp:param name="page" value="Data Use Agreements"/>
</jsp:include>

<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp" />
		<div class="row flex-nowrap main-block">
			<div class="col-xs-8">
				<strapi:tenantDuaLists ID="1">
					<h1><strapi:tenantDuaListsHeader/></h1>
					<util:markdown2html><strapi:tenantDuaListsBlock1/></util:markdown2html>
				</strapi:tenantDuaLists>
				<div id="table" style="overflow:scroll;">&nbsp;</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" rel="stylesheet" type="text/css" /><script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script><script>


$.getJSON("https://labs.cd2h.org/n3c_dashboard/embedded_tenant_dua_roster.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];
	var col_icons= ['<i class="fa fa-university" aria-hidden="true" style="color: #376076;"></i> ','<i class="fa fa-user" aria-hidden="true" style="color: #376076;"></i> ', '<i class="fa fa-calendar" aria-hidden="true" style="color: #376076;"></i> '];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover';
	table.style.width = '100%';
	table.id="table1";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = col_icons[i] + '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("table");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#table1').DataTable( {
    	data: data,
    	paging: true,
    	pageLength: 25,
    	columns: [
        	{ data: 'site_name' },
        	{ data: 'contact', 'orderable': false },
        	{ data: 'date_executed' }
    	]
	} );
});
</script>
</body>
</html>