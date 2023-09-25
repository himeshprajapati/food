<%@page language="java" import="java.util.*"
	import="com.db.Product_fetch" import="com.db.ProductModal"%>

<!DOCTYPE html>
<html>
<head>
<title>My Online Store</title>
<!-- Bootstrap CSS link -->
<link rel="stylesheet" type="text/css" href="header_style.css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style >
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
	border-style: outset;
}

.post-item {
	width: 300px;
	padding: 10px;
	margin-bottom: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
	position: relative;
}

.post-item:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.quantity-selector {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.quantity-selector input {
	width: 40px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 5px;
	font-size: 14px;
}

.quantity-selector button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	padding: 5px 10px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.quantity-selector button:hover {
	background-color: #45a049;
}

.post-item img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 5px;
}

.button-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}
/* Improve Cart Icon */
.cart-icon img {
	position: relative;
	
}

.cart-badge {
	position: absolute;
	top: -10px;
	right: -10px;
	background-color: #000;
	color: #fff;
	font-size: 12px;
	padding: 2px 6px;
	border-radius: 50%;
}

/* Add some spacing and styling for the product list */
.post-list {
	display: grid;
    grid-template-columns: auto auto auto auto;
    justify-content: space-around;
	list-style-type: none;
	padding: 0;
}

.post-title {
	margin: 10px 0 5px;
	font-size: 18px;
	font-weight: bold;
}

.cart-item {
	margin-bottom: 20px;
}

button {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	padding: 8px 16px;
	text-align: center;
	font-size: 14px;
	margin-top: 10px;
	cursor: pointer;
}

.contact-container {
    padding: 50px;
    background-color: #f9f9f9;
    text-align: center;
}

.contact-title {
    font-size: 24px;
    margin-bottom: 20px;
}

.contact-form {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
}

.contact-form:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.contact-input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.contact-input:focus {
    outline: none;
    border-color: #3498db;
}

.contact-textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    resize: vertical;
}

.contact-button {
    background-color: #3498db;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.contact-button:hover {
    background-color: #2980b9;
}

</style>
</head>
<body>

	<header class="header-container">
    <div class="logo">
    <a href="Home.jsp">
         <span><img src="logo.png" width="200" height="60" alt="Error loading image" ></span>
        </a>
    </div>
    <nav class="navigation">
        <a href="Home.jsp">Home</a>
        <a href="#contact">Contact</a>
        <a href="cart.jsp" class="cart-icon">
            <img src="cart.gif" width="30" height="30" alt="Cart">
            <!-- <span id="cartCount" class="cart-badge">0</span> -->
        </a>
    </nav>
    <form action="useremail">
    <div class="user-info" >
        <h6>email@email.com</h6>
        <a href="Login.jsp" class="logout-button">Logout</a>
    </div>
    </form>
</header>


	<!-- <div class="search-container">
		<form action="" method="get">
			<input type="text" placeholder="Search for products.." name="search">
			<button type="submit">Search</button>
		</form>
	</div>
 -->


	<div class="main-content">
		<ul class="post-list">
			<%-- Access the list of items using JSP expression language and iterate over it --%>
			<%
			List<ProductModal> itemList = Product_fetch.getProductsList(); // Retrieve the list from the Java class
			for (ProductModal item : itemList) {
			%>
			<li class="post-item"><img src="<%=item.getImage()%>"
				alt="Error" width='300' height='300' />
				<h3 class="post-title">
					<!-- <b>Product Name: </b> -->
					<%=item.getProductName()%></h3>
				<p class="post-content">
					<!-- <b>Product Description:</b> -->
					<%=item.getProdDesc()%></p>
				<p class="post-content">
					<!-- <b>Type:</b> -->
					<%=item.getType()%></p>
				<p class="post-content">
					<!-- <b> Price:</b> -->
					<%=Integer.toString(item.getPrice())%></p>



				<form action="cart_Connection" method="post">
					<div class="quantity-selector">

						<input id="<%=item.getProductName()%>-quantity" name="quantity"
							class="quantity" type="number" value="1" min="1">

					</div>
					<input type="hidden" value="<%=item.getId()%>" name="product_id">

					<button type="submit">Add to Cart</button>

				</form></li>
			<%
			}
			%>
		</ul>
	</div>

	<div class="contact-container" id="contact">
    <h2 class="contact-title">Contact Us</h2>
    <form class="contact-form" action="Contact" method="post">
        <input class="contact-input" type="email" name="email" placeholder="Your Email" required>
        <textarea class="contact-textarea" name="message" placeholder="Your Message" required></textarea>
        <button class="contact-button" type="submit">Send Message</button>
    </form>
</div>

	<script>
   var cartItems = {};

   function addToCart(productName, quantity) {
     if (!cartItems[productName]) {
       cartItems[productName] = 0;
     }
     cartItems[productName] += quantity;
     updateCartCount(Object.values(cartItems).reduce((total, qty) => total + qty, 0));
     alert(quantity + " " + productName + "(s) added to cart!");
      
     
     
   }

   function updateCartCount(count) {
     var cartCountElement = document.getElementById("cartCount");
     cartCountElement.innerText = count;
   }

   function increaseQuantity(productName) {
     var quantityInput = document.getElementById(productName + "-quantity");
     quantityInput.value = parseInt(quantityInput.value) + 1;
   }

   function decreaseQuantity(productName) {
     var quantityInput = document.getElementById(productName + "-quantity");
     var currentValue = parseInt(quantityInput.value);
     if (currentValue > 1) {
       quantityInput.value = currentValue - 1;
     }
   }
  </script>

	<!-- Bootstrap JS scripts -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
