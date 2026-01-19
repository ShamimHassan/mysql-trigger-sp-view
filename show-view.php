<?php
$conn = new mysqli("localhost", "root", "", "company");
$q = "select * from shamim;";
$result = $conn->query($q);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>View in table</h1>
    <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Manufacturer ID</th>
        </tr>
        <?php
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["id"] . "</td>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td>" . $row["price"] . "</td>";
            echo "<td>" . $row["mid"] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
    <?php
    $result->free();
    $conn->close();
    ?>
</body>
</html>