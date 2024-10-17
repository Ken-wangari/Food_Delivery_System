Food Delivery System
The Food Delivery System is a web-based application that allows users to browse meals from different restaurants, place orders, and manage their accounts. It also includes an administrative panel for managing the meals, orders, and restaurants. This project is built using PHP for the backend, a relational database for storing data, and HTML, CSS, JavaScript for the frontend. It also uses FPDF for generating PDF reports.

Table of Contents
Features
Technologies Used
Project Structure
Installation
Usage
Admin Panel
PDF Generation
Database Setup
Contributing
License
Features
User Registration & Authentication: Users can register, log in, and recover forgotten passwords.
Meal Browsing: Users can view meals from different restaurants and add items to their cart.
Order Placement: Customers can place orders, view past orders, and track their delivery status.
Admin Panel: Admin users can manage restaurants, meals, and customer orders.
PDF Reports: The system generates order reports and invoices in PDF format.
Technologies Used
Backend
PHP: The core backend language used for handling server-side operations, session management, and database interaction.
MySQL (or similar relational database): For storing user information, orders, restaurants, and meal data.
FPDF: A PHP library used to generate PDF files such as order receipts and reports.
Frontend
HTML: For creating the structure of web pages.
CSS & SCSS: For styling the frontend.
JavaScript: For adding client-side interactivity and managing user interactions.
Other Technologies
FPDF Library: To generate PDF reports for orders and invoices.
Font and Assets: Custom fonts, images, and other assets are included in the project for better UI/UX.
Project Structure
bash
Copy code
Food_Delivery_System/
├── admin/              # Admin panel files
├── assets/             # Static assets such as images, icons, etc.
├── config/             # Configuration files (database connection, etc.)
├── css/                # Stylesheets for the frontend
├── DB/                 # Database-related scripts or migration files
├── fpdf/               # FPDF library for generating PDFs
├── js/                 # JavaScript files for frontend interactions
├── scss/               # SCSS files for better CSS management
├── index.php           # Main entry point for the user-facing website
├── login.php           # User login page
├── registration.php    # User registration page
├── meals.php           # Displays meals to users
├── checkout.php        # Checkout process for placing orders
├── your_orders.php     # Displays the user's past orders
└── ...                 # Other supporting files (FAQ, fonts, etc.)
Key Files
index.php: The homepage where users can browse restaurants and meals.
login.php: The login page for user authentication.
registration.php: The registration page where new users can create an account.
checkout.php: Handles the order placement process.
meals.php: Displays meals from the restaurants.
generate_report.php: Generates PDF reports (using FPDF) of orders or receipts.
admin/: Contains files specific to admin users who manage the system's data.
Installation
To install and run this project locally, follow these steps:

Clone the Repository:

bash
Copy code
git clone https://github.com/your-username/food-delivery-system.git
cd food-delivery-system
Setup the Database:

Import the database schema from the DB directory (or use a migration file if available) into your MySQL database.
Update the database configuration in the config file (config.php) to match your local database settings.
Install PHP:

Ensure PHP is installed on your system. You can download it from php.net.
Start the Server:

Use a local development server (e.g., XAMPP, MAMP, or WAMP) to serve the PHP files.
Start your local server and navigate to localhost/your_project_directory in your browser.
Usage
Once the server is up and running:

User Registration: Users can register for a new account using the registration form (registration.php).
User Login: After registration, users can log in to their accounts (login.php) and browse available restaurants and meals (meals.php).
Placing Orders: Users can add meals to their cart, go to the checkout page (checkout.php), and place orders.
Order Tracking: Users can view their order history and the status of ongoing orders (your_orders.php).
Admin Panel
The Admin Panel (accessible through the /admin/ directory) allows administrators to:

Manage restaurants, meals, and menus.
View, update, or delete customer orders.
Generate reports about sales, meals, or user activity.
Admin Authentication:
Admins must log in with their credentials to access the admin panel.

PDF Generation
The project uses the FPDF library to generate PDF files. These PDFs can be generated for:

Order invoices
Sales reports
You can modify or extend the PDF generation in the fpdf.php file.

Database Setup
The system uses a relational database to store user, restaurant, meal, and order data. Here's a general schema of the database:

Users: Stores user credentials, profile information, etc.
Meals: Stores details about available meals.
Restaurants: Information about the restaurants offering meals.
Orders: Tracks customer orders, order status, and payment details.
You'll need to import the provided database schema from the DB directory into your MySQL server. Update the config.php file to reflect your database connection details.

php
Copy code
// Example of database configuration in config.php
$host = "localhost";
$user = "root";
$pass = "";
$db_name = "food_delivery_system";
$conn = new mysqli($host, $user, $pass, $db_name);