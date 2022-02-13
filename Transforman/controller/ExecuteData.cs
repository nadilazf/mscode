using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.IO;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Transforman.controller
{
    public class ExecuteData
    {
       
        public static void InsertCreateOrder(DataModel.OrderData OrderData)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
            db.SPName = "SP_InsertOrderData";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier,OrderData.Id_Order);
            db.AddParameters("@Type_Order", SqlDbType.Int, OrderData.Type_Order);
            db.AddParameters("@Nama_Order", SqlDbType.VarChar, OrderData.Nama_Order);
            db.AddParameters("@Jumlah_Penumpang", SqlDbType.Int, 0);
            db.AddParameters("@Tgl_Penjemputan", SqlDbType.Date, OrderData.Tgl_Penjemputan);
            db.AddParameters("@Jam_Penjemputan", SqlDbType.VarChar, OrderData.Jam_Penjemputan);
            db.AddParameters("@No_Polisi", SqlDbType.VarChar, "");
           // db.AddParameters("@Id_Driver", SqlDbType.UniqueIdentifier,'00000000-0000-0000-0000-000000000000');
            db.AddParameters("@Status", SqlDbType.VarChar, OrderData.Status);
            db.AddParameters("@CreatedBy", SqlDbType.VarChar,OrderData.CreatedBy);
            db.AddParameters("@CreatedDate", SqlDbType.DateTime, DateTime.Now);
            db.AddParameters("@UpdateBy", SqlDbType.VarChar, OrderData.CreatedBy);
            db.AddParameters("@UpdateDate", SqlDbType.DateTime, DateTime.Now);



            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }
      
        public static void InsertPenumpang(DataModel.Penumpang OrderData,Guid OrderId)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
            db.SPName = "SP_InsertPenumpang";
            db.AddParameters("@Id_Penumpang", SqlDbType.UniqueIdentifier, Guid.NewGuid());
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, OrderId);
            db.AddParameters("@Jenis_Penumpang", SqlDbType.Int, OrderData.JenisPenumpang);
            db.AddParameters("@No_Pek", SqlDbType.VarChar, OrderData.NoPek);
            db.AddParameters("@Nama_Penumpang", SqlDbType.VarChar, OrderData.Nama);
            db.AddParameters("@Pesawat", SqlDbType.VarChar, OrderData.Pesawat);
            db.AddParameters("@Flight_Code", SqlDbType.VarChar, OrderData.FlighCode);
            db.AddParameters("@Jam_Flight", SqlDbType.VarChar, OrderData.JamFligh);
            db.AddParameters("@Tgl_Keberangkatan", SqlDbType.DateTime, OrderData.tglKeberangkatan);
            if (OrderData.tglPulang != DateTime.MinValue)
                db.AddParameters("@Tgl_Pulang", SqlDbType.DateTime, OrderData.tglPulang);
            else
                db.AddParameters("@Tgl_Pulang", SqlDbType.DateTime, OrderData.tglKeberangkatan);
            
            db.AddParameters("@Keterangan", SqlDbType.VarChar, OrderData.Ket);
            db.AddParameters("@NO_SIJ", SqlDbType.VarChar, OrderData.NoSIJ);
            db.AddParameters("@Mobil", SqlDbType.VarChar, "");

            DataSet ds = db.ExecuteSP();
            db.Dispose();


            
        }

        


        public static void InsertHistory(Guid Nama_Order,string  Activity, string Nama_User,string  Comments)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
            db.SPName = "SP_InsertHistory";

            db.AddParameters("@Nama_Order", SqlDbType.UniqueIdentifier, Nama_Order);
            db.AddParameters("@DateActivity", SqlDbType.DateTime, DateTime.Now);
            db.AddParameters("@Activity", SqlDbType.VarChar, Activity);
            db.AddParameters("@Nama_User", SqlDbType.VarChar, Nama_User);
            db.AddParameters("@Comments", SqlDbType.VarChar, Comments);
          
      
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }


        public static void InsertEmail(Guid IdOrder,string EmailName, string AliasFrom, string EmailFrom, string AliasTo, string EmailTo,string OrderNumber, string EmployeeName, string Opening,
            string Tujuan,DateTime TglKeberangkatan,string jam,int JumlahPenumpang,string LinkUrl,int StatusEmail,string Mobil,string Sopir)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
            db.SPName = "SP_InsertEmail";
            db.AddParameters("@IdOrder", SqlDbType.UniqueIdentifier, IdOrder);
            db.AddParameters("@EmailName", SqlDbType.VarChar, EmailName);
            db.AddParameters("@AliasFrom", SqlDbType.VarChar, AliasFrom);
            db.AddParameters("@EmailFrom", SqlDbType.VarChar, EmailFrom);
            db.AddParameters("@AliasTo", SqlDbType.VarChar, AliasTo);
            db.AddParameters("@EmailTo", SqlDbType.VarChar, EmailTo);
            db.AddParameters("@OrderNumber", SqlDbType.VarChar, OrderNumber);
            db.AddParameters("@EmployeeName", SqlDbType.VarChar, EmployeeName);
            db.AddParameters("@Opening", SqlDbType.VarChar, Opening);
            db.AddParameters("@Tujuan", SqlDbType.VarChar, Tujuan);
            db.AddParameters("@TglKeberangkatan", SqlDbType.Date, TglKeberangkatan);
            db.AddParameters("@Jam", SqlDbType.VarChar, jam);
            db.AddParameters("@JumlahPenumpang", SqlDbType.Int, JumlahPenumpang);
            db.AddParameters("@LinkUrl", SqlDbType.VarChar, "");
            db.AddParameters("@StatusEmail", SqlDbType.Int, StatusEmail);
            db.AddParameters("@Mobil", SqlDbType.VarChar, Mobil);
            db.AddParameters("@Sopir", SqlDbType.VarChar, Sopir);




            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        

        public static void InsertPegawai(DataModel.Pegawai oPegawai)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
   
            db.SPName = "SP_InsertPegawai";
            db.AddParameters("@No_Pek", SqlDbType.VarChar, oPegawai.Nopek);
            db.AddParameters("@Nama", SqlDbType.VarChar, oPegawai.NamaPekerja);
            db.AddParameters("@Mess", SqlDbType.VarChar, oPegawai.Mess);
            db.AddParameters("@No_Hp", SqlDbType.VarChar, oPegawai.NoHp);
            db.AddParameters("@Email", SqlDbType.VarChar, oPegawai.Email);
            db.AddParameters("@Fungsi", SqlDbType.VarChar, oPegawai.Fungsi);
            db.AddParameters("@Position", SqlDbType.Int, oPegawai.Position);






            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void UpdateMess(string NoPek,DateTime TglKeberangkatan, DateTime TglPulang)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_UpdateMess";
            db.AddParameters("@Pegawai", SqlDbType.VarChar, NoPek);
            db.AddParameters("@Tgl_Start", SqlDbType.DateTime, TglKeberangkatan);
            db.AddParameters("@Tgl_End", SqlDbType.DateTime, TglPulang);
           

            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        


        public static void DeletePegawaiById(String Nopek)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeletePegawaiById";
            db.AddParameters("@NoPek", SqlDbType.VarChar, Nopek);
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }
        public static void DeletePenumpangByOrder(Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeletePenumpangByOrder";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        
        public static void DeleteMobilById(String Nopol)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteMobilById";
            db.AddParameters("@NoPol", SqlDbType.VarChar, Nopol);
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void DeleteDriverById(Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteDriverById";
            db.AddParameters("@Id_Driver", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }
        public static void DeletePesawatById(int Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeletePesawatById";
            db.AddParameters("@Id_Pesawat", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }


        public static void DeleteKelasById(int Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteKelasById";
            db.AddParameters("@Id_Kelas", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }
        public static void DeleteMess(Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteMess";
            db.AddParameters("@id", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }



        public static void DeleteMerkById(int Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteMerkById";
            db.AddParameters("@Id_Merk", SqlDbType.Int, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }


        public static void DeleteUserById(Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeleteUserById";
            db.AddParameters("@Id_User", SqlDbType.UniqueIdentifier, Id);
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        

        public static void InsertMobil(DataModel.Mobil oMobil)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertMobil";
            db.AddParameters("@No_Polisi", SqlDbType.VarChar, oMobil.NoPol);
            db.AddParameters("@Merk", SqlDbType.VarChar, oMobil.Merk);
            db.AddParameters("@Jenis", SqlDbType.Int, oMobil.JnsMbl);
            db.AddParameters("@Kelas_Mobil", SqlDbType.Int, oMobil.KlsMbl);
            db.AddParameters("@Id_Driver1", SqlDbType.UniqueIdentifier, oMobil.IdDriver1);
            db.AddParameters("@Id_Driver2", SqlDbType.UniqueIdentifier, oMobil.IdDriver2);
            db.AddParameters("@Kapasitas", SqlDbType.Int, oMobil.Kapasitas);

            db.AddParameters("@Id_Status", SqlDbType.Int, oMobil.IdStatus);





            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }


        public static void InsertDriver(DataModel.Driver oDriver)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertDriver";
            db.AddParameters("@Id_Driver", SqlDbType.UniqueIdentifier, Guid.NewGuid());
            db.AddParameters("@No_Sim", SqlDbType.VarChar, oDriver.NoSim);
            db.AddParameters("@Nama", SqlDbType.VarChar, oDriver.Nama);
            db.AddParameters("@No_Hp", SqlDbType.VarChar, oDriver.NoHp);
            db.AddParameters("@StatusDriver", SqlDbType.Bit, oDriver.StatusDriver);
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            
        }

        public static void InsertPesawat(int id ,string NamaPesawat)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertPesawat";
            db.AddParameters("@Id", SqlDbType.Int, id);
            db.AddParameters("@Nama_Pesawat", SqlDbType.VarChar, NamaPesawat);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }


        public static void InsertKelas(int id, string NamaKelas)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertKelas";
            db.AddParameters("@Id", SqlDbType.Int, id);
            db.AddParameters("@Nama_Kelas", SqlDbType.VarChar, NamaKelas);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }

        public static void InsertMess(Guid id, string Nama,string Nopek ,int Status)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();
         

            db.SPName = "SP_InsertMess";

            if (id == Guid.Empty)
                db.AddParameters("@id", SqlDbType.UniqueIdentifier, Guid.NewGuid());
            else
                db.AddParameters("@id", SqlDbType.UniqueIdentifier, id);

            db.AddParameters("@Nama_mess", SqlDbType.VarChar, Nama);
            db.AddParameters("@Pegawai", SqlDbType.VarChar, Nopek);
            db.AddParameters("@Status", SqlDbType.Int, Status);

            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }


        public static void InsertMerk(int id, string NamaMerk)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertMerk";
            db.AddParameters("@Id", SqlDbType.Int, id);
            db.AddParameters("@Nama_Merk", SqlDbType.VarChar, NamaMerk);
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }

        





        public static void InsertApproval(DataModel.Approval oPegawai)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertApproval";
            db.AddParameters("@No_Pek", SqlDbType.VarChar, oPegawai.Nopek);
            db.AddParameters("@Nama", SqlDbType.VarChar, oPegawai.NamaPekerja);
            db.AddParameters("@No_Hp", SqlDbType.VarChar, oPegawai.NoHp);
            db.AddParameters("@Email", SqlDbType.VarChar, oPegawai.Email);
          



            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void DeletePegawaiApprovalById(String Nopek)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_DeletePegawaiApprovalById";
            db.AddParameters("@NoPek", SqlDbType.VarChar, Nopek);
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void InsertUser(DataModel.User User)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_InsertUser";
            if (User.Id_User == "")
                db.AddParameters("@Id_User", SqlDbType.UniqueIdentifier, Guid.NewGuid());
            else
                db.AddParameters("@Id_User", SqlDbType.UniqueIdentifier, Guid.Parse(User.Id_User));


            db.AddParameters("@User_Name", SqlDbType.VarChar,User.User_Name);
            db.AddParameters("@NoPek", SqlDbType.VarChar, User.No_Pegawai);
            db.AddParameters("@Password", SqlDbType.VarChar, User.Password);
            db.AddParameters("@Nama", SqlDbType.VarChar, User.Nama);
            db.AddParameters("@Type", SqlDbType.Int, User.Type);





            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void UpdateApproval(Guid Id,int Status,string NoPek)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_UpdateOrder";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
            db.AddParameters("@Status", SqlDbType.Int, Status);
            db.AddParameters("@UpdateBy", SqlDbType.VarChar, NoPek);
            db.AddParameters("@UpdateDate", SqlDbType.DateTime, DateTime.Now);

            DataSet ds = db.ExecuteSP();
            db.Dispose();
            
        }


        public static void UpdatePjs(string  Approve, string NewApprove)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_UpdatePjs";
            db.AddParameters("@Approve", SqlDbType.VarChar, Approve);
            db.AddParameters("@NewApprove", SqlDbType.Int, NewApprove);
          
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }

        public static void InsertHistoryPjs(string Approve, string NewApprove,DateTime TglPergantian,int fungsi)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "spInsertHistoryPjs";
            db.AddParameters("@LastApproval", SqlDbType.VarChar, Approve);
            db.AddParameters("@NewApproval", SqlDbType.VarChar, NewApprove);
            db.AddParameters("@Tgl_Pergantian", SqlDbType.DateTime, TglPergantian);
            db.AddParameters("@Fungsi", SqlDbType.Int, fungsi);




            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }

        
        public static void UpdateDataMobil(DataModel.Detail Penumpang,Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "UpdateDataMobil";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
            db.AddParameters("@Mobil", SqlDbType.VarChar, Penumpang.Mobil);
            db.AddParameters("@No_Pek", SqlDbType.VarChar, Penumpang.NoPek);
          
            DataSet ds = db.ExecuteSP();
            db.Dispose();

        }

        


        public static void UpdateOrderByAdmin(Guid Id,int Status, string NoPek)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_UpdateOrderByAdmin";
            db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
            db.AddParameters("@Status", SqlDbType.Int, Status);
            db.AddParameters("@UpdateBy", SqlDbType.VarChar, NoPek);
            db.AddParameters("@UpdateDate", SqlDbType.DateTime, DateTime.Now);

            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }

        public static void updateEmailStatus(Guid Id)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "SP_UpdateEmailStatus";
            db.AddParameters("@idEmail", SqlDbType.UniqueIdentifier, Id);
           
            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }
        



    }
}
