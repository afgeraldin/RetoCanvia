using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ProductoController : ApiController
    {
        // GET api/<controller>
        public List<Producto> Get()
        {
            return ProductoData.Listar();
        }

        // GET api/<controller>/5
        public Producto Get(int id)
        {
            return ProductoData.Obtener(id);
        }

        public List<Producto> Get(int draw, int start, int length, string ordercolumn, string orderdir)
        {
            return ProductoData.ListarPagination( draw, start, length, ordercolumn, orderdir);
        }

        // POST api/<controller>
        public bool Post([FromBody]Producto oProducto)
        {
            return ProductoData.Registrar(oProducto);
        }

        // PUT api/<controller>/5
        public bool Put([FromBody]Producto oProducto)
        {
            return ProductoData.Modificar(oProducto);
        }

        // DELETE api/<controller>/5
        public bool Delete(int id)
        {
            return ProductoData.Eliminar(id);
        }

        [Route("api/producto/{id}/deletelogicamente")]
        public bool DeleteLogicamente(int id)
        {
            return ProductoData.EliminarLogicamente(id);
        }
    }
}