using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace KutuphaneOtomasyonu
{

    public partial class AdminPaneli : System.Web.UI.Page
    {
        string connectionString = "server=localhost;user id=root;database=kutuphanesistemi;Password=00000000";
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill(kitapGridView, "TumKitaplariListele");
            GridFill(uyeGridView, "TumUyeleriListele");
        }

        protected void kitapEkleBTN_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("KitapEkleGuncelle", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_kitap_id", 0);
                    sqlCmd.Parameters.AddWithValue("_kitap_ad", kitapAdiText.Text);
                    sqlCmd.Parameters.AddWithValue("_kitap_basimyili", basimYiliText.Text);
                    sqlCmd.Parameters.AddWithValue("_kitap_yayinevi", yayinEviText.Text);
                    sqlCmd.ExecuteNonQuery();

                    KitapClear();
                    GridFill(kitapGridView, "TumKitaplariListele");
                    kitapBilgiLabel.Text = "Kitap eklendi.";
                }
            }
            catch(Exception ex)
            {
                kitapBilgiLabel.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("KitapEkleGuncelle", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_kitap_id", int.Parse(txtKitapId.Text));
                    sqlCmd.Parameters.AddWithValue("_kitap_ad", kitapAdiText.Text);
                    sqlCmd.Parameters.AddWithValue("_kitap_basimyili", basimYiliText.Text);
                    sqlCmd.Parameters.AddWithValue("_kitap_yayinevi", yayinEviText.Text);
                    sqlCmd.ExecuteNonQuery();

                    KitapClear();
                    GridFill(kitapGridView, "TumKitaplariListele");
                    kitapBilgiLabel.Text = "Kitap güncellendi.";
                }
            }
            catch (Exception ex)
            {
                kitapBilgiLabel.Text = ex.Message;
            }
        }

        private void GridFill(GridView gridView,string procedure)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter(procedure, sqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                gridView.DataSource = dt;
                gridView.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("IDileKitapSil", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_kitap_id", int.Parse(txtKitapId.Text));
                sqlCmd.ExecuteNonQuery();

                KitapClear();
                GridFill(kitapGridView, "TumKitaplariListele");
                kitapBilgiLabel.Text = "Kitap silindi.";
            }
        }

        private void KitapClear()
        {
            kitapAdiText.Text = null;
            basimYiliText.Text = null;
            yayinEviText.Text = null;
            txtKitapId.Text = "id";
        }

        private void UyeClear()
        {
            uyeAdiText.Text = null;
            txtUyeId.Text = "id";
            TextBox1.Text = null;
        }

        protected void uyeEkleBTN_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UyeEkleGuncelle", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_uye_id", 0);
                    sqlCmd.Parameters.AddWithValue("_uye_adsoyad", uyeAdiText.Text);
                    sqlCmd.ExecuteNonQuery();

                    UyeClear();
                    GridFill(uyeGridView, "TumUyeleriListele");
                    uyeBilgiLabel.Text = "Üye eklendi.";
                }
            }
            catch (Exception ex)
            {
                uyeBilgiLabel.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UyeEkleGuncelle", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_uye_id", int.Parse(txtUyeId.Text));
                    sqlCmd.Parameters.AddWithValue("_uye_adsoyad", uyeAdiText.Text);
                    sqlCmd.ExecuteNonQuery();

                    UyeClear();
                    GridFill(uyeGridView, "TumUyeleriListele");
                    uyeBilgiLabel.Text = "Üye güncellendi.";
                }
            }
            catch (Exception ex)
            {
                uyeBilgiLabel.Text = ex.Message;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("IDileUyeSil", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_uye_id", int.Parse(txtUyeId.Text));
                sqlCmd.ExecuteNonQuery();

                UyeClear();
                GridFill(uyeGridView, "TumUyeleriListele");
                uyeBilgiLabel.Text = "Üye silindi.";
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("UyeyeKitapVer", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_uye_id", int.Parse(txtUyeId.Text));
                sqlCmd.Parameters.AddWithValue("_kitap_id", int.Parse(TextBox1.Text));
                sqlCmd.Parameters.AddWithValue("_date", DateTime.Now.ToString("dddd, dd MMMM yyyy"));
                sqlCmd.ExecuteNonQuery();

                UyeClear();
                GridFill(uyeGridView, "TumUyeleriListele");
                uyeBilgiLabel.Text = "Üyeye kitap verildi.";
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("UyedenKitapAl", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("_uye_id", int.Parse(txtUyeId.Text));
                sqlCmd.ExecuteNonQuery();

                UyeClear();
                GridFill(uyeGridView, "TumUyeleriListele");
                uyeBilgiLabel.Text = "Üyeden kitap alındı.";
            }
        }
    }
}