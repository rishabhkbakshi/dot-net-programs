using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class Default10 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + @"C:\Users\rishabh\Downloads\MarkingSheetForGroupA.xlsx" + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        OleDbConnection xlConn = new OleDbConnection(connectionString);

        try
        {
            OleDbCommand xlCmdSelectScores = new OleDbCommand("Select [QUESTION NUMBER_],[MAX SCORE_],[SCORE_],[CANDIDATE_ID_] from [Sheet1$]", xlConn);
            OleDbDataAdapter xlDaSelectScores = new OleDbDataAdapter(xlCmdSelectScores);
            DataTable xlDtSelectScores = new DataTable();
            xlDaSelectScores.Fill(xlDtSelectScores);
            DataColumnCollection xlDcSelectScores = xlDtSelectScores.Columns;
            if (xlDcSelectScores.Contains("QUESTION NUMBER_") && xlDcSelectScores.Contains("MAX SCORE_")
                && xlDcSelectScores.Contains("SCORE_") && xlDcSelectScores.Contains("CANDIDATE_ID_"))
            {
                DataTable dtScores = new DataTable();
                dtScores = xlDtSelectScores.Copy();
                List<DataTable> resultScores = dtScores.AsEnumerable()
                                                       .GroupBy(row => row.Field<double>("CANDIDATE_ID_"))
                                                       .Select(g => g.CopyToDataTable())
                                                       .ToList();

                DataSet dsTemp = new DataSet();
                for (int i = 0; i < resultScores.Count; i++)
                {
                    dsTemp.Tables.Add("Table" + i);
                    dsTemp.Tables[i].Merge(resultScores[i]);
                }

                for (int i = 0; i <= dsTemp.Tables.Count - 1; i++)
                {
                    int scoreEmptyCheckCount = 0;
                    for (int j = 0; j <= dsTemp.Tables[i].Rows.Count - 1; j++)
                    {
                        if (dsTemp.Tables[i].Rows[j]["SCORE_"].ToString() == "")
                        {
                            scoreEmptyCheckCount++;
                        }
                    }
                    if (scoreEmptyCheckCount == 0)
                    {
                        int scoreErrorCount = 0;
                        int minusMarksCount = 0;
                        for (int k = 0; k <= dsTemp.Tables[i].Rows.Count - 1; k++)
                        {
                            int maxScore = Convert.ToInt32(dsTemp.Tables[i].Rows[k]["MAX SCORE_"]);
                            int score = Convert.ToInt32(dsTemp.Tables[i].Rows[k]["SCORE_"]);
                            if (score >= 0)
                            {
                                if (score > maxScore)
                                {
                                    scoreErrorCount++;
                                }
                            }
                            else
                            {
                                minusMarksCount++;
                            }
                        }
                        if (scoreErrorCount == 0 && minusMarksCount == 0)
                        {
                            Response.Write("Insertion Sucessfully");
                        }
                        else if (minusMarksCount > 0)
                        {
                            Response.Write("Incorrect Marking" + "<br/>" + "Please check the Scores");
                        }
                        else
                        {
                            Response.Write("Score is greater than Max Score" + "<br/>" + "Please check the Scores");
                        }
                    }
                    else
                    {
                        decimal c = dsTemp.Tables[i].Rows.Count;
                        decimal d = scoreEmptyCheckCount;
                        decimal a = c / d;
                        string check = a.ToString();
                        if (check.Contains("."))
                        {
                            int scoreErrorCount = 0;
                            int minusMarksCount = 0;
                            for (int k = 0; k <= dsTemp.Tables[i].Rows.Count - 1; k++)
                            {
                                int maxScore = Convert.ToInt32(dsTemp.Tables[i].Rows[k]["MAX SCORE_"]);
                                int score = Convert.ToInt32(dsTemp.Tables[i].Rows[k]["SCORE_"]);
                                if (score >= 0)
                                {
                                    if (score > maxScore)
                                    {
                                        scoreErrorCount++;
                                    }
                                }
                                else
                                {
                                    minusMarksCount++;
                                }
                            }
                            if (scoreErrorCount == 0 && minusMarksCount == 0)
                            {
                                Response.Write("Insertion Sucessfully");
                            }
                            else if (minusMarksCount > 0)
                            {
                                Response.Write("Incorrect Marking" + "<br/>" + "Please check the Scores");
                            }
                            else
                            {
                                Response.Write("Score is greater than Max Score" + "<br/>" + "Please check the Scores");
                            }
                        }
                    }
                }
            }
        }
        catch (FormatException ex)
        {
            Response.Write("Data is not in Correct Form" + ex);
        }
        catch (OleDbException ex)
        {
            Response.Write(ex.Message);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            xlConn.Close();
            xlConn.Dispose();
            OleDbConnection.ReleaseObjectPool();
        }
    }
}