<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="Stylesheet" href ="${pageContext.request.contextPath}/webjars/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/fontawesome/all.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/style.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script> -->

</head>
<body>
	<h2 align="center">Welcome to Admin Portal</h2>
	
		<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container" id="topNavbar">
	
			<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="users">Users</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="newuser">New User</a>
						
					</li>
			
			</ul>
		
		</div>
	
	</nav>


	<div class="container">
	    <div class="starter-template">
	       <h1 align="center">List of Users</h1>
	    </div>
	    <div align = "center">
		<table class="table table-bordered table-striped w-auto">
			<thead >
				<tr>
				<th>User Id</th>
				<th>E-mail</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Enabled</th>
				</tr>
			
			</thead>
			<tbody>
				<c:forEach var="user" items="${listUsers}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.firstName}" /></td>
                    <td><c:out value="${user.lastName}" /></td>
                    <td><c:out value="${user.enabled}" /></td>
                    <!-- <td>
                    
                    
                    	<c:if test = "${user.enabled == true}">
                    		<a  class="fas fa-check-circle fa-2x icon-green" title="enabled" href=""></a>
                    	</c:if>
                    	
                    		<c:if test = "${user.enabled == false}">
                    		<a  class="fas fa-check-circle fa-2x icon-dark" title="disabled" href=""></a>
                    	</c:if>
                    	
						
					         
                    </td> -->
                    
                </tr>
            	</c:forEach>
			</tbody>
		</table>
		</div>
	    
	</div>

</body>
</html>