using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADOEstatus
{
    class ADOEstatus
    {

        private string _cnnString;

        public void Principal()
        {
            string decicion;
            do
            {
                Console.WriteLine("1.-Agregar.");
                Console.WriteLine("2.-Consoltar Todo.");
                Console.WriteLine("3.-Consultar 1");
                Console.WriteLine("4.-Consultar con filtro");
                Console.WriteLine("5.-Modificar");
                Console.WriteLine("6.-Eliminar");
                Console.WriteLine("7.-Terminar");
                decicion = Console.ReadLine();

                switch (decicion)
                {
                    case "1":
                        Console.WriteLine("\nAgregar un Estatus\n");
                        Console.WriteLine($"Id Asignado: {AgregarEstatus()}");
                        MostrarTodos();
                        break;
                    case "2":
                        Console.WriteLine("\nMostrar todos\n");
                        MostrarTodos();
                        break;
                    case "3":
                        Console.WriteLine("\nMostrar solo uno\n");
                        MostrarUno();
                        break;
                    case "4":
                        Console.WriteLine("\nMostrar Filtro \n");
                        MostrarFiltro();
                        break;
                    case "5":
                        Console.WriteLine("\nActualizar Estatus");
                        MostrarTodos();
                        ModificarEstatus();
                        MostrarTodos();
                        break;
                    case "6":
                        Console.WriteLine("\nEliminar un estatus\n");
                        MostrarTodos();
                        EliminarEstatus();
                        MostrarTodos();
                        break;
                    default:
                        break;
                }
            } while (decicion != "7");
        }

        public ADOEstatus()
        {
            _cnnString = ConfigurationManager.ConnectionStrings["InstitutoTich"].ConnectionString;
        }

        public void MostrarTodos()
        {

            List<EstatusAlumno> estatus = consultarLst();

            foreach (var esta in estatus)
            {
                Console.WriteLine($"\t{esta.id}\t {esta.clave}\t{esta.nombre}\t");
            }
        }

        public List<EstatusAlumno> consultarLst()
        {
            List<EstatusAlumno> listaAlumnoEstatus = new List<EstatusAlumno>();
            
            try
            {
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    SqlCommand comando = new SqlCommand("sp_TodosEstatus", con);
                    comando.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader reader = comando.ExecuteReader();
                    while (reader.Read())
                    {
                        EstatusAlumno EstaAlumno = new EstatusAlumno();
                        EstaAlumno.id = Convert.ToInt32(reader["id"]);
                        EstaAlumno.nombre = Convert.ToString(reader["nombre"]);
                        EstaAlumno.clave = Convert.ToString(reader["clave"]);
                        listaAlumnoEstatus.Add(EstaAlumno);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("error al consultar", ex);
            }
            return listaAlumnoEstatus;
        }

        public void MostrarUno()
        {
            Console.WriteLine("Ingresa el Id del Estatus");
            int id = int.Parse(Console.ReadLine());

            List<EstatusAlumno> Estatus = consultarUno(id);

            foreach (var estatu in Estatus)
            {
                Console.WriteLine($"\t{estatu.id}\t{estatu.clave}\t{estatu.nombre}\t");
            }

        }

        public List<EstatusAlumno> consultarUno(int id)
        {
            List<EstatusAlumno> ListaSoloUno = new List<EstatusAlumno>();
            try
            {
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    SqlCommand comando = new SqlCommand("sp_SoloUno", con);
                    comando.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    comando.Parameters.AddWithValue("@id", id);
                    SqlDataReader reader = comando.ExecuteReader();
                    while (reader.Read())
                    {
                        EstatusAlumno estatusAlumno = new EstatusAlumno();
                        estatusAlumno.id = Convert.ToInt32(reader["id"]);
                        estatusAlumno.nombre = Convert.ToString(reader["nombre"]);
                        estatusAlumno.clave = Convert.ToString(reader["clave"]);
                        ListaSoloUno.Add(estatusAlumno);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("error al consultar", ex);
            }

            return ListaSoloUno;
        }

        public void MostrarFiltro() 
        {
            Console.WriteLine("\nColoque la Condicion");
            string filtro = Console.ReadLine();

            List<EstatusAlumno> listaFiltro = consultaFiltro(filtro);

            foreach (var fil in listaFiltro)
            {
                Console.WriteLine($"\t{fil.id}\t{fil.clave}\t{fil.nombre}\t");
            }

        }

        public List<EstatusAlumno> consultaFiltro(string filtro)
        {
            string query = $"select * from estatusAlumnos where {filtro}";
            List<EstatusAlumno> filtro2 = new List<EstatusAlumno>();

            try
            {
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    SqlCommand comando = new SqlCommand(query, con);
                    comando.CommandType = CommandType.Text;
                    con.Open();
                    SqlDataReader reader = comando.ExecuteReader();
                    while (reader.Read())
                    {
                        EstatusAlumno esta = new EstatusAlumno();
                        esta.id = Convert.ToInt32(reader["id"]);
                        esta.nombre = Convert.ToString(reader["nombre"]);
                        esta.clave = Convert.ToString(reader["clave"]);
                        filtro2.Add(esta);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("error al filtrar", ex);
            }
            return filtro2;

        }

        public int AgregarEstatus()
        {
            Console.WriteLine("\nClave");
            string clave = Console.ReadLine();
            Console.WriteLine("\nNombre");
            string nombre = Console.ReadLine();

            int IdRegreso = 0;

            try 
            {
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    SqlCommand comando = new SqlCommand("sp_AddEstatus", con);
                    comando.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    comando.Parameters.AddWithValue("@clave", clave);
                    comando.Parameters.AddWithValue("@nombre", nombre);

                    IdRegreso = (int)comando.ExecuteScalar();

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar", ex);
            }
            return IdRegreso;
        }

        

        public void ModificarEstatus()
        {
            Console.WriteLine("\nIngresa el Id que deseas modificar");
            int id = int.Parse(Console.ReadLine());

            List<EstatusAlumno> list = consultarLst();

            EstatusAlumno estatuAlumno = list.Find(alum => alum.id == id);

            Console.WriteLine("\nClave:");
            string clave = Console.ReadLine();
            
            if (clave == "")
            {
                clave = estatuAlumno.clave;
            }
            Console.WriteLine("\nNombre:");
            string nombre = Console.ReadLine();

            if (nombre == "")
            {
                nombre = estatuAlumno.nombre;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(_cnnString))
                {
                    SqlCommand comando = new SqlCommand("sp_ActualizarEstatus", con);
                    comando.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    comando.Parameters.AddWithValue("@id",id);
                    comando.Parameters.AddWithValue("@clave", clave);
                    comando.Parameters.AddWithValue("@nombre", nombre);
                    comando.ExecuteNonQuery();
                    comando.Parameters.Clear();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al Actualizar", ex);
            }


        }
    }
}
