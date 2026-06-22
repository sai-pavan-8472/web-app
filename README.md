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

## Deployment to Azure App Service

### Prerequisites

- Azure subscription
- Azure CLI installed
- Web App created with runtime stack: .NET - v4.0

### Step 1: Create an App Service (if not already created)

```bash
az group create --name myResourceGroup --location eastus
az appservice plan create --name myAppServicePlan --resource-group myResourceGroup --sku FREE
az webapp create --resource-group myResourceGroup --plan myAppServicePlan --name myBasicWebApp
```

### Step 2: Configure Runtime Stack

Ensure the App Service is configured with:
- Runtime Stack: .NET - v4.0
- This can be set during creation or updated in the Azure Portal

### Step 3: Publish the Application

**Option A: Using Visual Studio**

1. Right-click the project → Publish
2. Select "Azure App Service"
3. Choose your subscription and app service
4. Click "Publish"

**Option B: Using Azure CLI**

```bash
cd web-app
msbuild BasicWebApp.csproj /p:Configuration=Release

# Zip the contents
Compress-Archive -Path Default.aspx, Global.asax, Global.asax.cs, Web.config, BasicWebApp.csproj -DestinationPath publish.zip

# Deploy
az webapp deployment source config-zip --resource-group myResourceGroup --name myBasicWebApp --src publish.zip
```

**Option C: Direct Deployment with FTP**

1. Get FTP credentials from Azure Portal
2. Use FileZilla or any FTP client
3. Connect to your App Service
4. Upload files to wwwroot directory

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