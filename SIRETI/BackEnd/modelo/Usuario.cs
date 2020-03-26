using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.modelo
{
    public class Usuario
    {
        public String Email { get; set; }
        public String Password { get; set; }
        /// <summary>
        /// 0 Alumno
        /// 1 Docente
        /// 2 Coordinador
        /// 3 EncargadoResidencias
        /// </summary>
        public int Tipo { get; set; }
        public Usuario()
        { }
        
        public Usuario(String email, String password,
            int tipo) {
            Email = email;
            Password = password;
            Tipo = tipo;
        }
    }
}
