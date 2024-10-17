<?php
include("../config/config.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM restaurant WHERE restaraunt_id = '" . $_GET['res_del'] . "'");
header("location:all_restaurant.php");
