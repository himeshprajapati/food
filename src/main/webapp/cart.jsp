<%@page language="java" import="java.util.*" import="com.db.Cart_fetch"
	import="com.db.CartModal"%>

<!DOCTYPE html>
<html>
<body>
<head>
<link rel="stylesheet" type="text/css" href="header_style.css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
}

.navbar {
	background-color: #f2f2f2;
	overflow: hidden;
}

.navbar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.navbar li {
	float: left;
}

.navbar li a {
	display: block;
	color: #333;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar li.cart-icon {
	float: right;
}

.main-content {
	padding: 20px;
	border-style: revert;
}

.quantity-selector {
	display: flex;
	align-items: center;
}

.quantity-selector input {
	width: 40px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
}

.quantity-selector button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.quantity-buttons:hover {
	background-color: #45a049;
}

.post-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.button-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
}

.remove-button {
	background-color: #e74c3c;
	color: #fff;
	border: none;
	padding: 5px 10px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.remove-button:hover {
	background-color: #c0392b;
}

.cart-item {
	margin-bottom: 20px;
	display: flex;
	flex-direction: row;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
	position: relative;
	width: 60%;
	padding: 10px;
	margin-bottom: 20px;
	background-color: #fff;
}

.cart-item:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.post-list {
	list-style-type: none;
	padding: 0;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.prod-details {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	margin-right: 30px;
	margin-top: 20px;
}

.quantity-buttons {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	padding: 8px 16px;
	text-align: center;
	font-size: 14px;
	cursor: pointer;
}

.quantity-value {
	padding: 8px 16px;
	margin-left: 5px;
	margin-right: 5px;
}

#rzp-button1 {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s, transform 0.2s;
}

#rzp-button1:hover {
	background-color: #2980b9;
	transform: translateY(-3px);
}

#rzp-button1:active {
	transform: translateY(1px);
}

#totalProdAmount {
	border: none;
}
</style>
</head>

<header class="header-container">
	<div class="logo">
		<a href="Home.jsp"> <img src="logo.png" alt="Error loading image">
		</a>
	</div>
	<nav class="navigation">
		<a href="Home.jsp">Home</a> <a href="#">About</a> <a
			href="Home.jsp#contact">Contact</a>

	</nav>
	<div class="user-info">
		<h6>email@email.com</h6>
		<a href="Login.jsp" class="logout-button">Logout</a>

	</div>
</header>
<div class="main-content">
	<ul class="post-list">
		<%-- Access the list of items using JSP expression language and iterate over it --%>
		<%
		List<CartModal> itemList = Cart_fetch.getProductsList(); // Retrieve the list from the Java class
		int totalAmount = 0;
		for (CartModal item : itemList) {
			totalAmount = totalAmount + (item.getQuantity() * item.getProdPrice());
		%>
		<li class="cart-item">
			<div>
				<img class="post-image" src="<%=item.getProdImage()%>" alt="#" />
			</div>
			<div class="prod-details">
				<div>
					<span class="post-title"> <%=item.getProdName()%></span><br> <span
						class="post-content"> <%=item.getProdDesc()%></span><br> <span
						class="post-content"> <span style='font-family: Arial;'>&#8377;</span>
						<%=Integer.toString(item.getProdPrice())%></span><br>
				</div>
				<div>
					<%-- 					<span> <%=item.getQuantity()%>
 --%>
					<div class="quantity-selector">

						<form action="update_cart_items" method="post">
							<input type="hidden" value="<%=item.getId()%>" name="cart_id">

							<input class="quantity-buttons" type="submit" name="remove_item"
								value="-" /> <input class="quantity-value"
								id="<%=item.getProdName()%>-quantity" name="quantity"
								type="text" value="<%=item.getQuantity()%>" min="1" readonly />
							<input class="quantity-buttons" type="submit" name="add_item"
								value="+" />
						</form>
					</div>

					<br> <span class="post-content"> </span> 
					<span style='font-family: Arial;'>&#8377;</span> 
					<input id="totalProdAmount" value="<%=item.getProdPrice() * item.getQuantity()%>" disabled />
				</div>
			</div> <%-- <form action="cart_remove" method="post">
					<input type="hidden" value="<%=item.getId()%>" name="cart_id">

					<div class="button-container">

						<button type="submit">Remove from Cart</button>

					</div>
		
				</form> --%>
		</li>
		<%
		}
		%>
		<input id="totalAmount" value="<%=totalAmount%>" type="hidden" />

	</ul>
</div>

<%--<script>
   
	function updateCart(prodName) {
    	var prodQuantity = document.getElementById(prodName.concat("-quantity")).value;
    	
	}
   
   
   <%
   List<CartModal> itemList1 = Cart_fetch.getProductsList();
   for (CartModal item : itemList1) {
   %>
   <li class="cart-item">
     
       <div class="button-container">
           <button onclick="removeFromCart('<%=item.getId()%>')">Remove</button>
       </div>
   </li>
   <%}%> 
</script>--%>
<div class="button-container">
	<button id="rzp-button1" onclick="createOrderId()">Proceed
		Payment</button>
</div>
<script>
	var xhttp = new XMLHttpRequest();
	var RazorpayOrderId;

	function createOrderId() {
		var totalAmount = document.getElementById("totalAmount").value;
		console.log(totalAmount)

		var data = "totalAmount=" + totalAmount
		//	data.append('totalAmount', totalAmount);

		xhttp.open("GET", "http://localhost:8800/Food/Order_Creation?" + data,
				false);
		xhttp.send(data);
		RazorpayOrderId = xhttp.responseText;
		openCheckout();
	}
</script>




<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
	function openCheckout() {

		var options = {
			"key" : "rzp_test_BALMMAYJcVYrty", // Enter the Key ID generated from the Dashboard
			//"amount": totalAmount, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
			"currency" : "INR",
			"name" : "Acme Corp",
			"description" : "Test Transaction",
			"image" : "https://example.com/your_logo",
			"order_id" : RazorpayOrderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
			/* "handler": function (response){
			    alert(response.razorpay_payment_id);
			    alert(response.razorpay_order_id);
			    alert(response.razorpay_signature)
			}, */
			"callback_url" : "http://localhost:8800/Food/Order_Creation",
			"prefill" : {
				"name" : "Himesh Prajapati",
				"email" : "himesh050@gmail.com",
				"contact" : "9768027914"
			},
			"notes" : {
				"address" : "Razorpay Corporate Office"
			},
			"theme" : {
				"color" : "#3399cc"
			}
		};
		var rzp1 = new Razorpay(options);
		rzp1.on('payment.failed', function(response) {
			alert(response.error.code);
			alert(response.error.description);
			alert(response.error.source);
			alert(response.error.step);
			alert(response.error.reason);
			alert(response.error.metadata.order_id);
			alert(response.error.metadata.payment_id);
		});
		rzp1.open();
		//e.preventDefault();
	}
</script>

</body>
</html>
