﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;


using System.Web.Mvc;

using DBWork;

namespace WebView
{
    public class Global : HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {

            // Код, выполняемый при запуске приложения
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            AreaRegistration.RegisterAllAreas();
            RouteConfig2.RegisterRoutes(RouteTable.Routes);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            BundleConfig2.RegisterBundles(BundleTable.Bundles);
        }
    }
}