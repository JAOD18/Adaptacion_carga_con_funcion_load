using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BackEnd.modelo;

namespace BackEnd.datos
{
    public class UsuarioDAO
    {
        List<Usuario> usuarios = new List<Usuario>();

        public UsuarioDAO() {
            usuarios.Add(new Usuario() { Email = "S16120001@itsur.edu.mx", Password = "123456", Tipo = 0 });
            usuarios.Add(new Usuario() { Email = "p.vega@itsur.edu.mx", Password = "123456", Tipo = 1 });
            usuarios.Add(new Usuario() { Email = "sistemas@itsur.edu.mx", Password = "123456", Tipo = 2 });
            usuarios.Add(new Usuario() { Email = "a@a.aa", Password = "123456", Tipo = 3 });
        }
        public Usuario iniciarSesion(String email, String password) {
            foreach (Usuario u in usuarios) {
                if (u.Email.ToLower().Equals(email.ToLower()) &&
                    u.Password.Equals(password)) {
                    return u;
                }
            }
            return null;

        }
    }
}
