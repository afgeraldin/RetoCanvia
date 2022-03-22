using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class ProductoData
    {
        public static bool Registrar(Producto oProducto)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_registrar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigo", oProducto.Codigo);
                cmd.Parameters.AddWithValue("@marca", oProducto.Marca);
                cmd.Parameters.AddWithValue("@nombre", oProducto.Nombre);
                cmd.Parameters.AddWithValue("@precio", oProducto.Precio);
                cmd.Parameters.AddWithValue("@estado", oProducto.Estado);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static bool Modificar(Producto oProducto)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_modificar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idproducto", oProducto.IdProducto);
                cmd.Parameters.AddWithValue("@marca", oProducto.Marca);
                cmd.Parameters.AddWithValue("@nombre", oProducto.Nombre);
                cmd.Parameters.AddWithValue("@precio", oProducto.Precio);
                cmd.Parameters.AddWithValue("@estado", oProducto.Estado);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static List<Producto> Listar()
        {
            List<Producto> oListaProducto = new List<Producto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_listar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaProducto.Add(new Producto()
                            {
                                IdProducto = Convert.ToInt32(dr["IdProducto"]),
                                Codigo = dr["Codigo"].ToString(),
                                Marca = dr["Marca"].ToString(),
                                Nombre = dr["Nombre"].ToString(),
                                Precio = dr["Precio"].ToString(),
                                Estado = Convert.ToInt32(dr["Estado"]),
                                FechaRegistro = Convert.ToDateTime(dr["FechaRegistro"].ToString()),
                                FechaActualizacion = (dr["FechaActualizacion"] == System.DBNull.Value)? (DateTime?)null: Convert.ToDateTime(dr["FechaActualizacion"])
                        });
                        }

                    }



                    return oListaProducto;
                }
                catch (Exception ex)
                {
                    return oListaProducto;
                }
            }
        }

        public static List<Producto> ListarPagination(int draw,int start,int length,string ordercolumn, string orderdir)
        {
            Int32 ajaxDraw = draw;
            Int32 OffsetValue = start;
            Int32 PagingSize = length;
            string sortColumn = ordercolumn;
            string sortDirection = orderdir;

            Int32 recordTotal = 0;

            List<Producto> oListaProducto = new List<Producto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_listar_pag", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sortColumn", sortColumn);
                cmd.Parameters.AddWithValue("@sortDirection", sortDirection);
                cmd.Parameters.AddWithValue("@OffsetValue", OffsetValue);
                cmd.Parameters.AddWithValue("@PagingSize", PagingSize);


                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaProducto.Add(new Producto()
                            {
                                IdProducto = Convert.ToInt32(dr["IdProducto"]),
                                Codigo = dr["Codigo"].ToString(),
                                Marca = dr["Marca"].ToString(),
                                Nombre = dr["Nombre"].ToString(),
                                Precio = dr["Precio"].ToString(),
                                Estado = Convert.ToInt32(dr["Estado"]),
                                FechaRegistro = Convert.ToDateTime(dr["FechaRegistro"].ToString()),
                                FechaActualizacion = (dr["FechaActualizacion"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dr["FechaActualizacion"])
                            });
                        }

                    }

                    return oListaProducto;
                }
                catch (Exception ex)
                {
                    return oListaProducto;
                }
            }
        }

        public static Producto Obtener(int idproducto)
        {
            Producto oProducto = new Producto();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_obtener", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idproducto", idproducto);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oProducto = new Producto()
                            {
                                IdProducto = Convert.ToInt32(dr["IdProducto"]),
                                Codigo = dr["Codigo"].ToString(),
                                Marca = dr["Marca"].ToString(),
                                Nombre = dr["Nombre"].ToString(),
                                Precio = dr["Precio"].ToString(),
                                Estado = Convert.ToInt32(dr["Estado"]),
                                FechaRegistro = Convert.ToDateTime(dr["FechaRegistro"].ToString()),
                                FechaActualizacion = (dr["FechaActualizacion"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dr["FechaActualizacion"])
                            };
                        }

                    }



                    return oProducto;
                }
                catch (Exception ex)
                {
                    return oProducto;
                }
            }
        }

        public static bool Eliminar(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_eliminar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idproducto", id);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static bool EliminarLogicamente(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_producto_eliminarLogicamente", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idproducto", id);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
    }
}