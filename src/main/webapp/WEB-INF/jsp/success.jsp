<!DOCTYPE html>
<html>
<head>
    <link rel="Stylesheet" href ="${pageContext.request.contextPath}/webjars/bootstrap/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>

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
		<div align="center">
        	<h2>Registration Successful  with the following details :</h2>
        
        <div align="center" style="max-width: 500px; margin: 0 auto">
		 <table class="table table-bordered table-striped">
		  <tbody>
		    <tr>
		      <th scope="row" class="table-active">E-mail :</th>
		      <td colspan="2">${user.email}</td>
		      
		    </tr>
		    <tr>
		      <th scope="row" class="table-active">FirstName :</th>
		      <td colspan="2">${user.firstName}</td>
		      
		    </tr>
		    <tr>
		      <th scope="row" class="table-active">LastName :</th>
		      <td colspan="2">${user.lastName}</td>
		    </tr>
		    <tr>
		      <th scope="row" class="table-active">Enabled :</th>
		      <td colspan="2">${user.enabled}</td>
		    </tr>
		  </tbody>
		</table>
		</div>
		</div>
		
</body>
</html>