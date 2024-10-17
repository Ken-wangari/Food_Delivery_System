<?php
// Include FPDF library
require('fpdf/fpdf.php');
include("../config/config.php");
error_reporting(0);
session_start();

class PDF extends FPDF
{
    // Page header
    function Header()
    {
        // Logo
        $this->Image('images/logo-white.png', 10, 6, 30);
        // Arial bold 15
        $this->SetFont('Arial', 'B', 12);
        // Title
        $this->Cell(80);
        $this->Cell(30, 10, 'All Orders Report', 0, 0, 'C');
        // Line break
        $this->Ln(20);
    }

    // Page footer
    function Footer()
    {
        // Position at 1.5 cm from bottom
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    // Table with orders data
    function OrdersTable($header, $data)
    {
        // Colors, line width and bold font
        $this->SetFillColor(0, 0, 255);
        $this->SetTextColor(255);
        $this->SetDrawColor(128, 0, 0);
        $this->SetLineWidth(.3);
        $this->SetFont('', 'B');
        // Header
        $w = array(30, 60, 20, 20, 30);  // Adjusted widths
        for ($i = 0; $i < count($header); $i++)
            $this->Cell($w[$i], 7, $header[$i], 1, 0, 'C', true);
        $this->Ln();
        // Color and font restoration
        $this->SetFillColor(224, 235, 255);
        $this->SetTextColor(0);
        $this->SetFont('');
        // Data
        $fill = false;
        foreach ($data as $row) {
            $this->Cell($w[0], 6, $row['username'], 'LR', 0, 'L', $fill);
            $this->Cell($w[1], 6, $row['title'], 'LR', 0, 'L', $fill);
            $this->Cell($w[2], 6, $row['quantity'], 'LR', 0, 'C', $fill);
            $this->Cell($w[3], 6, $row['price'], 'LR', 0, 'C', $fill);
            $this->Cell($w[4], 6, $row['status'], 'LR', 0, 'C', $fill);  // Status
            $this->Ln();
            $fill = !$fill;
        }
        // Closing line
        $this->Cell(array_sum($w), 0, '', 'T');
    }
}

// Fetch data from the database
$sql = "SELECT users.username, users_orders.title, users_orders.quantity, users_orders.price, users_orders.status FROM users INNER JOIN users_orders ON users.user_id=users_orders.user_id";
$query = mysqli_query($db, $sql);
$data = [];

if (mysqli_num_rows($query) > 0) {
    while ($row = mysqli_fetch_assoc($query)) {
        $data[] = $row;
    }
} else {
    echo "No orders found!";
    exit();
}

// Column headers (Removed 'Address' and 'Reg-Date')
$header = array('User', 'Title', 'Quantity', 'Price', 'Status');

// Create new PDF document
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 12);

// Add table with orders data
$pdf->OrdersTable($header, $data);

// Output the PDF to the browser
$pdf->Output('D', 'orders_report.pdf');
