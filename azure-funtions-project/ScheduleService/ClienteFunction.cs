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

namespace ScheduleService
{
    public static class ClienteFunction
    {
        [FunctionName("Cliente")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Entrou no cadastro de cliente.");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);

            string nome = data?.nome;
            string telefone = data?.telefone;
            string dataNascimentoString = data?.dataNascimento;
            DateTime dataNascimento = DateTime.Parse(dataNascimentoString);
            string senha = data?.senha;
            var usuario = new Cliente(nome, telefone, dataNascimento, senha);

            return new OkObjectResult(new Result() { 
                Mensagem = $"Cliente {usuario.Nome} Cadastrado com Sucesso",
                Value = usuario
            });
        }

        [FunctionName("ClienteAcesso")]
        public static async Task<IActionResult> Acesso(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Entrou no login do Cliente.");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);

            var cliente = data?.cliente;
            var senha = data?.senha;

            if (cliente == "ekamoto" && senha == "Senha-321")
                return new OkObjectResult(new Result() { Mensagem = $"Cliente {cliente} autenticado com sucesso!", Value = true });
            else
                return new OkObjectResult(new Result() { Mensagem = $"Cliente ou Senha inválidos!", Value = false });
        }
    }
}
