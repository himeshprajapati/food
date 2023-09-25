<%@page language="java" import="java.util.*"
    import="com.db.Product_fetch" import="com.db.ProductModal"%>

<!DOCTYPE html>
<html>
<head>
    <title>About Us - My Online Store</title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" type="text/css" href="header_style.css"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Include your custom styles for the about page here */
        .about-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .about-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <header class="header-container">
        <!-- Your header code remains the same as in the previous page -->
    </header>

    <div class="main-content">
        <div class="about-container">
            <h2>About Us</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis nulla ac tortor tempus,
                quis convallis elit venenatis. Vivamus ut varius libero. Fusce efficitur tortor in ante hendrerit
                facilisis. Sed vel nisl vitae urna fringilla consectetur vel non libero. Sed ut facilisis dui, eget
                viverra odio. Vivamus vitae est eu lectus consectetur eleifend vel non metus.</p>
            <p>Proin vehicula congue ante, in congue risus cursus a. Nunc eu erat id justo congue vehicula. Sed
                ullamcorper, justo eget malesuada congue, ex elit semper metus, nec rhoncus quam ex quis justo.
                Fusce elementum non tortor eget aliquet. Duis et tristique tellus.</p>
            <p>Mauris vulputate, velit a finibus volutpat, metus dui feugiat elit, a malesuada nunc justo sed
                ipsum. Sed vel cursus massa. Vestibulum a urna non ex volutpat interdum. Proin nec tortor eu
                justo efficitur eleifend.</p>
        </div>
    </div>

    <!-- Include your JavaScript code here (if needed) -->

    <!-- Bootstrap JS scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
