<?php
include("../config/config.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM users_orders WHERE order_id = '" . $_GET['order_del'] . "'");
header("location:all_orders.php");
