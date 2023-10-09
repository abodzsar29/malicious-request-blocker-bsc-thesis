<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

$hostname = "localhost";
$username = "andrew";
$password = "password";
$db = "storage";

$dbconnect=mysqli_connect($hostname,$username,$password,$db);

if ($dbconnect->connect_error) {
  die("Database connection failed: " . $dbconnect->connect_error);
}

?>

<table border="1" align="center">
<tr>
  <td>Number</td>
  <td>Price</td>
</tr>

<?php

$query = mysqli_query($dbconnect, "SELECT * FROM prices");

while ($row = mysqli_fetch_array($query)) {
  echo
   "<tr>
    <td>{$row['number']}</td>
    <td>{$row['price']}</td>
   </tr>\n";

}

?>
</table>
</body>
</html>