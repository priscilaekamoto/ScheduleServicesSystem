using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using ScheduleService.Dto;
using ScheduleService.Model;

namespace ScheduleService
{
    public class UsuarioFunction
    {
        [FunctionName("Usuario")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Entrou no cadastro de cliente.");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject<dynamic>(requestBody);

            string nome = data?.nome;
            string email = data?.email;
            int idade = data?.idade;
            var usuario = new Usuario(nome, email, idade);

            return new OkObjectResult(new Result()
            {
                Mensagem = $"Usuário {usuario.Nome} OK",
                Value = usuario
            });
        }

        [FunctionName("UsuarioPorNome")]
        public static async Task<IActionResult> UsuarioPorNome(
           [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
           ILogger log)
        {
            var nomeQuery = req.Query["nome"].FirstOrDefault();

            var listaUsuarios = new List<Usuario>();
            listaUsuarios.Add(new Usuario("leandro", "ekamoto.leandro@gmail.com", 37));
            listaUsuarios.Add(new Usuario("priscila", "ekamoto.pry@gmail.com", 37));

            if (!string.IsNullOrEmpty(nomeQuery))
            {

                listaUsuarios = listaUsuarios.Where(t => t.Nome.Equals(nomeQuery)).ToList();

                if (listaUsuarios.Count > 0)
                {
                    return new OkObjectResult(new Result()
                    {
                        Mensagem = $"",
                        Value = listaUsuarios
                    });
                }
                else
                {
                    return new OkObjectResult(new Result()
                    {
                        Mensagem = $"Usuário não cadastrado",
                        Value = ""
                    });
                }

            }

            return new OkObjectResult(new Result()
            {
                Mensagem = $"",
                Value = listaUsuarios
            });
        }

    }
}