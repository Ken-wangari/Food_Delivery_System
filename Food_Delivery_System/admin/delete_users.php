<?php
include("../config/config.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM users WHERE user_id = '" . $_GET['user_del'] . "'");
header("location:all_users.php");
