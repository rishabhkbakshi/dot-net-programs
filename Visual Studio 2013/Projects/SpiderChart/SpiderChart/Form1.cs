using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using System.Reflection;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Collections;

namespace SpiderChart
{
    public partial class Form1 : Form
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        int loopStart = Int32.Parse(ConfigurationManager.AppSettings["loopStart"]);
        int loopEnd = Int32.Parse(ConfigurationManager.AppSettings["loopEnd"]);
        int Assessment = Int32.Parse(ConfigurationManager.AppSettings["Assessment"]);
        int fontSize = Int32.Parse(ConfigurationManager.AppSettings["fontSize"]);
        Excel.Application xla13R = new Excel.Application();
        //Excel.Application xla22R = new Excel.Application();
        Excel.Application xla10 = new Excel.Application();

        private object missing = Missing.Value;
        public Form1()
        {
            InitializeComponent();
        }

        private void btn_Excel_Click(object sender, EventArgs e)
        {
            for (int Chrt = loopStart; Chrt <= loopEnd; Chrt++)
            {
                /*********First Proc************/

                MySqlCommand cmd13R = new MySqlCommand("call Spider_13R(@var1,@var2)", con);
                cmd13R.CommandType = CommandType.Text;
                cmd13R.Parameters.AddWithValue("@var1", Chrt);
                cmd13R.Parameters.AddWithValue("@var2", Assessment);
                MySqlDataAdapter da13R = new MySqlDataAdapter(cmd13R);
                DataTable dt13R = new DataTable();
                da13R.Fill(dt13R);
                if (dt13R != null)
                {
                    if (dt13R.Rows.Count >= 1)
                    {
                        xla13R.Visible = true;
                        Excel.Workbook wb13R = xla13R.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
                        Excel.Worksheet ws13R = (Excel.Worksheet)wb13R.Worksheets.get_Item(1);
                        for (int clms = 1; clms < dt13R.Columns.Count + 1; clms++)
                        {
                            ws13R.Cells[1, clms] = dt13R.Columns[clms - 1].ToString().ToUpper() + "\t";
                            string myHeader = dt13R.Columns[clms - 1].ToString().ToUpper();
                        }
                        for (int i = 0; i <= dt13R.Rows.Count - 1; i++)
                        {
                            for (int j = 0; j <= dt13R.Columns.Count - 1; j++)
                            {
                                string data = dt13R.Rows[i].ItemArray[j].ToString();
                                //string strdata = data.Contains(" ") ? data.Replace(" ", "\n") : data;
                                ws13R.Cells[i + 2, j + 1] = data;
                            }
                        }
                        ws13R.Columns.AutoFit();
                        if (!Directory.Exists("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")"))
                        {
                            Directory.CreateDirectory("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")");
                            wb13R.SaveAs("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")" + "\\csharp.net-informations1" + Chrt + ".csv", Excel.XlFileFormat.xlWorkbookNormal, missing, missing, missing, missing, Excel.XlSaveAsAccessMode.xlExclusive, missing, missing, missing, missing, missing);
                        }
                        else
                        {
                            wb13R.SaveAs("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")" + "\\csharp.net-informations1" + Chrt + ".csv", Excel.XlFileFormat.xlWorkbookNormal, missing, missing, missing, missing, Excel.XlSaveAsAccessMode.xlExclusive, missing, missing, missing, missing, missing);
                        }
                        wb13R.Close(true, missing, missing);
                        xla13R.Quit();
                    }
                }
                xla13R.Visible = true;
                string filePath13R = "C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")";
                string fileName13R = filePath13R + "\\csharp.net-informations1" + Chrt + ".csv";
                xla13R.Workbooks.OpenText(fileName13R, missing, 1, missing, Excel.XlTextQualifier.xlTextQualifierNone, missing, missing, missing, true, missing, missing, missing, missing, missing, missing, missing, missing, missing);
                Excel.Worksheet ws13R2 = (Excel.Worksheet)xla13R.ActiveSheet;
                Excel.ChartObjects chartObjs13R = (Excel.ChartObjects)ws13R2.ChartObjects(Type.Missing);
                Excel.ChartObject chartObj13R = chartObjs13R.Add(150, 150, 380, 350);
                Excel.Chart xlChart13R = chartObj13R.Chart;
                //Excel.Range rg13R = ws13R2.get_Range("A1", "B7");

                Excel.SeriesCollection seriesCollection13R = chartObj13R.Chart.SeriesCollection();
                Excel.Series series13R = seriesCollection13R.NewSeries();
                Excel.Range xValues13R = ws13R2.Range["A2", "A7"];
                Excel.Range values13R = ws13R2.Range["B2", "B7"];
                series13R.XValues = xValues13R;
                series13R.Values = values13R;
                series13R.Name = "Benchmark";
                //series13R.Format.Line.ForeColor.RGB = (int)Excel.XlRgbColor.rgbOrangeRed;
                series13R.Border.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.FromArgb(193, 79, 78));

                Excel.SeriesCollection seriesCollection13R2 = chartObj13R.Chart.SeriesCollection();
                Excel.Series series13R2 = seriesCollection13R2.NewSeries();
                Excel.Range xValues13R2 = ws13R2.Range["A2", "A7"];
                Excel.Range values13R2 = ws13R2.Range["C2", "C7"];
                series13R2.XValues = xValues13R2;
                series13R2.Values = values13R2;
                series13R2.Name = "Score";
                //series13R2.Format.Line.ForeColor.RGB = (int)Excel.XlRgbColor.rgbBlue;
                series13R2.Border.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.FromArgb(79, 129, 190));

                //Formatting of Chart:
                // xlChart13R.SetSourceData(values, Excel.XlRowCol.xlColumns);
                xlChart13R.ChartType = Excel.XlChartType.xlRadar;
                xlChart13R.PlotArea.Interior.ColorIndex = 2;
                xlChart13R.PlotArea.Border.ColorIndex = 2;

                //Customize X axes:
                Excel.Axis xAxis13R = (Excel.Axis)xlChart13R.Axes(Excel.XlAxisType.xlCategory, Excel.XlAxisGroup.xlPrimary);
                xAxis13R.HasMajorGridlines = true;

                //Customize Y axes:
                Excel.Axis yAxis13R = (Excel.Axis)xlChart13R.Axes(Excel.XlAxisType.xlValue, Excel.XlAxisGroup.xlPrimary);
                yAxis13R.HasMajorGridlines = true;
                yAxis13R.MaximumScaleIsAuto = false;
                yAxis13R.MaximumScale = 10;
                yAxis13R.MinimumScaleIsAuto = false;
                yAxis13R.MinimumScale = 0;
                yAxis13R.CrossesAt = -1.5;

                //Add title:
                xlChart13R.HasTitle = true;
                xlChart13R.ChartTitle.Text = "  ";
                xlChart13R.SizeWithWindow = true;

                //Font Size
                xlChart13R.ChartArea.Font.Size = fontSize;

                //Add & position of legend:
                xlChart13R.HasLegend = true;

                xlChart13R.Legend.Position = Excel.XlLegendPosition.xlLegendPositionBottom;
                xlChart13R.Export("E:\\New folder " + "(" + Chrt + ")" + "\\Spider1" + Chrt + ".jpg", "jpg", missing);
                xla13R.DisplayAlerts = false;
                xla13R.Quit();


                /*********Third Proc*************/

                //MySqlCommand cmd22R = new MySqlCommand("Spider_22RNew", con);
                //cmd22R.CommandType = CommandType.StoredProcedure;
                //cmd22R.Parameters.AddWithValue("@var1", Chrt);
                //cmd22R.Parameters.AddWithValue("@var2", Assessment);
                //MySqlDataAdapter da22R = new MySqlDataAdapter(cmd22R);
                //DataTable dt22R = new DataTable();
                //da22R.Fill(dt22R);
                //if (dt22R != null)
                //{
                //    if (dt22R.Rows.Count >= 1)
                //    {
                //        xla22R.Visible = true;
                //        Excel.Workbook wb22R = xla22R.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
                //        Excel.Worksheet ws22R = (Excel.Worksheet)wb22R.Worksheets.get_Item(1);
                //        for (int clms = 1; clms < dt22R.Columns.Count + 1; clms++)
                //        {
                //            ws22R.Cells[1, clms] = dt22R.Columns[clms - 1].ToString().ToUpper() + "\t";
                //            string myHeader = dt22R.Columns[clms - 1].ToString().ToUpper();
                //        }
                //        for (int i = 0; i <= dt22R.Rows.Count - 1; i++)
                //        {
                //            for (int j = 0; j <= dt22R.Columns.Count - 1; j++)
                //            {
                //                string data = dt22R.Rows[i].ItemArray[j].ToString();
                //                ws22R.Cells[i + 2, j + 1] = data;
                //            }
                //        }
                //        ws22R.Columns.AutoFit();
                //        wb22R.SaveAs("C:\\Users\\Rishdik\\Documents\\New folder " + "(" + Chrt + ")" + "\\csharp.net-informations3" + Chrt + ".csv", Excel.XlFileFormat.xlWorkbookNormal, missing, missing, missing, missing, Excel.XlSaveAsAccessMode.xlExclusive, missing, missing, missing, missing, missing);

                //        wb22R.Close(true, missing, missing);
                //        xla22R.Quit();
                //        xla22R.Visible = true;
                //        string filePath22R = "C:\\Users\\Rishdik\\Documents\\New folder " + "(" + Chrt + ")";
                //        string fileName22R = filePath22R + "\\csharp.net-informations3" + Chrt + ".csv";
                //        xla22R.Workbooks.OpenText(fileName22R, missing, 1, missing, Excel.XlTextQualifier.xlTextQualifierNone, missing, missing, missing, true, missing, missing, missing, missing, missing, missing, missing, missing, missing);
                //        Excel.Worksheet ws22R2 = (Excel.Worksheet)xla22R.ActiveSheet;
                //        Excel.ChartObjects chartObjs22R = (Excel.ChartObjects)ws22R2.ChartObjects(Type.Missing);
                //        Excel.ChartObject chartObj22R = chartObjs22R.Add(150, 150, 450, 350);
                //        Excel.Chart xlChart22R = chartObj22R.Chart;

                //        //Excel.Range rg22R = ws22R2.get_Range("A1", "B12");

                //        Excel.Range xValues22R = ws22R2.Range["A2", "A12"];
                //        Excel.Range values22R = ws22R2.Range["B2", "B12"];

                //        xlChart22R.ChartType = Excel.XlChartType.xlRadar;
                //        Excel.SeriesCollection seriesCollection = chartObj22R.Chart.SeriesCollection();

                //        Excel.Series series22R = seriesCollection.NewSeries();
                //        series22R.XValues = xValues22R;
                //        series22R.Values = values22R;
                //        series22R.Name = "Benchmark";
                //        series22R.Format.Line.ForeColor.RGB = (int)Excel.XlRgbColor.rgbOrangeRed;
                //        series22R.Border.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.FromArgb(193, 79, 78));
                //        //Formatting of Chart:
                //        // xlChart22R.SetSourceData(rg22R, Excel.XlRowCol.xlColumns);

                //        xlChart22R.ChartType = Excel.XlChartType.xlRadarMarkers;
                //        xlChart22R.PlotArea.Interior.ColorIndex = 2;
                //        xlChart22R.PlotArea.Border.ColorIndex = 2;

                //        //Customize X axes:
                //        Excel.Axis xAxis22R = (Excel.Axis)xlChart22R.Axes(Excel.XlAxisType.xlCategory, Excel.XlAxisGroup.xlPrimary);
                //        xAxis22R.HasMajorGridlines = true;

                //        //Customize Y axes:
                //        Excel.Axis yAxis22R = (Excel.Axis)xlChart22R.Axes(Excel.XlAxisType.xlValue, Excel.XlAxisGroup.xlPrimary);
                //        yAxis22R.HasMajorGridlines = true;
                //        yAxis22R.MaximumScaleIsAuto = false;
                //        yAxis22R.MaximumScale = 10;
                //        yAxis22R.MinimumScaleIsAuto = false;
                //        yAxis22R.MinimumScale = 0;
                //        yAxis22R.CrossesAt = -1.5;

                //        //Add title:
                //        xlChart22R.HasTitle = true;
                //        xlChart22R.ChartTitle.Text = "Skills";
                //        xlChart22R.SizeWithWindow = true;

                //        //Font Size:
                //        xlChart22R.ChartArea.Font.Size = fontSize;

                //        //Add & Positon of legend:
                //        xlChart22R.HasLegend = true;
                //        xlChart22R.Legend.Position = Excel.XlLegendPosition.xlLegendPositionBottom;
                //        xlChart22R.Export("E:\\New folder " + "(" + Chrt + ")" + "\\Spider3" + Chrt + ".jpg", "jpg", missing);
                //        xla22R.DisplayAlerts = false;
                //        xla22R.Quit();
                //    }
                //}


                /*********Seventh Proc************/

                MySqlCommand cmd10 = new MySqlCommand("call Spider_10New(@var1,@var2)", con);
                cmd10.CommandType = CommandType.Text;
                cmd10.Parameters.AddWithValue("@var1", Chrt);
                cmd10.Parameters.AddWithValue("@var2", Assessment);
                MySqlDataAdapter da10 = new MySqlDataAdapter(cmd10);
                DataTable dt10 = new DataTable();
                da10.Fill(dt10);
                if (dt10 != null)
                {
                    if (dt10.Rows.Count >= 1)
                    {
                        xla10.Visible = true;
                        Excel.Workbook wb10 = xla10.Workbooks.Add(Excel.XlWBATemplate.xlWBATWorksheet);
                        Excel.Worksheet ws10 = (Excel.Worksheet)wb10.Worksheets.get_Item(1);
                        for (int clms = 1; clms < dt10.Columns.Count + 1; clms++)
                        {
                            ws10.Cells[1, clms] = dt10.Columns[clms - 1].ToString().ToUpper() + "\t";
                            string myHeader = dt10.Columns[clms - 1].ToString().ToUpper();
                        }
                        for (int i = 0; i <= dt10.Rows.Count - 1; i++)
                        {
                            for (int j = 0; j <= dt10.Columns.Count - 1; j++)
                            {
                                string data = dt10.Rows[i].ItemArray[j].ToString();
                                //string strdata = data.Contains(" ") ? data.Replace(" ", "\n") : data;
                                ws10.Cells[i + 2, j + 1] = data;
                            }
                        }
                        ws10.Columns.AutoFit();
                        if (!Directory.Exists("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")"))
                        {
                            Directory.CreateDirectory("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")");
                            wb10.SaveAs("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")" + "\\csharp.net-informations7" + Chrt + ".csv", Excel.XlFileFormat.xlWorkbookNormal, missing, missing, missing, missing, Excel.XlSaveAsAccessMode.xlExclusive, missing, missing, missing, missing, missing);
                        }
                        else
                        {
                            wb10.SaveAs("C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")" + "\\csharp.net-informations7" + Chrt + ".csv", Excel.XlFileFormat.xlWorkbookNormal, missing, missing, missing, missing, Excel.XlSaveAsAccessMode.xlExclusive, missing, missing, missing, missing, missing);
                        }
                        wb10.Close(true, missing, missing);
                        xla10.Quit();
                    }
                }
                xla10.Visible = true;
                string filePath10 = "C:\\Users\\rishabh\\Documents\\New folder " + "(" + Chrt + ")";
                string fileName10 = filePath10 + "\\csharp.net-informations7" + Chrt + ".csv";
                xla10.Workbooks.OpenText(fileName10, missing, 1, missing, Excel.XlTextQualifier.xlTextQualifierNone, missing, missing, missing, true, missing, missing, missing, missing, missing, missing, missing, missing, missing);
                Excel.Worksheet ws102 = (Excel.Worksheet)xla10.ActiveSheet;
                Excel.ChartObjects chartObjs10 = (Excel.ChartObjects)ws102.ChartObjects(Type.Missing);
                Excel.ChartObject chartObj10 = chartObjs10.Add(150, 150, 380, 330);
                Excel.Chart xlChart10 = chartObj10.Chart;
                //Excel.Range rg10 = ws102.get_Range("A1", "B7");

                Excel.SeriesCollection seriesCollection10 = chartObj10.Chart.SeriesCollection();
                Excel.Series series10 = seriesCollection10.NewSeries();
                Excel.Range xValues10 = ws102.Range["A2", "A7"];
                Excel.Range values10 = ws102.Range["B2", "B7"];
                series10.XValues = xValues10;
                series10.Values = values10;
                series10.Name = "Benchmark";
                //series13R.Format.Line.ForeColor.RGB = (int)Excel.XlRgbColor.rgbOrangeRed;
                series10.Border.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.FromArgb(193, 79, 78));

                Excel.SeriesCollection seriesCollection102 = chartObj10.Chart.SeriesCollection();
                Excel.Series series102 = seriesCollection102.NewSeries();
                Excel.Range xValues102 = ws102.Range["A2", "A7"];
                Excel.Range values102 = ws102.Range["C2", "C7"];
                series102.XValues = xValues102;
                series102.Values = values102;
                series102.Name = "Score";
                //series13R2.Format.Line.ForeColor.RGB = (int)Excel.XlRgbColor.rgbBlue;
                series102.Border.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.FromArgb(79, 129, 190));

                //Formatting of Chart:
                // xlChart10.SetSourceData(values, Excel.XlRowCol.xlColumns);
                xlChart10.ChartType = Excel.XlChartType.xlRadar;
                xlChart10.PlotArea.Interior.ColorIndex = 2;
                xlChart10.PlotArea.Border.ColorIndex = 2;

                //Customize X axes:
                Excel.Axis xAxis10 = (Excel.Axis)xlChart10.Axes(Excel.XlAxisType.xlCategory, Excel.XlAxisGroup.xlPrimary);
                xAxis10.HasMajorGridlines = true;

                //Customize Y axes:
                Excel.Axis yAxis10 = (Excel.Axis)xlChart10.Axes(Excel.XlAxisType.xlValue, Excel.XlAxisGroup.xlPrimary);
                yAxis10.HasMajorGridlines = true;
                yAxis10.MaximumScaleIsAuto = false;
                yAxis10.MaximumScale = 10;
                yAxis10.MinimumScaleIsAuto = false;
                yAxis10.MinimumScale = 0;
                yAxis10.CrossesAt = -1.5;

                //Add title:
                xlChart10.HasTitle = true;
                xlChart10.ChartTitle.Text = "  ";
                xlChart10.SizeWithWindow = true;

                //Font Size
                xlChart10.ChartArea.Font.Size = fontSize;

                //Add & position of legend:
                xlChart10.HasLegend = true;

                xlChart10.Legend.Position = Excel.XlLegendPosition.xlLegendPositionBottom;
                xlChart10.Export("E:\\New folder " + "(" + Chrt + ")" + "\\Spider7" + Chrt + ".jpg", "jpg", missing);
                xla10.DisplayAlerts = false;
                xla10.Quit();

            }
        }

        private void btn_Close_Click(object sender, EventArgs e)
        {
            xla13R.DisplayAlerts = false;
            if (xla13R != null)
            {
                xla13R.Quit();
                xla13R = null;
            }
            //xla22R.DisplayAlerts = false;
            //if (xla22R != null)
            //{
            //    xla22R.Quit();
            //    xla22R = null;
            //}
            xla10.DisplayAlerts = false;
            if (xla10 != null)
            {
                xla10.Quit();
                xla10 = null;
            }
            this.Close();
        }
    }
}
