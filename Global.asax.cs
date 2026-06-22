using System;

namespace BasicWebApp
{
    public partial class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Application startup code
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Application shutdown code
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Error handling code
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Session start code
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Session end code
        }
    }
}
