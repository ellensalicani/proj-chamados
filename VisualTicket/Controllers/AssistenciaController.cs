using Infra.Services;
using Infra.Services.Interfaces;
using Infra.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VisualTicket.Controllers
{
    public class AssistenciaController : Controller
    {
        private readonly IChamadoService _chamadoService;

        public AssistenciaController()
        {
            _chamadoService = new ChamadoService();
        }

        // GET: Assistencia
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CriarChamado()
        {
            return View();
        }

        [HttpGet]
        public ActionResult EditarChamado(int id)
        {
            var selecionarChamado = _chamadoService.GetChamado(id);
            return View(selecionarChamado);
        }

        [HttpPut]
        public ActionResult Update(ChamadoViewModel chamado)
        {
            try
            {
                _chamadoService.UpdateChamado(chamado);
                return RedirectToAction("ListarChamados","Assistencia");
            } catch(Exception e)
            {
                return RedirectToAction("ListarChamados", "Assistencia");
            }

        }

        [HttpPost]
        public ActionResult Create(ChamadoViewModel chamado)
        {
            _chamadoService.CriarChamado(chamado);
            return RedirectToAction("ListarChamados", "Assistencia");
        }

        [HttpGet]
        public ActionResult ListarChamados()
        {
            var listarChamados = _chamadoService.ListarChamados();
            var vm = listarChamados.Select(x => new ChamadoViewModel()
            {
                Descricao = x.Descricao,
                Funcionario = x.Funcionario,
                Id = x.Id,
                PrecisaAprovacao = x.PrecisaAprovacao,
                Prioridade = x.Prioridade,
                Severidade = x.Severidade,
                Sistema = x.Sistema,
                Titulo = x.Titulo
            }).ToList();
            return View(vm);
        }

        public ActionResult Chamados()
        {
            return View();
        }

        public ActionResult Problemas()
        {
            return View();
        }

        public ActionResult Changes()
        {
            return View();
        }
    }
}