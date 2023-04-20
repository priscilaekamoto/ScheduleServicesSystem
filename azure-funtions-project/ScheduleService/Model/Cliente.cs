using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScheduleService.Model
{
    public class Cliente
    {
        public string Nome { get; set; }
        public string Telefone { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }

        public Cliente(string nome, string telefone, DateTime dataNascimento, string senha)
        {
            Nome = nome;
            Telefone = telefone;
            DataNascimento = dataNascimento;
            Senha = senha;
        }
    }
}
