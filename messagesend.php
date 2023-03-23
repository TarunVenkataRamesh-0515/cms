<?php 
require 'database.php';

$view = $_POST['view'];
$name = $_POST['name'];
$comments = $_POST['comments'];
$email = $_POST['email'];
$num = $_POST['num'];


$sql = "INSERT INTO poll(id, name, email, phone, feedback, suggestions) 
VALUES ('','$name','$email','$num','$view','$comments')";


if ($conn->query($sql) === TRUE) {
    echo '<script>alert("Thank You..! Your Feedback is Valuable to Us"); location.replace(document.referrer);</script>';
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
