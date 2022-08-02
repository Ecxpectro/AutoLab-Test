using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoLab.DAL
{
    public class SucursalDal
    {
        public void RegistrarSucursal(Sucursal objSucursal)
        {
            using (AutoLabEntities ctx = new AutoLabEntities())
            {
                ctx.Sucursal.Add(objSucursal);
                ctx.SaveChanges();
            }
        }
    }
}