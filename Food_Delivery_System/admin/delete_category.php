<?php
include("../config/config.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM restaraunt_category WHERE category_id = '" . $_GET['cat_del'] . "'");
header("location:add_category.php");
