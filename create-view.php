<?php
$conn = new mysqli("localhost", "root", "", "company");
//create view
$myQuery = "create or replace view shamim as select * from product where price>5000;";
$conn->query($myQuery);
echo "View created successfully";
$conn->close();
?>