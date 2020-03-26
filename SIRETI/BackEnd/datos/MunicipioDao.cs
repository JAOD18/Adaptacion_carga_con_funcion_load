using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BackEnd.modelo;
using System.Data;
using MySql.Data.MySqlClient;

namespace BackEnd.datos
{
    public class MunicipioDao
    {
        public List<Municipio> getAll() {
            List<Municipio> lista = new List<Municipio>();

            MySqlCommand sentencia = new MySqlCommand();
            sentencia.CommandText =
                "SELECT m.IdMunicipio, m.Municipio," +
                " m.IdEstado, e.Estado"+
                " FROM Municipios m"+
                " JOIN Estados e USING(IdEstado)"+
                " ORDER BY e.Estado, m.Municipio;";

            DataTable tabla = Conexion.ejecutarConsulta(sentencia);

            foreach (DataRow fila in tabla.Rows)
            {
                lista.Add(new Municipio(
                    int.Parse(fila["IdMunicipio"].ToString()), fila["Municipio"].ToString(),
                    int.Parse(fila["IdEstado"].ToString()), fila["Estado"].ToString()
                    ));
            }

            return lista;
        }
        public Municipio getOne(int id) {
            try
            {
                MySqlCommand sentencia = new MySqlCommand(
                    "SELECT m.Municipio," +
                    " m.IdEstado, e.Estado" +
                    " FROM Municipios m" +
                    " JOIN Estados e USING(IdEstado)" +
                    " WHERE IdMunicipio=" + id);

                DataTable tabla = Conexion.ejecutarConsulta(sentencia);
                Municipio m = null;
                if (tabla != null && tabla.Rows.Count > 0)
                {
                    DataRow fila = tabla.Rows[0];
                    m = new Municipio(
                    id, fila["Municipio"].ToString(),
                    int.Parse(fila["IdEstado"].ToString()), fila["Estado"].ToString()
                    );
                }
                return m;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public int insert(Municipio obj) {
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "INSERT INTO Municipios (Municipio,IdEstado) "+
                    "VALUES(@Municipio,@IdEstado); SELECT LAST_INSERT_ID();";

                sentencia.Parameters.AddWithValue("@Municipio", obj.Nombre);
                sentencia.Parameters.AddWithValue("@IdEstado", obj.IdEstado);

                int idGenerado = Conexion.ejecutarSentencia(sentencia, true);

                return idGenerado;

            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public bool update(Municipio obj)
        {
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "UPDATE Municipios SET Municipio=@Municipio, IdEstado=@IdEstado WHERE IdMunicipio=@IdMunicipio";

                sentencia.Parameters.AddWithValue("@Municipio", obj.Nombre);
                sentencia.Parameters.AddWithValue("@IdEstado", obj.IdEstado);
                sentencia.Parameters.AddWithValue("@IdMunicipio", obj.IdMunicipio);

                if (Conexion.ejecutarSentencia(sentencia, false) > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool delete(int id) {
            try
            {
                MySqlCommand sentencia = new MySqlCommand();
                sentencia.CommandText = "DELETE FROM Municipios WHERE IdMunicipio=@IdMunicipio";

                sentencia.Parameters.AddWithValue("@IdMunicipio", id);

                if (Conexion.ejecutarSentencia(sentencia, false) > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
