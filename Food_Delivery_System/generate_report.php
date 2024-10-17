<?php
// Include FPDF library
require('fpdf/fpdf.php');
include("config/config.php");
session_start();

if (empty($_SESSION['user_id'])) {
    header('location:login.php');
    exit();
}

// Fetch order data for the current user
$sql = "SELECT * FROM users_orders WHERE user_id='" . $_SESSION['user_id'] . "'";
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

// Create PDF class
class PDF extends FPDF
{
    // Page header
    function Header()
    {
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Order Report', 0, 1, 'C');
        $this->Ln(10);
    }

    // Table with order data
    function OrderTable($header, $data)
    {
        // Set header
        $this->SetFont('Arial', 'B', 10);
        foreach ($header as $col) {
            $this->Cell(38, 10, $col, 1);
        }
        $this->Ln();

        // Data rows
        $this->SetFont('Arial', '', 10);
        foreach ($data as $row) {
            $this->Cell(38, 10, $row['title'], 1);
            $this->Cell(38, 10, $row['quantity'], 1);
            $this->Cell(38, 10, 'Ksh ' . $row['price'], 1);
            $this->Ln();
        }
    }

    // Page footer
    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Page ' . $this->PageNo(), 0, 0, 'C');
    }
}

// Column headers
$header = array('Item', 'Quantity', 'Price');

// Create new PDF document
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->OrderTable($header, $data);

// Output the PDF to the browser
$pdf->Output('D', 'order_report.pdf');
