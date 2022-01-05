using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;


namespace Business_Logic
{
    public  class BLL
    {
        public static string Insert(Business_Object.BOL InsertD)
        {
            Data_Access.DAL DataAccess = new Data_Access.DAL();
            return DataAccess.Data(InsertD);
        }

        public static DataTable Select()
        {
            return Data_Access.DAL.Datagrid();
        }
    }
}
