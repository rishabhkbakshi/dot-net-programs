namespace Telephone
{
    partial class EntryForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitle = new System.Windows.Forms.Label();
            this.lblFname = new System.Windows.Forms.Label();
            this.lblLname = new System.Windows.Forms.Label();
            this.lblMname = new System.Windows.Forms.Label();
            this.txtFname = new System.Windows.Forms.TextBox();
            this.txtMname = new System.Windows.Forms.TextBox();
            this.txtLname = new System.Windows.Forms.TextBox();
            this.lblContact = new System.Windows.Forms.Label();
            this.txtContact = new System.Windows.Forms.TextBox();
            this.picBox = new System.Windows.Forms.PictureBox();
            this.btnSubmit = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lbldes = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.picBox)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.Location = new System.Drawing.Point(14, 34);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(43, 20);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Title";
            // 
            // lblFname
            // 
            this.lblFname.AutoSize = true;
            this.lblFname.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFname.Location = new System.Drawing.Point(15, 88);
            this.lblFname.Name = "lblFname";
            this.lblFname.Size = new System.Drawing.Size(72, 15);
            this.lblFname.TabIndex = 1;
            this.lblFname.Text = "First Name*";
            // 
            // lblLname
            // 
            this.lblLname.AutoSize = true;
            this.lblLname.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLname.Location = new System.Drawing.Point(12, 162);
            this.lblLname.Name = "lblLname";
            this.lblLname.Size = new System.Drawing.Size(72, 15);
            this.lblLname.TabIndex = 2;
            this.lblLname.Text = "Last Name*";
            // 
            // lblMname
            // 
            this.lblMname.AutoSize = true;
            this.lblMname.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMname.Location = new System.Drawing.Point(12, 126);
            this.lblMname.Name = "lblMname";
            this.lblMname.Size = new System.Drawing.Size(82, 15);
            this.lblMname.TabIndex = 3;
            this.lblMname.Text = "Middle Name";
            // 
            // txtFname
            // 
            this.txtFname.Location = new System.Drawing.Point(117, 87);
            this.txtFname.Name = "txtFname";
            this.txtFname.Size = new System.Drawing.Size(143, 20);
            this.txtFname.TabIndex = 4;
            // 
            // txtMname
            // 
            this.txtMname.Location = new System.Drawing.Point(117, 125);
            this.txtMname.Name = "txtMname";
            this.txtMname.Size = new System.Drawing.Size(143, 20);
            this.txtMname.TabIndex = 5;
            // 
            // txtLname
            // 
            this.txtLname.Location = new System.Drawing.Point(117, 161);
            this.txtLname.Name = "txtLname";
            this.txtLname.Size = new System.Drawing.Size(143, 20);
            this.txtLname.TabIndex = 6;
            // 
            // lblContact
            // 
            this.lblContact.AutoSize = true;
            this.lblContact.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblContact.Location = new System.Drawing.Point(12, 199);
            this.lblContact.Name = "lblContact";
            this.lblContact.Size = new System.Drawing.Size(75, 15);
            this.lblContact.TabIndex = 7;
            this.lblContact.Text = "Contact No.*";
            // 
            // txtContact
            // 
            this.txtContact.Location = new System.Drawing.Point(117, 198);
            this.txtContact.Name = "txtContact";
            this.txtContact.Size = new System.Drawing.Size(143, 20);
            this.txtContact.TabIndex = 8;
            // 
            // picBox
            // 
            this.picBox.BackColor = System.Drawing.Color.White;
            this.picBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picBox.Image = global::Telephone.Properties.Resources.NoPix;
            this.picBox.Location = new System.Drawing.Point(294, 87);
            this.picBox.Name = "picBox";
            this.picBox.Size = new System.Drawing.Size(90, 83);
            this.picBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picBox.TabIndex = 18;
            this.picBox.TabStop = false;
            // 
            // btnSubmit
            // 
            this.btnSubmit.Location = new System.Drawing.Point(228, 250);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(75, 23);
            this.btnSubmit.TabIndex = 19;
            this.btnSubmit.Text = "&Submit";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.btnSubmit_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(309, 250);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 20;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lbldes
            // 
            this.lbldes.AutoSize = true;
            this.lbldes.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbldes.Location = new System.Drawing.Point(15, 54);
            this.lbldes.Name = "lbldes";
            this.lbldes.Size = new System.Drawing.Size(60, 13);
            this.lbldes.TabIndex = 21;
            this.lbldes.Text = "Description";
            // 
            // EntryForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.MenuHighlight;
            this.ClientSize = new System.Drawing.Size(396, 289);
            this.Controls.Add(this.lbldes);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSubmit);
            this.Controls.Add(this.picBox);
            this.Controls.Add(this.txtContact);
            this.Controls.Add(this.lblContact);
            this.Controls.Add(this.txtLname);
            this.Controls.Add(this.txtMname);
            this.Controls.Add(this.txtFname);
            this.Controls.Add(this.lblMname);
            this.Controls.Add(this.lblLname);
            this.Controls.Add(this.lblFname);
            this.Controls.Add(this.lblTitle);
            this.Name = "EntryForm";
            this.Text = "Phone Book";
            ((System.ComponentModel.ISupportInitialize)(this.picBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Label lblFname;
        private System.Windows.Forms.Label lblLname;
        private System.Windows.Forms.Label lblMname;
        private System.Windows.Forms.TextBox txtFname;
        private System.Windows.Forms.TextBox txtMname;
        private System.Windows.Forms.TextBox txtLname;
        private System.Windows.Forms.Label lblContact;
        private System.Windows.Forms.TextBox txtContact;
        private System.Windows.Forms.PictureBox picBox;
        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lbldes;
    }
}

