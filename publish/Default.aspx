<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Minimal Basic Web App</title>
    <style>body{font-family:Arial,Helvetica,sans-serif;margin:40px}</style>
</head>
<body>
    <h1>Minimal Basic Web App</h1>
    <p>This is a minimal ASP.NET Web Forms page for quick deployment and testing.</p>
    <p>Server time: <%= DateTime.UtcNow.ToString("u") %></p>
</body>
</html>
