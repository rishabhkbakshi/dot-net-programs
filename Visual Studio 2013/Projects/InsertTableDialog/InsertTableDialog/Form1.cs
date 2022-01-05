using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using NUnit.Framework;

namespace InsertTableDialog
{
    public partial class InsertTableForm : Form
    {
        decimal columnSize = decimal.Parse(ConfigurationManager.AppSettings["columnSize"]);
        decimal Maxsize = decimal.Parse(ConfigurationManager.AppSettings["Maxsize"]);
        public InsertTableForm()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void InsertTableForm_Load(object sender, EventArgs e)
        {
            string sizeStr = getAppSetting("sizeValue").Contains("\"") ? getAppSetting("sizeValue") : getAppSetting("sizeValue") + "\"";
            columnUpDown.Enabled = true;
            columnUpDown.Text = getAppSetting("columnValue");
            rowUpDown.Enabled = true;
            rowUpDown.Text = getAppSetting("rowValue");
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            if (getAppSetting("rdobtnFix") == "true")
            {
                rdobtnFix.Checked = true;
                sizeUpDown.Enabled = true;
                if (getAppSetting("sizeValue").Equals("Auto"))
                {
                    string autoString = sizeStr.Replace("\"", "");
                    sizeUpDown.Text = autoString;
                }
                else
                {
                    sizeUpDown.Text = sizeStr;
                }
            }
            else if (getAppSetting("rdobtnContents") == "true")
            {
                rdobtnContents.Checked = true;
                sizeUpDown.Enabled = false;
                sizeUpDown.Text = "Auto";
            }
            else if (getAppSetting("rdobtnWindow") == "true")
            {
                rdobtnWindow.Checked = true;
                sizeUpDown.Enabled = false;
                sizeUpDown.Text = "Auto";
            }
        }

        private void rdobtnfix_CheckedChanged(object sender, EventArgs e)
        {
            if (rdobtnFix.Checked == false)
            {
                sizeUpDown.Enabled = false;
            }
            else
            {
                sizeUpDown.Enabled = true;
            }
        }

        private decimal sizeMeasurement(decimal columnCount)
        {
            decimal messegeBoxValue = (columnSize / columnCount);
            messegeBoxValue = decimal.Round(messegeBoxValue, 2);
            return messegeBoxValue;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            if (!columnUpDown.Items.Contains(columnUpDown.Text))
            {
                int EnteredIntValue = 0;
                bool IsIntOrNot = false;
                IsIntOrNot = int.TryParse(columnUpDown.Text, out EnteredIntValue);
                if (columnUpDown.Text.Contains("-") || columnUpDown.Text.ToString() == "0")
                {
                    if (columnUpDown.Text.ToString().StartsWith("-"))
                    {
                        MessageBox.Show("The number must between 1 to 63", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                else if (columnUpDown.Text.Contains("."))
                {
                    MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else if (IsIntOrNot)
                {
                    if (Convert.ToInt32(columnUpDown.Text) > 63)
                    {
                        MessageBox.Show("The number must between 1 to 63", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        MessageBox.Show("Valid Table", "Microsoft Word");
                        if (chkboxRemember.Checked == true)
                        {
                            setAppSetting("columnValue", columnUpDown.Text);
                        }
                    }
                }
                else if (!IsIntOrNot || (!columnUpDown.Items.Contains(columnUpDown.Text)))
                {
                    MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else
                {
                    MessageBox.Show("Valid Table", "Microsoft Word");
                    if (chkboxRemember.Checked == true)
                    {
                        setAppSetting("columnValue", columnUpDown.Text);
                    }
                }
            }
            else if (!rowUpDown.Items.Contains(rowUpDown.Text))
            {
                int EnteredIntValue = 0;
                bool IsIntOrNot = false;
                IsIntOrNot = int.TryParse(rowUpDown.Text, out EnteredIntValue);
                if (rowUpDown.Text.Contains("-") || rowUpDown.Text.ToString() == "0")
                {
                    if (rowUpDown.Text.ToString().StartsWith("-"))
                    {
                        MessageBox.Show("The number must between 1 to 5600", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                else if (rowUpDown.Text.Contains("."))
                {
                    MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else if (IsIntOrNot)
                {
                    if (Convert.ToInt32(rowUpDown.Text) > 5600)
                    {
                        MessageBox.Show("The number must between 1 to 5600", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        MessageBox.Show("Valid Table", "Microsoft Word");
                        if (chkboxRemember.Checked == true)
                        {
                            setAppSetting("rowValue", rowUpDown.Text);
                        }
                    }
                }
                else if (!IsIntOrNot || (!rowUpDown.Items.Contains(rowUpDown.Text)))
                {
                    MessageBox.Show("This is not valid number", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else
                {
                    MessageBox.Show("Valid Table", "Microsoft Word");
                    if (chkboxRemember.Checked == true)
                    {
                        setAppSetting("rowValue", rowUpDown.Text);
                    }
                }
            }
            else if (rdobtnFix.Checked == true)
            {
                if (!sizeUpDown.Items.Contains(sizeUpDown.Text))
                {
                    string strReplace = sizeUpDown.Text.Contains("\"") ? sizeUpDown.Text.Replace("\"", "0") : sizeUpDown.Text;
                    decimal EnteredIntValue = 0;
                    bool IsIntOrNot = false;
                    IsIntOrNot = decimal.TryParse(strReplace, out EnteredIntValue);

                    if (strReplace.Contains("-"))
                    {
                        if ((strReplace.StartsWith("-") && strReplace.Contains("Auto") && strReplace.EndsWith("-")) || (strReplace.StartsWith("-") && strReplace.Contains("Auto")) || strReplace.EndsWith("-"))
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else if (strReplace.StartsWith("-"))
                        {
                            MessageBox.Show("The measurement must be between 0\" and 22\"", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                    }
                    else if (IsIntOrNot)
                    {
                        if (Convert.ToDecimal(strReplace) > Maxsize)
                        {
                            MessageBox.Show("The measurement must be between 0\" and 22\"", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else if (Convert.ToDecimal(strReplace) <= Maxsize)
                        {
                            decimal x = Convert.ToDecimal(columnUpDown.Text);
                            decimal y = sizeMeasurement(x);
                            decimal z = Convert.ToDecimal(strReplace);
                            if (z > y)
                            {
                                MessageBox.Show("The measurement must be between 0.17\" to " + y + "\".", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                            }
                            else
                            {
                                MessageBox.Show("Valid Table", "Microsoft Word");
                                if (chkboxRemember.Checked == true)
                                {
                                    setAppSetting("columnValue", columnUpDown.Text);
                                    setAppSetting("rowValue", rowUpDown.Text);
                                    setAppSetting("sizeValue", sizeUpDown.Text);
                                    setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                                }
                            }
                        }
                        else
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                    }
                    else if (!IsIntOrNot || !sizeUpDown.Items.Contains(sizeUpDown.Text))
                    {
                        if (sizeUpDown.Text.ToString() == "" || sizeUpDown.Text.ToString() == "0" || sizeUpDown.Text.ToString() == "Auto")
                        {
                            MessageBox.Show("Valid Table", "Microsoft Word");
                            if (chkboxRemember.Checked == true)
                            {
                                setAppSetting("columnValue", columnUpDown.Text);
                                setAppSetting("rowValue", rowUpDown.Text);
                                setAppSetting("sizeValue", sizeUpDown.Text);
                                setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                            }
                        }
                        else
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                    }
                    else if (sizeUpDown.Text.ToString() == "Auto")
                    {
                        if (sizeUpDown.Text.ToString().StartsWith("-") || sizeUpDown.Text.ToString().EndsWith("-"))
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else
                        {
                            MessageBox.Show("Valid Table", "Microsoft Word");
                            if (chkboxRemember.Checked == true)
                            {
                                setAppSetting("columnValue", columnUpDown.Text);
                                setAppSetting("rowValue", rowUpDown.Text);
                                setAppSetting("sizeValue", sizeUpDown.Text);
                                setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                else if (sizeUpDown.Items.Contains(sizeUpDown.SelectedItem))
                {
                    if (sizeUpDown.SelectedItem.ToString() == "Auto")
                    {
                        MessageBox.Show("Valid Table", "Microsoft Word");
                        if (chkboxRemember.Checked == true)
                        {
                            setAppSetting("columnValue", columnUpDown.Text);
                            setAppSetting("rowValue", rowUpDown.Text);
                            setAppSetting("sizeValue", sizeUpDown.Text);
                            setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                        }
                    }
                    else
                    {
                        string str = sizeUpDown.SelectedItem.ToString();
                        string strnew = str.Replace("\"", "0");
                        decimal item = Convert.ToDecimal(strnew);
                        if (item > Maxsize)
                        {
                            MessageBox.Show("The measurement must be between 0\" and 22\"", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else if (item <= Maxsize)
                        {
                            decimal x = Convert.ToDecimal(columnUpDown.Text);
                            decimal y = sizeMeasurement(x);
                            decimal z = item;
                            if (z > y)
                            {
                                MessageBox.Show("The measurement must be between 0.17\" to " + y + "\".", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                            }
                            else
                            {
                                MessageBox.Show("Valid Table", "Microsoft Word");
                                if (chkboxRemember.Checked == true)
                                {
                                    setAppSetting("columnValue", columnUpDown.Text);
                                    setAppSetting("rowValue", rowUpDown.Text);
                                    setAppSetting("sizeValue", sizeUpDown.Text);
                                    setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                                }
                            }
                        }
                        else
                        {
                            MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                    }
                }
                else if (sizeUpDown.Items.Contains(sizeUpDown.Text))
                {
                    string str = sizeUpDown.Text.ToString();
                    string strnew = str.Contains("\"") ? str.Replace("\"", "0") : str;
                    if (str == "Auto")
                    {
                        MessageBox.Show("Valid Table", "Microsoft Word");
                        if (chkboxRemember.Checked == true)
                        {
                            setAppSetting("columnValue", columnUpDown.Text);
                            setAppSetting("rowValue", rowUpDown.Text);
                            setAppSetting("sizeValue", sizeUpDown.Text);
                            setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                        }
                    }
                    else if (Convert.ToDecimal(strnew) > Maxsize)
                    {
                        MessageBox.Show("The measurement must be between 0\" and 22\"", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else if (Convert.ToDecimal(strnew) <= Maxsize)
                    {
                        decimal x = Convert.ToDecimal(columnUpDown.Text);
                        decimal y = sizeMeasurement(x);
                        decimal z = Convert.ToDecimal(strnew);
                        if (z > y)
                        {
                            MessageBox.Show("The measurement must be between 0.17\" to " + y + "\".", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        }
                        else
                        {
                            MessageBox.Show("Valid Table", "Microsoft Word");
                            if (chkboxRemember.Checked == true)
                            {
                                setAppSetting("columnValue", columnUpDown.Text);
                                setAppSetting("rowValue", rowUpDown.Text);
                                setAppSetting("sizeValue", sizeUpDown.Text);
                                setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("This is not valid measurement", "Microsoft Word", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
            }
            else
            {
                MessageBox.Show("Valid Table", "Microsoft Word");
                if (chkboxRemember.Checked == true)
                {
                    //Save settings when application is closing
                    setAppSetting("columnValue", columnUpDown.Text);
                    setAppSetting("rowValue", rowUpDown.Text);
                    setAppSetting("sizeValue", sizeUpDown.Text);
                    if (rdobtnFix.Checked == true)
                    {
                        setAppSetting("rdobtnFix", rdobtnFix.Checked == true ? "true" : "false");
                        setAppSetting("rdobtnContents", rdobtnContents.Checked == false ? "false" : "true");
                        setAppSetting("rdobtnWindow", rdobtnWindow.Checked == false ? "false" : "true");
                    }
                    else if (rdobtnContents.Checked == true)
                    {
                        setAppSetting("rdobtnContents", rdobtnContents.Checked == true ? "true" : "false");
                        setAppSetting("rdobtnFix", rdobtnFix.Checked == false ? "false" : "true");
                        setAppSetting("rdobtnWindow", rdobtnWindow.Checked == false ? "false" : "true");
                    }
                    else if (rdobtnWindow.Checked == true)
                    {
                        setAppSetting("rdobtnWindow", rdobtnWindow.Checked == true ? "true" : "false");
                        setAppSetting("rdobtnFix", rdobtnFix.Checked == false ? "false" : "true");
                        setAppSetting("rdobtnContents", rdobtnContents.Checked == false ? "false" : "true");
                    }
                }
            }
        }

        private void dUpDown1_SelectedItemChanged(object sender, EventArgs e)
        {
            if (columnUpDown.Text == "")
            {
                btnOk.Enabled = false;
            }
            else
            {
                btnOk.Enabled = true;
            }
        }

        private void dUpDown2_SelectedItemChanged(object sender, EventArgs e)
        {
            if (rowUpDown.Text == "")
            {
                btnOk.Enabled = false;
            }
            else
            {
                btnOk.Enabled = true;
            }
        }

        public string getAppSetting(string key)
        {
            //Load the AppSettings
            Configuration config = ConfigurationManager.
                                    OpenExeConfiguration(
                                    System.Reflection.Assembly.
                                    GetExecutingAssembly().Location);
            //Return value which matches the given key
            return config.AppSettings.Settings[key].Value;
        }

        public void setAppSetting(string key, string value)
        {
            //Load AppSettingss
            Configuration config = ConfigurationManager.
                                    OpenExeConfiguration(
                                    System.Reflection.Assembly.
                                    GetExecutingAssembly().Location);
            //Check if entry (which matches the key) exists
            if (config.AppSettings.Settings[key] != null)
            {
                //Delete it for "overwrite" process
                config.AppSettings.Settings.Remove(key);
            }
            //Create new KeyValue pair
            config.AppSettings.Settings.Add(key, value);
            //Save the changed settings
            config.Save(ConfigurationSaveMode.Modified);
        }
    }
}













