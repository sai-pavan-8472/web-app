# Basic ASP.NET Web App (.NET Framework 4.0)

This is a basic web application built with ASP.NET Web Forms targeting .NET Framework 4.0.

## Project Structure

```
BasicWebApp/
├── Default.aspx          - Main web page
├── Global.asax           - Application-level events
├── Global.asax.cs        - Code-behind for Global.asax
├── Web.config            - Configuration file
├── BasicWebApp.csproj    - Project file
├── bin/                  - Compiled binaries (created during build)
└── obj/                  - Intermediate build files
```

## Features

- Simple and lightweight web application
- Displays system information and current timestamp
- Clean, responsive HTML interface
- Ready for deployment to Azure App Service

## Prerequisites

- Visual Studio 2012 or later with ASP.NET tools
- .NET Framework 4.0 or later installed
- Azure CLI (for deployment)

## Building the Application

### Local Development

1. Open `BasicWebApp.csproj` in Visual Studio
2. Build the solution (Ctrl+Shift+B)
3. Run the application (F5) to start the local development server
4. Navigate to `http://localhost:xxxx/Default.aspx` in your browser

### Build from Command Line

```bash
msbuild BasicWebApp.csproj /p:Configuration=Release /p:Platform=AnyCPU
```

## Deployment to Azure App Service (Minimal ZIP deploy)

Use the ZIP deployment method to quickly test a minimal app and isolate errors.

1) Create a minimal site in the repo root:

PowerShell:
```powershell
mkdir .\simple-deploy
Set-Content -Path .\simple-deploy\Default.aspx -Value '<%@ Page Language="C#" AutoEventWireup="true" %><!DOCTYPE html><html><body><h1>Minimal App</h1></body></html>'
Set-Content -Path .\simple-deploy\Web.config -Value '<?xml version="1.0" encoding="utf-8"?><configuration><system.web><compilation debug="false" targetFramework="4.0" /></system.web></configuration>'
Compress-Archive -Path .\simple-deploy\* -DestinationPath .\app.zip -Force
```

2) Deploy the ZIP to your App Service:

```bash
az webapp deployment source config-zip --resource-group ci-dev-01 --name ci-web-app-01 --src ./app.zip
```

3) Tail logs while deploying:

```bash
az webapp log tail --name ci-web-app-01 --resource-group ci-dev-01
```

If the minimal app deploys successfully, incrementally add back files from the main project until the failure reappears. This isolates the problematic file or configuration.

## Configuration

The `Web.config` file contains application settings:

```xml
<system.web>
    <compilation debug="true" targetFramework="4.0" />
    <httpRuntime targetFramework="4.0" />
</system.web>
```

Modify this as needed for your deployment environment.

## Accessing the Application

Once deployed to Azure, access your application at:
```
https://myBasicWebApp.azurewebsites.net/Default.aspx
```

Or simply visit:
```
https://myBasicWebApp.azurewebsites.net/
```

## Testing

1. The application displays:
   - Welcome message
   - Current server time
   - System information (OS, processor count, .NET version)

2. Check that all information loads correctly

3. Monitor application logs in Azure Portal:
   - Application Insights
   - Diagnostic Settings
   - Log Stream

## Troubleshooting

### Application doesn't load

1. Check App Service Logs in Azure Portal
2. Verify runtime stack is set to .NET 4.0 in App Service settings
3. Ensure files are properly deployed to wwwroot
4. Check web.config for syntax errors

### Port issues

App Service automatically assigns ports. The `Web.config` is configured to work with App Service's port configuration.

### Performance

For production, modify `Web.config`:

```xml
<compilation debug="false" targetFramework="4.0" />
```

Set `debug="false"` in production for better performance.

## Support

For Azure App Service documentation, visit: https://docs.microsoft.com/en-us/azure/app-service/