using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VisualTicket.Controllers
{
    public class AdministracaoController : Controller
    {
        // GET: Administracao
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Perfis()
        {
            return View();
        }

        public ActionResult Usuario()
        {
            return View();
        }
    }
}