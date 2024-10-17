<?php
include("../config/config.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM meals WHERE dish_id = '" . $_GET['menu_del'] . "'");
header("location:all_menu.php");
