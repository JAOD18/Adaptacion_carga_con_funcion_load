namespace BackEnd.modelo
{
    public class Municipio
    {
        public int IdMunicipio { get; set; }
        public string Nombre { get; set; }
        public int IdEstado { get; set; }
        public string Estado { get; set; }

        private string estado;
        public string getEstado() {
            return estado;
        }
        public void setEstado(string valor) {
            estado = valor;
        }

        public Municipio() { }
        public Municipio(int idMunicipio, string nombre, int idEstado, string estado)
        {
            IdMunicipio = idMunicipio;
            Nombre = nombre;
            IdEstado = idEstado;
            Estado = estado;
        }

        public override string ToString()
        {
            return IdMunicipio+", "+ Nombre + ", " + IdEstado + ", " + Estado;
        }

    }
}
