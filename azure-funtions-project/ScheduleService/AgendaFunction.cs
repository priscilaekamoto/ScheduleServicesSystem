using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using ScheduleService.Dto;
using ScheduleService.Model;
using System.Collections.Generic;

namespace ScheduleService
{
    public static class AgendaFunction
    {
        [FunctionName("Agenda")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Entrou no listagem de Agenda.");

            List<Agenda> lista = new List<Agenda>();
            lista.Add(new Agenda()
            {
                DataHora = DateTime.Parse("2022-11-10 12:30"),
                Disponivel = true
            });
            lista.Add(new Agenda()
            {
                DataHora = DateTime.Parse("2022-11-10 14:00"),
                Disponivel = true
            });
            lista.Add(new Agenda()
            {
                DataHora = DateTime.Parse("2022-11-11 08:00"),
                Disponivel = true
            });

            return new OkObjectResult(new Result()
            {
                Mensagem = $"",
                Value = lista
            });
        }
    }
}
