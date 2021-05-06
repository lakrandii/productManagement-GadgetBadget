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
  
  <% 
if (request.getParameter("product_ID") != null) 
 { 
	product productObj = new  product(); 
 String stsMsg =  productObj .deleteproduct(request.getParameter("product_ID")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 

//Save---------------------------------
if (request.getParameter("product_ID") != null)
{
	product productObj = new product();
 String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidproductIDSave") == "")
 {
 stsMsg =  productObj.insertproduct(request.getParameter("product_ID"),
 request.getParameter("product_Name"),
 request.getParameter("Category"),
 request.getParameter("Serial_No"),
 request.getParameter("price"),
 request.getParameter("Description"));
 }



else//Update----------------------
 {
	stsMsg =  productObj.insertproduct(request.getParameter("product_ID"),
	request.getParameter("product_Name"),
	request.getParameter("Category"),
	request.getParameter("Serial_No"),
	request.getParameter("price"),
	request.getParameter("Description"));
 }
 session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidproductIDDelete") != null)
{
product productObj = new product();
 String stsMsg =
productObj.deleteproduct(request.getParameter("hidproductIDDelete"));
 session.setAttribute("statusMsg", stsMsg);
}
 %>
      <div class="container"><div class="row"><div class="col-6">
      
      <h1>Product Management </h1>
      
         <form id="formproduct" name="formproduct" method="post" action="product.jsp">
         
             Product No:
             <input id="ProductNO" name="product_ID" type="text"class="form-control form-control-sm">
             <br> Product name:
             <input id="Productname" name="product_Name" type="text"class="form-control form-control-sm">
             <br> Product category:
             <input id="Productcategory" name="Category" type="text"class="form-control form-control-sm">
             <br> Product SerialNo:
             <input id="ProductSerialNo" name="Serial_No" type="text"class="form-control form-control-sm">
             <br> Product Price:
             <input id="ProductPrice" name="price" type="text"class="form-control form-control-sm">
             <br> Product Description:
             <input id="ProductDes" name="Description" type="text"class="form-control form-control-sm">
             <br>
             <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
             <input type="hidden" id="hidProductIDSave" name="hidProductIDSave" value="">

       </form>
       
   <div id="alertSuccess" class="alert alert-success"></div>
   <div id="alertError" class="alert alert-danger"></div>
   
   <br>
   <div id="divProductGrid">
 
   <%
        product productObj = new product();
        out.print(productObj.readproduct());
    %>
    
    </div>
    </div> </div> </div>

</body>
</html>