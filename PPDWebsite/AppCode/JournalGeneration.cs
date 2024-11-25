//using iTextSharp.text;
//using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using iTextSharp.tool.xml;
using PdfSharp;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using PdfSharp.Pdf.IO;
using TheArtOfDev.HtmlRenderer.Core;
using TheArtOfDev.HtmlRenderer.Core.Entities;
using TheArtOfDev.HtmlRenderer.PdfSharp;

namespace PPDWebsite.AppCode
{
  public class JournalGeneration
  {
    string sqlConnectionString = "Data Source=.;Initial Catalog=PregnancyPrayer;Integrated Security=true;";
    string userID = "7";

    public void GenerateResultPDF(int userID)
    {
      string HTMLText = GetHTMLString();
      pdfSharpConvert();
      //return ConvertHtmlToPdfAsBytes(HTMLText);
    }

    public string GetHTMLString()
    {
      string htmlText = "";
      

      var FilePath = System.Web.HttpContext.Current.Server.MapPath("App_Data/PDF.html");

      htmlText = File.ReadAllText(FilePath);

      return htmlText;
    }
    /*
    public static ReturnValue ConvertHtmlToPdfAsBytes(string HtmlData)
    {
      // variables  
      ReturnValue Result = new ReturnValue();

      // do some additional cleansing to handle some scenarios that are out of control with the html data  
      //HtmlData = HtmlData.ReplaceValue("<br>", "<br />");

      // convert html to pdf  
      try
      {
        // create a stream that we can write to, in this case a MemoryStream  
        using (var stream = new MemoryStream())
        {
          // create an iTextSharp Document which is an abstraction of a PDF but **NOT** a PDF  
          using (var document = new Document())
          {
            // create a writer that's bound to our PDF abstraction and our stream  
            using (var writer = PdfWriter.GetInstance(document, stream))
            {
              // open the document for writing  
              document.Open();

              // read html data to StringReader  
              using (var html = new StringReader(HtmlData))
              {
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, document, html);
              }

              // close document  
              document.Close();
            }
          }

          // get bytes from stream  
          Result.Data = stream.ToArray();

          // success  
          Result.Success = true;
          
        }
      }
      catch (Exception ex)
      {
        Result.Success = false;
        Result.Message = ex.Message;
      }

      // return  
      return Result;
    }

    public class ReturnValue
    {
      // constructor  
      public ReturnValue()
      {
        this.Success = false;
        this.Message = string.Empty;
      }

      // properties  
      public bool Success = false;
      public string Message = string.Empty;
      public Byte[] Data = null;
    }

    public static ReturnValue ConvertHtmlToPdfAsFile(string FilePath, string HtmlData)
    {
      // variables  
      ReturnValue Result = new ReturnValue();

      try
      {
        // convert html to pdf and get bytes array  
        Result = ConvertHtmlToPdfAsBytes(HtmlData: HtmlData);

        // check for errors  
        if (!Result.Success)
        {
          return Result;
        }

        // create file  
        File.WriteAllBytes(path: FilePath, bytes: Result.Data);

        // result  
        Result.Success = true;
      }
      catch (Exception ex)
      {
        Result.Success = false;
        Result.Message = ex.Message;
      }

      // return  
      return Result;
    }

  */
    public void pdfSharpConvert()
    {
      string html = GetHTMLString();
      var cssData = PdfGenerator.ParseStyleSheet(GetStyleSheet());

      //PdfDocument pdf = PdfGenerator.GeneratePdf(html, PageSize.Letter);
      var pdf = PdfGenerator.GeneratePdf(html, PageSize.A4, 20, cssData, OnStylesheetLoad, OnImageLoadPdfSharp);
      
      pdf.Save(@"C:\PPDA\document.pdf");
    }
    
    private void OnStylesheetLoad(object sender, HtmlStylesheetLoadEventArgs e)
    {
      
    }

    public static void OnImageLoadPdfSharp(object sender, HtmlImageLoadEventArgs e)
    {
      var url = e.Src;
      if (!e.Src.StartsWith("http://") && !e.Src.StartsWith("https://"))
      {
        var ImgFilePath = System.Web.HttpContext.Current.Server.MapPath(url);
        if (XImage.ExistsFile(ImgFilePath))
          e.Callback(XImage.FromFile(ImgFilePath));
        var ImgFilePath2 = System.Web.HttpContext.Current.Server.MapPath(url);
        if (XImage.ExistsFile(ImgFilePath2))
          e.Callback(XImage.FromFile(ImgFilePath2));
      }
      else
      {
        using (var client = new WebClient())
        {
          using (var stream = new MemoryStream(client.DownloadData(url)))
          {
            //e.Callback(XImage.FromStream(stream));
          }
        }
      }
    }

    private string GetStyleSheet()
    {
      string css = "";
      var ImgFilePath = System.Web.HttpContext.Current.Server.MapPath("css/bootstrap.txt");

      css = File.ReadAllText(ImgFilePath);

      return css;
    }


    //##########################################################################################
    private static void addPagesToPdf(ref PdfDocument mainDoc, PdfDocument sourceDoc)
    {

      MemoryStream tempMemoryStream = new MemoryStream();
      sourceDoc.Save(tempMemoryStream, false);

      PdfDocument openedDoc = PdfReader.Open(tempMemoryStream, PdfDocumentOpenMode.Import);
      foreach (PdfPage page in openedDoc.Pages)
      {

        mainDoc.AddPage(page);

      }
    }
    private PdfDocument getPdfDocFrom(string htmlString)
    {
      
      var cssData = PdfGenerator.ParseStyleSheet(GetStyleSheet());

      //PdfDocument pdf = PdfGenerator.GeneratePdf(html, PageSize.Letter);
      
      
      PdfGenerateConfig config = new PdfGenerateConfig();
      config.PageOrientation = PdfSharp.PageOrientation.Portrait;
      config.PageSize = PdfSharp.PageSize.A4;
/*
      PdfDocument doc = PdfGenerator.GeneratePdf(htmlString, config);
      */
      var pdf = PdfGenerator.GeneratePdf(htmlString, config, cssData, OnStylesheetLoad, OnImageLoadPdfSharp);

      //pdf.Save(@"C:\PPDA\document.pdf");


      return pdf;
    }

    public void GenerateJournal()
    {
      PdfDocument doc = new PdfDocument();


      string usersTableHTML = string.Empty;
      SqlConnection conn = new SqlConnection(sqlConnectionString);

      try
      {
        conn.Open();
      }
      catch (Exception ex)
      {
      }

      string commandString = "SELECT * FROM [tblJournals] WHERE userID = " + userID + " ORDER BY id DESC";
      SqlCommand command = new SqlCommand(commandString, conn);

      SqlDataReader dataReader = command.ExecuteReader();
      
      int x = 0;
      string bookline;

      while (dataReader.Read())
      {
        //bookline = htmlText.Replace("SUMMARY", dataReader["topic"].ToString() + "...").Replace("JID", dataReader["id"].ToString()).Replace("JDATE", DateTime.Parse(dataReader["date"].ToString()).ToShortDateString() + " (Day " + dataReader["pregnancyDay"].ToString() + ")");
        string day, topic, body, date, attachment, prayer, devotional;
        day = dataReader["pregnancyDay"].ToString();
        topic = dataReader["topic"].ToString();
        body = dataReader["notes"].ToString();
        date = dataReader["date"].ToString();
        attachment = dataReader["firebaseDownloadUrl"].ToString();
        prayer = GetPrayer(dataReader["prayer"].ToString());
				devotional = GetDevotional(dataReader["prayer"].ToString());

        string htmlString = GetHTMLString();

        htmlString = htmlString.Replace("[DAYNO]", day);
        htmlString = htmlString.Replace("[JOURNALPHOTO]", attachment);
        htmlString = htmlString.Replace("[JOURNALHEADING]", topic);
        htmlString = htmlString.Replace("[JOURNALBODY]", body);
        htmlString = htmlString.Replace("[PRAYER]", prayer);
				htmlString = htmlString.Replace("[DEVOTIONAL]", devotional);

				PdfDocument tempDoc = getPdfDocFrom(htmlString);



        addPagesToPdf(ref doc, tempDoc);

        ++x;
      }

      conn.Close();

      doc.Save(@"C:\PPDA\document2.pdf");
    }

		private string GetPrayer(string prayerID)
		{

			SqlConnection conn = new SqlConnection(sqlConnectionString);
			string prayer = "";
			try
			{
				conn.Open();
			}
			catch (Exception ex)
			{
				//return ex.ToString();
				//show error
			}

			string commString = "SELECT * FROM [tblMainContent] WHERE day = " + prayerID;

			SqlCommand command = new SqlCommand(commString, conn);

			SqlDataReader rdr = command.ExecuteReader();

			if (rdr.HasRows)
			{
				while (rdr.Read())
				{

					prayer = rdr["prayer"].ToString();
					
				}
			}
			else
			{
				Console.Write("no data found");
			}

			return prayer;
		}


		private string GetDevotional(string prayerID)
		{

			SqlConnection conn = new SqlConnection(sqlConnectionString);
			string prayer = "";
			try
			{
				conn.Open();
			}
			catch (Exception ex)
			{
				//return ex.ToString();
				//show error
			}

			string commString = "SELECT * FROM [tblDevotional] WHERE Day = " + prayerID;

			SqlCommand command = new SqlCommand(commString, conn);

			SqlDataReader rdr = command.ExecuteReader();

			if (rdr.HasRows)
			{
				while (rdr.Read())
				{

					prayer = "<b>" + rdr["Scripture"].ToString() + "</b><br/>" + rdr["Scripture"].ToString();

				}
			}
			else
			{
				Console.Write("no data found");
			}

			return prayer;
		}

	}



}