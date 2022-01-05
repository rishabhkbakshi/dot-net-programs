using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BAL
{
    public class BAL
    {
        public string InsertBAL(BOL.BOL objInsertBAL)
        {
            DAL.DAL Insert = new DAL.DAL();
           return  Insert.Insert(objInsertBAL);
        }
        public static DataTable BindData()
        {
           return  DAL.DAL.Select();          
        }
    }
}
