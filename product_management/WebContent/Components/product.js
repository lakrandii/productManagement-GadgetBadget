$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
// Form validation-------------------
var status = validateItemForm();
if (status != true)
 {
 $("#alertError").text(status);
 $("#alertError").show();
 return;
 }
// If valid------------------------
var type = ($("#hidIDSave").val() == "") ? "POST" : "PUT";
 $.ajax(
 {
 url : "productAPI",
 type : type,
 data : $("#formproduct").serialize(),
 dataType : "text",
 complete : function(response, status)
 {
 onproductSaveComplete(response.responseText, status);
 }
 });
});

function onproductSaveComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully saved.");
 $("#alertSuccess").show();
 $("#divproductGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while saving.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while saving..");
 $("#alertError").show();
 } 
14
 $("#hidIDSave").val("");
 $("#formproduct")[0].reset();
}

$(document).on("click", ".btnUpdate", function(event)
		{
	$("#hidIDSave").val($(this).data("product_ID"));
	 $("#product_ID").val($(this).closest("tr").find('td:eq(0)').text()); 
	 $("#product_Name").val($(this).closest("tr").find('td:eq(1)').text()); 
	 $("#Category").val($(this).closest("tr").find('td:eq(2)').text()); 
	 $("#Serial_No").val($(this).closest("tr").find('td:eq(3)').text()); 
	 $("#Price").val($(this).closest("tr").find('td:eq(4)').text()); 
	 $("#Description").val($(this).closest("tr").find('td:eq(5)').text()); 
});


$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "productAPI",
		 type : "DELETE",
		 data : "product_ID=" + $(this).data("product_ID"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onproductDeleteComplete(response.responseText, status);
		 }
		 });
		});


function onproductDeleteComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully deleted.");
 $("#alertSuccess").show();
 $("#divproductGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while deleting.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while deleting..");
 $("#alertError").show();
 }
}