using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace Transforman.controller
{
    public class GetDataList
    {

        public static void InsertCreateOrder(Guid Id_Order, int Type_Order, int Jenis_Penumpang, string No_Pek, string Nama_Penumpang, string Pesawat,
            string Flight_Code, string Jam_Flight, DateTime Tgl_Keberangkatan, DateTime Tgl_Pulang,
            string Keterangan, string NO_SIJ, string No_Polisi,
            int Id_Driver, int Status, int Id_Transaksi_Order)
        {
            database db = new database();
                db.ClearParameters();
            db.SPName = "SP_InsertOrder";
       
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id_Order);
            db.AddParameters("@Type_Order", SqlDbType.Int, Type_Order);
            db.AddParameters("@Jenis_Penumpang", SqlDbType.Int, Jenis_Penumpang);
            db.AddParameters("@No_Pek", SqlDbType.VarChar, No_Pek);
            db.AddParameters("@Nama_Penumpang", SqlDbType.VarChar, Nama_Penumpang);
            db.AddParameters("@Pesawat", SqlDbType.VarChar, Pesawat);
            db.AddParameters("@Flight_Code", SqlDbType.VarChar, Flight_Code);
            db.AddParameters("@Jam_Flight", SqlDbType.VarChar, Jam_Flight);
            db.AddParameters("@Tgl_Keberangkatan", SqlDbType.DateTime, Tgl_Keberangkatan);
            db.AddParameters("@Tgl_Pulang", SqlDbType.DateTime, Tgl_Pulang);
            db.AddParameters("@Keterangan", SqlDbType.VarChar, Keterangan);
            db.AddParameters("@NO_SIJ", SqlDbType.VarChar, NO_SIJ);
            db.AddParameters("@No_Polisi", SqlDbType.VarChar, No_Polisi);
            db.AddParameters("@Id_Driver", SqlDbType.VarChar, Id_Driver);
            db.AddParameters("@Status", SqlDbType.Int, Status);
            db.AddParameters("@Id_Transaksi_Order", SqlDbType.UniqueIdentifier, Id_Transaksi_Order);
            
            DataSet ds = db.ExecuteSP();
            db.Dispose();
        }


        public static DataTable GetDataLoginByparam(string UserName ,string Password)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataLoginByparam";
            db.AddParameters("@User_Name", SqlDbType.VarChar, UserName);
            db.AddParameters("@Password", SqlDbType.VarChar, Password);


            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataUserByparam(string UserName, string Password)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataUserByparam";
            db.AddParameters("@User_Name", SqlDbType.VarChar, UserName);
            db.AddParameters("@Password", SqlDbType.VarChar, Password);


            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        

        public static DataTable GetDataPesawat()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPesawat";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataKelas()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataKelas";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataMerk()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMerk";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        

        public static DataTable GetOrderTransaksi()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetOrderTransaksi";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetTransaksiById(Guid TransaksiId)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetTransaksiById";
            db.AddParameters("@Id_Transaksi", SqlDbType.UniqueIdentifier, TransaksiId);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetOrderById(Guid OrderId)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetOrderById";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, OrderId);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataApproval(int Fungsi)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataApproval";
            db.AddParameters("@Fungsi", SqlDbType.Int, Fungsi);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataOrderPos1(int Posko)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataOrderPos1";
            db.AddParameters("@Posko", SqlDbType.Int, Posko);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDataPegawai()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPegawai";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataPegawaiAuto()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPegawaiAuto";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDataMess()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMess";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        

        public static DataTable GetDataPegawaiPjs(int fungsi)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPegawaiPjs";
            db.AddParameters("@Fungsi", SqlDbType.Int, fungsi);

            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetHistoryPjs(int fungsi)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetHistoryPjs";
            db.AddParameters("@Fungsi", SqlDbType.Int, fungsi);

            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        


    public static DataTable GetDataPegawaiApproval()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataApprovalPegawai";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataFungsi()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataFungsi";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataPegawaiApprovalById(string Id)
        {
            database db = new database();
            db.ClearParameters();
            
            db.SPName = "spGetDataApprovalPegawaiById";
            db.AddParameters("@No_Pek", SqlDbType.VarChar, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataPegawaiById(string Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPegawaiById";
            db.AddParameters("@NoPek", SqlDbType.VarChar, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
       
       


        public static DataTable GetDataMobil()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMobil";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataMobilAll()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMobilAll";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        
        public static DataTable GetDataMobilById(string Nopol)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMobilById";
            db.AddParameters("@NoPol", SqlDbType.VarChar, Nopol);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDataDriver()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataDriver";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataDriverById(Guid Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataDriverById";
            db.AddParameters("@Id_Driver", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataPesawatById(int Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPesawatById";
            db.AddParameters("@Id_Pesawat", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataKelasById(int Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataKelasById";
            db.AddParameters("@id", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataMessById(Guid Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMessById";
            db.AddParameters("@id", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        

        public static DataTable GetDataMerkById(int Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataMerkById";
            db.AddParameters("@Id_Merk", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        

    public static DataTable GetDataUser()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataUser";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataUserById(Guid Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataUserById";
            db.AddParameters("@Id_User", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static string GetOrderNumber()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "SP_GetIdOrder";
            int str = db.ExecuteSPtoString();
            db.Dispose();
            return str.ToString();
        }

        public static DataTable GetDataOrderForAdmin(int type)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataOrderForAdmin";
            db.AddParameters("@Type", SqlDbType.Int, type);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataOrderForUser(string Nopek)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataOrderForUser";
            db.AddParameters("@No_Pek", SqlDbType.VarChar, Nopek);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        

        public static DataTable GetDataPenumpangById(Guid Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataPenumpangById";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDataKursiMobil(string NoPol)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataKursiMobil";
            db.AddParameters("@Nopol", SqlDbType.VarChar, NoPol);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDetailPenumpangbyNoPol(string NoPol)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDetailPenumpangbyNoPol";
            db.AddParameters("@Nopol", SqlDbType.VarChar, NoPol);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetDetailPenumpangbyNoPolSec(string NoPol)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDetailPenumpangbyNoPolSec";
            db.AddParameters("@Nopol", SqlDbType.VarChar, NoPol);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        



        public static DataTable GetHistoryByOrder(Guid Id)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetHistoryByOrder";
            db.AddParameters("@Nama_Order", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }


        public static DataTable GetEmailApproval(int fungsi)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetEmailApprovalByNopek";
            db.AddParameters("@fungsi", SqlDbType.Int, fungsi);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

       

        public static DataTable GetDataEmail()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataEmail";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetEmailAdmin()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetEmailAdmin";
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        
        public static string GetTotalOrderByUserLogin(int TypeUser,string NoPek,int Fungsi)
        {

                database db = new database();
                db.ClearParameters();
                db.SPName = "spGetTotalOrderByUserLogin";
                db.AddParameters("@Type_User", SqlDbType.Int, TypeUser);
                db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
                db.AddParameters("@Fungsi", SqlDbType.VarChar, Fungsi);

            int str = db.ExecuteSPtoString();
                db.Dispose();
                return str.ToString();
            

        }


        public static string GetTotalFinishByUserLogin(int TypeUser, string NoPek,int Fungsi)
        {

            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetTotalFinishByUserLogin";
            db.AddParameters("@Type_User", SqlDbType.Int, TypeUser);
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            db.AddParameters("@Fungsi", SqlDbType.Int, Fungsi);

            int str = db.ExecuteSPtoString();
            db.Dispose();
            return str.ToString();


        }
        public static string GetTotalInProgressByUserLogin(int TypeUser, string NoPek,int Fungsi)
        {

            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetTotalInProgressByUserLogin";
            db.AddParameters("@Type_User", SqlDbType.Int, TypeUser);
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            db.AddParameters("@Fungsi", SqlDbType.Int, Fungsi);
            int str = db.ExecuteSPtoString();
            db.Dispose();
            return str.ToString();


        }

        public static string GetTotalRejectByUserLogin(int TypeUser, string NoPek)
        {

            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetTotalRejectByUserLogin";
            db.AddParameters("@Type_User", SqlDbType.Int, TypeUser);
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            int str = db.ExecuteSPtoString();
            db.Dispose();
            return str.ToString();


        }
        public static DataTable GetDatadasboard(string NoPek)
        {
           database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDatadasboard";
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }

        public static DataTable GetDataStatusByNopek(int TypeUser, string NoPek)
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetDataStatusByNopek";
            db.AddParameters("@Type_User", SqlDbType.Int, TypeUser);
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];            
        }

        public static string GetApprovalId(string NoPek)
        {

            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetApprovalId";
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            int str = db.ExecuteSPtoString();
            db.Dispose();
            return str.ToString();


        }
        public static string GetNamaById(string NoPek)
        {

            database db = new database();
            db.ClearParameters();
            db.SPName = "spGetNamaById";
            db.AddParameters("@NoPek", SqlDbType.VarChar, NoPek);
            string str = db.ExecutetoString();
            db.Dispose();
            return str.ToString();


        }
    }
}