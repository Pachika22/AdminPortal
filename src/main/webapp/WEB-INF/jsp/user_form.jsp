<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="Stylesheet" href ="${pageContext.request.contextPath}/webjars/bootstrap/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

	<!-- <script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>  -->
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<h2 align="center">Welcome to Admin Portal</h2>
	<div>
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
	</div>
		<div align="center">
        	<h2>User Registration</h2>
        </div>
        <form:form action="saveUser" method="post" modelAttribute="user" style="max-width: 700px; margin: 0 auto" 
        onsubmit="return checkUniqueUser(this)">
          
            <div class="border border-secondary rounded p-3 m-2">
				<div class="form-group row">
					<form:label path="email" class="col-sm-2 col-form-label">E-mail:</form:label>
					<div class="col-sm-8">
						<form:input path="email" required="required" class="form-control " />
					</div>
				</div>
				<div class="form-group row">
					 <form:label path="firstName" class="col-sm-2 col-form-label">First Name:</form:label>
					<div class="col-sm-8">
						<form:input path="firstName" required="required" class="form-control "/>
					</div>
				</div>
				<div class="form-group row">
					 <form:label path="firstName" class="col-sm-2 col-form-label">Last Name:</form:label>
					<div class="col-sm-8">
						<form:input path="lastName" required="required" class="form-control "/>
					</div>
				</div>
				<div class="form-group row">
					<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
					<div class="col-sm-8">
						<form:password path="password" required="required" class="form-control "/>
					</div>
				</div>
							
				<div class="form-group row">
			    <div class="col-sm-2">Enabled:</div>
			    <div class="col-sm-10">
			      <div class="form-check">
			        <form:checkbox path="enabled"  class="form-check-input" />
			      </div>
			    </div>
			  </div>
				<div class="text-center">
					<form:button class="btn btn-primary ">Register</form:button>
				</div>
		   </div>
            
      </form:form>
 
      <div class="modal fade text-center" id="modalDialog">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="modalTitle">Warning</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
	        		<span id="modalBody"></span>
		      	</div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			        
		      	</div>
			</div>
		</div>
	</div>

     <script>

	function checkUniqueUser(form){
				
			userEmail = $("#email").val();
			userFirstName = $("#firstName").val();
			userLastName = $("#lastName").val();
	
			//alert(userEmail);
			//alert(userFirstName);
			//alert(userLastName);
		
			var params = {email:userEmail, firstName:userFirstName,lastName:userLastName};
			//alert(params)
				
			$.post("checkUniqueUser", $.param(params), function(response) {
                //alert(response);
                if(response == "OK" ){
                	form.submit();
                }else if (response == "Duplicate_Email"){
    				showModalDialog("Warning","There is another user having the email ");
    			}else if (response == "Duplicate_Name"){
    				showModalDialog("Warning","There is another user having the same FirstName and LastName ");
    			}else if (response == "BOTH"){
    				showModalDialog("Warning","Another user having the same Email,Firstname, and Lastname ");
    			}
        	}).fail(function(){
    			showModalDialog("Error","Could not connect to the server");
    		});
				
							
			return false;
		 
	}
 
 	function showModalDialog(title,message){

		$("#modalTitle").html(title);
		$("#modalBody").html(message);
		$("#modalDialog").modal("show");
	
	}
 
 </script>


</body>
</html>