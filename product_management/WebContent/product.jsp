<%@page import="com.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/product.js"></script>
</head>
  <body>
  
 
      <div class="container"><div class="row"><div class="col-6">
      
      <h1>Product Management </h1>
      
         <form id="formproduct" name="formproduct" >
         
             Product No:
             <input id="product_ID" name="product_ID" type="text"class="form-control form-control-sm">
             <br> Product name:
             <input id="product_Name" name="product_Name" type="text"class="form-control form-control-sm">
             <br> Product category:
             <input id="Category" name="Category" type="text"class="form-control form-control-sm">
             <br> Product SerialNo:
             <input id="Serial_No" name="Serial_No" type="text"class="form-control form-control-sm">
             <br> Product Price:
             <input id="Price" name="Price" type="text"class="form-control form-control-sm">
             <br> Product Description:
             <input id="Description" name="Description" type="text"class="form-control form-control-sm">
             <br>
             <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
             <input type="hidden" id="hidIDSave" name="hidIDSave" value="">

       </form>
       
   <div id="alertSuccess" class="alert alert-success"></div>
   <div id="alertError" class="alert alert-danger"></div>
   
   <br>
   <div id="divproductGrid">
 
   <%
        product productObj = new product();
        out.print(productObj.readproduct());
    %>
    
    </div>
    </div> </div> </div>
    

</body>
</html>