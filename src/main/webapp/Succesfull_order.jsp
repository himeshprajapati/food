<%@page language="java" import="java.util.*" import="com.db.Cart_fetch"
	import="com.db.CartModal"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.order-details {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* text-align: center; */
	max-width: 400px;
	width: 100%;
}

.checkmark {
	color: #4caf50;
	font-size: 48px;
	margin-bottom: 20px;
	 text-align: center;
}

.Header{
text-align: center;
}

.order-item {
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.order-item:last-child {
	border-bottom: none;
}

.product-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.product-name {
	font-weight: bold;
}

.product-subtotal {
	font-weight: bold;
	color: #e74c3c;
}

.return-button {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s, transform 0.2s;
	margin-top: 20px;
	margin-left: 100px;
	
}

.return-button:hover {
	background-color: #2980b9;
	transform: translateY(-3px);
}

.return-button:active {
	transform: translateY(1px);
}

.total-amount{
	margin-top: 10px;
}

</style>
</head>
<body>

<%-- Java code to generate a random order ID --%>
<%
java.util.Random random = new java.util.Random();
int orderId = 100000 + random.nextInt(900000);
%>

<div class="order-details">
	<div class="checkmark">&#10004;</div>
	<div class="Header">
	<h2>Thank You for Ordering</h2>
	<p>Your Order ID: <%= orderId %></p>
	</div>
	<%
	List<CartModal> itemList = Cart_fetch.getProductsList(); // Retrieve the list from the Java class
	int totalAmount = 0;
	for (CartModal item : itemList) {
		totalAmount = totalAmount + (item.getQuantity() * item.getProdPrice());
	%>
	<div class="order-item">
		<div class="product-details">
			<div class="product-name"><%=item.getProdName()%></div>
			<div class="product-subtotal">&#8377;<%=item.getProdPrice() * item.getQuantity()%></div>
		</div>
		<div class="product-desc"><%=item.getProdDesc()%></div>
		<div class="product-price-quantity">
			<div class="product-price">&#8377;<%=item.getProdPrice()%></div>
			<div class="product-quantity">x<%=item.getQuantity()%></div>
		</div>
	</div>
	<%
	}
	%>
	<div class="total-amount">
		Total Amount: &#8377;<span id="totalProdAmount"><%= totalAmount %></span>
	</div>
	<button class="return-button" id="return-but" onclick="returnToHomePage()">Return to Home Page</button>
</div>

<script>
	function returnToHomePage() {
		// Redirect to the home page or desired destination
		window.location.href = "Home.jsp";
	}
</script>

</body>
</html>

