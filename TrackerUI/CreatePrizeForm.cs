﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrackerLibrary;
using TrackerLibrary.Models;

namespace TrackerUI {
    public partial class CreatePrizeForm : Form {

        IPrizeRequester callingForm;

        public CreatePrizeForm(IPrizeRequester caller) {
            InitializeComponent();

            callingForm = caller;
        }

        private void createPrizeButton_Click(object sender, EventArgs e) {
            if(ValidateForm()) {
                PrizeModel model = new PrizeModel(
                    placeNameValue.Text, 
                    placeNumberValue.Text, 
                    prizeAmountValue.Text, 
                    prizePercentageValue.Text);

                GlobalConfig.Connection.CreatePrize(model);

                callingForm.PrizeComplete(model);

                placeNameValue.Text = "";
                placeNumberValue.Text = "";
                prizeAmountValue.Text = "0";
                prizePercentageValue.Text = "0";

                this.Close();

            } else {
                MessageBox.Show("This form has invalid information. Please check it and try again.");
            }
        }

        private bool ValidateForm() {
            bool output = true;

            bool placeNumberValidNumber = int.TryParse(placeNumberValue.Text, out int placeNumber);

            if(!placeNumberValidNumber) {
                output = false;
            }

            if(placeNumber < 1) {
                output = false;
            }

            if(placeNameValue.Text.Length == 0) {
                output = false;
            }

            bool prizeAmountValidNumber = decimal.TryParse(prizeAmountValue.Text, out decimal prizeAmount);

            if(!prizeAmountValidNumber) {
                output = false;
            }

            if(prizeAmount < 0) {
                output = false;
            }

            bool prizePercentageValid = double.TryParse(prizePercentageValue.Text, out double prizePercentage);

            if(!prizePercentageValid) {
                output = false;
            }

            if(prizeAmount <= 0 && prizePercentage <= 0) {
                output = false;
            }

            if(prizePercentage < 0 || prizePercentage > 100) {
                output = false;
            }

            return output;
        }
    }
}
