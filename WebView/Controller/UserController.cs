﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebView.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ViewResult Index()
        {
            return View();
        }
    }
}