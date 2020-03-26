using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BackEnd.modelo;
using MySql.Data.MySqlClient;
using System.Data;

namespace BackEnd.datos
{
    public class EstadoDao
    {
        public List<Estado> getAll()
        {
            List<Estado> lista = new List<Estado>();

            MySqlCommand sentencia = new MySqlCommand();
            sentencia.CommandText =
                "SELECT IdEstado, Estado" +
                " FROM Estados" +
                " ORDER BY Estado;";

            DataTable tabla = Conexion.ejecutarConsulta(sentencia);

            foreach (DataRow fila in tabla.Rows)
            {
                lista.Add(new Estado() {
                    IdEstado=int.Parse(fila["IdEstado"].ToString()), 
                    Nombre=fila["Estado"].ToString()
                    });
            }

            return lista;
        }
    }
}
