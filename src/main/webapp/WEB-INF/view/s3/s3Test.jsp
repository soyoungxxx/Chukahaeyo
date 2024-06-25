<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Chicken Icon</title>
</head>
<body>
<h1>Chicken Icon</h1>
<img src="https://chukahaeyo-bucket.s3.amazonaws.com/chicken_icon.png" alt="Chicken Icon"/>
<br/><br/>

<h2>Upload New Chicken Icon</h2>
<form action="upload" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="file" id="file">
    <input type="submit" value="Upload Image" name="submit">
</form>
</body>
</html>
