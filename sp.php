<?php
/*
CREATE PROCEDURE manufact(
    IN name VARCHAR(50),
    IN address VARCHAR(100),
    IN contact VARCHAR(50)
)
BEGIN
    INSERT INTO manufacturer(name, address, contact)
    VALUES(name, address, contact);
END //

DROP PROCEDURE IF EXISTS manufact;
*/
	if(isset($_POST["name"])){
	$db = new mysqli("localhost", "root", NULL, "company");
	$name=$_POST["name"];
	$address=$_POST["address"];
	$tel=$_POST["contact"];
	$queryString="call manufact('$name','$address','$tel');";	
	if($db->query($queryString)){echo "Data Added!!";}
	else echo "Error!!!";
	$db->close();
	}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="#" method="post">
        <table style="width: 100%; border: 1px solid red">            
            <tr>
                <td>name</td>
                <td>:</td>
                <td><input type="text" name="name" id="name" /></td>
            </tr>
            <tr>
                <td>address</td>
                <td>:</td>
                <td><input type="text" name="address" id="address" /></td>
            </tr>
            <tr>
                <td>contact_no</td>
                <td>:</td>
                <td><input type="text" name="contact" id="contact" /></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <input type="submit" name="add" value="Add">
                </td>
            </tr>
        </table>
    </form>

</body>

</html>