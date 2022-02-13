using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Transforman.controller
{
    public class DataModel
    {
        public class OrderData

        {
            public Guid Id_Order { get; set; }
            public int Type_Order { get ; set ;}
            public string Nama_Order { get; set; }
            public DateTime Tgl_Penjemputan { get; set; }
            public string Jam_Penjemputan { get; set; }
            //public int Jumlah_Penumpang { get; set; }
            public string No_polisi { get; set; }
            public string Id_Driver { get; set; }
            public string Status { get; set; }
            public string CreatedBy { get; set; }
            public DateTime CreatedDate { get; set; }
            public string UpdateBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public virtual ICollection<Penumpang> PenumpangDetail { get; set; }
        

        }

        public class Penumpang
        {
            //\":\"Pekerja\",\"\":\"tett\",\"Nama\":\"\",\"Pesawat\":\"lion\",\"FlighCode\":\"8787888\",\"tglKeberangkatan\":\"25 Dec 2017\",\"tglPulang\":\"26 Dec 2017\",\"JamFlight\":\"00:00\",\"Ket\":\"hewuehjwhejwhjew\",\"NoSIJ\":\"dsdskjdk\"}]}"
            public Guid IdPenumpang { get; set; }
            public Guid IdOrder { get; set; }
            public int JenisPenumpang { get; set; }
            public string NoPek { get; set; }
            public string Nama { get; set; }

            public string Pesawat { get; set; }
            public string FlighCode { get; set; }
            public string JamFligh { get; set; }
            public DateTime tglKeberangkatan { get; set; }
            public DateTime tglPulang { get; set; }
            public string Ket { get; set; }
            public string NoSIJ { get; set; }
            public string Mobil { get; set; }



        }
        public class Pegawai
        {
            public string Nopek { get; set; }
            public string NamaPekerja { get; set; }
            public string Mess { get; set; }
            public string NoHp { get; set; }
            public string Email { get; set; }
            public string Fungsi { get; set; }
            public string Approval { get; set; }
            public int Position { get; set; }



        }

        public class Approval
        {
            public string Nopek { get; set; }
            public string NamaPekerja { get; set; }
            public string NoHp { get; set; }
            public string Email { get; set; }
         

        }

        public class Mobil
        {
            public string NoPol { get; set; }
            public string Merk { get; set; }
            public string JnsMbl { get; set; }
            public string KlsMbl { get; set; }
            public Guid IdDriver1 { get; set; }
            public Guid IdDriver2 { get; set; }
            public int Kapasitas { get; set; }
            public string IdStatus { get; set; }
      

        }

        public class Driver
        {
            public string IdDrivr { get; set; }
            public string NoSim { get; set; }
            public string Nama { get; set; }
            public string NoHp { get; set; }
            public int StatusDriver { get; set; }


        }
        public class User
        {
            public string Id_User { get; set; }
            public string User_Name { get; set; }
            public string No_Pegawai { get; set; }

            public string Password { get; set; }
             public string Nama { get; set; }
            public int Type { get; set; }


        }

        public class AdminOrder

        {
            public Guid id { get; set; }
            public  string Admin { get; set; }
            public string Type { get; set; }

            public virtual ICollection<Detail> Detail { get; set; }

        }


        public class Detail
        {
           
            public string NoPek { get; set; }
            public string Nama { get; set; }
            public string Mobil { get; set; }



        }

    }
}
