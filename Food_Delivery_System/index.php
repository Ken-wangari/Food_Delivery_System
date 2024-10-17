<!DOCTYPE html>
<html lang="en">
<?php
include 'config/config.php';
error_reporting(0);
session_start();
if (isset($_POST['submit'])) {
    echo "<script>window.location='index.php?name=$_POST[search]'</script>";
}
?>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="home">

    <header id="header" class="header-scroll top-header headrom">
        <nav class="navbar navbar-dark">
            <div class="container">
                <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse"
                    data-target="#mainNavbarCollapse">&#9776;</button>
                <a class="navbar-brand" href="index.php"> <img class="img-rounded" src="images/logo.png" alt="">
                </a>
                <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                    <ul class="nav navbar-nav">
                        <li class="nav-item"> <a class="nav-link active" href="index.php">Home <span
                                    class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link active" href="admin">Admin Login <span
                                    class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link active" href="restaurants.php">Restaurants <span
                                    class="sr-only"></span></a> </li>


                        <?php
                        if (empty($_SESSION['user_id'])) {
                            echo '<li class="nav-item"><a href="login.php" class="nav-link active">Login</a> </li>
                        							  <li class="nav-item"><a href="registration.php" class="nav-link active">Register</a> </li>';
                        } else {
                            echo '<li class="nav-item"><a href="your_orders.php" class="nav-link active">My Orders</a> </li>';
                            echo '<li class="nav-item"><a href="logout.php" class="nav-link active">Logout</a> </li>';
                        }

                        ?>

                    </ul>

                </div>
            </div>
        </nav>

    </header>

    <section class="hero bg-image" data-image-src="images/img/main.jpg">
        <div class="hero-inner">
            <div class="container text-center hero-text font-white">
                <h1>Order Now, Delivered to Your Door </h1>

                <div class="banner-form">
                    <form class="form-inline" method="post" required>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputAmount">I would like to eat....</label>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg" name="search" id="search"
                                    placeholder="I would like to eat....">
                            </div>
                        </div>
                        <button type="submit" id="submit" name="submit" class="btn theme-btn btn-lg">Search
                            food</button>
                    </form>
                </div>
            </div>
        </div>

    </section>
    <section class="featured-restaurants">
        <div class="container">
            <div class="row" style="background-color: #141a26; padding: 20px;">
                <div class="col-sm-4">
                    <div class="title-block pull-left">
                        <h4 style="color: white;">Restaurants Featured </h4>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="restaurants-filter pull-right"
                        style="display: flex; justify-content: flex-end; align-items: center; flex-wrap: wrap;">
                        <nav class="primary">
                            <ul style="list-style: none; padding: 0; margin: 0; display: flex; flex-wrap: nowrap;">
                                <li style="display: inline-block; margin: 0 15px;">
                                    <a href="#" class="selected" data-filter="*"
                                        style="font-size: 16px; color: white; padding: 10px 20px; background-color: transparent; border: 2px solid white; border-radius: 20px; text-transform: capitalize; text-decoration: none; transition: background-color 0.3s, color 0.3s;">All</a>
                                </li>
                                <?php
                                $res = mysqli_query($db, 'SELECT * FROM restaraunt_category');
                                while ($row = mysqli_fetch_array($res)) {
                                    echo '<li style="display: inline-block; margin: 0 15px;">
                                                                <a href="#" data-filter=".' .
                                        $row['c_name'] .
                                        '" style="font-size: 16px; color: white; padding: 10px 20px; background-color: transparent; border: 2px solid white; border-radius: 20px; text-transform: capitalize; text-decoration: none; transition: background-color 0.3s, color 0.3s;">' .
                                        htmlspecialchars($row['c_name'], ENT_QUOTES, 'UTF-8') .
                                        '</a>
                                                              </li>';
                                }
                                ?>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="restaurant-listing">


                    <?php
                    $ress = mysqli_query($db, 'select * from restaurant');
                    while ($rows = mysqli_fetch_array($ress)) {
                        $query = mysqli_query($db, "select * from restaraunt_category where category_id='" . $rows['category_id'] . "' ");
                        $rowss = mysqli_fetch_array($query);

                        echo ' <div class="col-xs-12 col-sm-12 col-md-6 single-restaurant all ' .
                            $rowss['c_name'] .
                            '">
                    														<div class="restaurant-wrap">
                    															<div class="row">
                    																<div class="col-xs-12 col-sm-3 col-md-12 col-lg-3 text-xs-center">
                    																	<a class="restaurant-logo" href="meals.php?restaraunt_id=' .
                            $rows['restaraunt_id'] .
                            '" > <img src="admin/restaraunt_image/' .
                            $rows['image'] .
                            '" alt="Restaurant logo"> </a>
                    																</div>
                    													                <div class="col-xs-12 col-sm-9 col-md-12 col-lg-3">
                    																	<h5><a href="meals.php?restaraunt_id=' .
                            $rows['restaraunt_id'] .
                            '" >' .
                            $rows['title'] .
                            '</a></h5> <span>' .
                            $rows['address'] .
                            '</span>
                    																</div>
                    													
                    															</div>
                    												
                    														</div>
                    												
                    													</div>';
                    }

                    ?>




                </div>
            </div>


        </div>
    </section>
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>

</html>