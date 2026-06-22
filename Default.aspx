<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basic Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .info {
            background-color: #e7f3ff;
            border-left: 4px solid #2196F3;
            padding: 10px;
            margin: 20px 0;
        }
        .timestamp {
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Basic Web App</h1>
        <p>This is a basic ASP.NET Web Application running on .NET Framework 4.0</p>
        
        <div class="info">
            <strong>Application Information:</strong>
            <ul>
                <li>Runtime: .NET Framework 4.0</li>
                <li>Platform: ASP.NET Web Forms</li>
                <li>Server: <%= Environment.MachineName %></li>
                <li class="timestamp">Page loaded at: <%= DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") %></li>
            </ul>
        </div>

        <div class="info">
            <strong>System Information:</strong>
            <ul>
                <li>OS Version: <%= Environment.OSVersion %></li>
                <li>Processor Count: <%= Environment.ProcessorCount %></li>
                <li>.NET Version: <%= Environment.Version %></li>
            </ul>
        </div>

        <h2>Features</h2>
        <ul>
            <li>Simple and lightweight</li>
            <li>Easy to deploy on Azure App Service</li>
            <li>Compatible with .NET Framework 4.0+</li>
            <li>Ready for production deployment</li>
        </ul>

        <hr />
        <p style="color: #888; font-size: 0.9em;">
            This application is ready to be deployed to Azure App Service.
        </p>
    </div>
</body>
</html>
