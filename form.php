<?php
include('config.php');

if(isset($_POST['button'])){
    $name=$_POST['name'];
    $lastname=$_POST['lastname'];
    $email=$_POST['email'];
    $company=$_POST['company'];
    $information=$_POST['information'];
    $sql="INSERT INTO inscription (Name, `Last Name`, Email, Company, Information) VALUES (?,?,?,?,?)";

    try{
        $button=$conn->prepare($sql);
        $button->execute([$name,$lastname,$email,$company,$information]);
        header('location:cv.html');
    } catch(PDOException $e){
        echo"Connection failed: ".$e->getMessage();
    }
}