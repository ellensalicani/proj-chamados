using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using VisualTicket.Entities;

namespace Infra.ViewModel
{
    public class ChamadoViewModel
    {
        [Display(Name = "Id")]
        public int Id { get; set; }

        [Display(Name = "Prioridade")]
        public Prioridade Prioridade { get; set; }

        [Display(Name = "Severidade")]
        public Severidade Severidade { get; set; }

        [Display(Name="Funcionário")]
        public Funcionario Funcionario { get; set; }

        [Display(Name = "Sistema")]
        public Sistema Sistema { get; set; }

        [Display(Name = "Precisa Aprovação?")]
        public bool PrecisaAprovacao { get; set; }

        [Display(Name = "Título")]
        public string Titulo { get; set; }

        [Display(Name = "Descrição")]
        public string Descricao { get; set; }

    }
}