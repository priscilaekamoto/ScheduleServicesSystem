using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using ScheduleService.Dto;
using ScheduleService.Model;
using System.Collections.Generic;

namespace ScheduleService
{
    public static class ServicoFunction
    {
        [FunctionName("Servico")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Entrou no listagem de Serviços.");

            List<Servico> lista = new List<Servico>();
            lista.Add(new Servico() { 
                Nome = "Unha",
                Tempo = 0.5m,
                Valor = 50.50m
            });
            lista.Add(new Servico()
            {
                Nome = "Cabelo",
                Tempo = 1m,
                Valor = 110.0m
            });
            lista.Add(new Servico()
            {
                Nome = "Pé",
                Tempo = 0.5m,
                Valor = 70.0m
            });

            lista.Add(new Servico()
            {
                Nome = "Sobrancelha",
                Tempo = 0.5m,
                Valor = 70.0m
            });

            return new OkObjectResult(new Result()
            {
                Mensagem = $"",
                Value = lista
            });
        }
    }
}
