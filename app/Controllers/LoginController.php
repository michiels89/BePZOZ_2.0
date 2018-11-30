<?php

<?php
session_start();

require_once '../DataBase.php';
$db = new Database();
$errors = [];
if (isset($_SESSION['email'])) {
    header("Location:loggedIn.php");
}

//LOGIN PROCESS//
//1. Check is login button is clicked
if (isset($_POST['login'])) {

    //2. Trim $_POST to remove accidental extra whitespace and put in variable
    $email = !empty($_POST['email']) ? trim($_POST['email']) : null;
    $password = !empty($_POST['password']) ? trim($_POST['password']) : null;

    //3. Check if fields are empty
    if (empty($email)) {
        $errors[] = "E-mail is verplicht!";
    }
    if (empty($password)) {
        $errors[] = "Wachtwoord is verplicht!";
    }
    //4. Validate email when there are no errors
    if (count($errors) == 0) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errors[] = "E-mail is niet geldig!";
        } else {
            //5. Check to see if email exists in database
            $sql = "SELECT * FROM users WHERE email = :email";
            $db->executeWithParam($sql, array(array(':email', $email)));
            //6. Check if email is found in database
            if ($db->rowCount() == 0) {
                $errors[] = "Sorry, gebruiker met e-mailadres " . $email . " bestaat niet in onze databank.";
            }
        }
        if (count($errors) == 0) {
            $results = $db->single();
            //7. Check if passwords match
            if (!password_verify($_POST['password'], $results['paswoord'])) {
                $errors[] = "Wachtwoord voor " . $email . " is niet correct.";
            } else {
                $_SESSION['email'] = $results['email'];
                header("Location:loggedIn.php");
            }
        }
    }
}