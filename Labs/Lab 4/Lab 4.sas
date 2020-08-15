title1 'Statistics 147 Lab #4, Summer 2020';
title2 'Wesley Chang';

options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;


title3 'Question 1';
title4 'Part (i) Read in and Print the Data';

/* data set lab3su20 */
data lab3su20;
	infile 'C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Labs\Lab 4\plant.dat' firstobs = 2;

	/* create nested do loops to read in the data
		there are 10 rows and four columns of data */

	/* do loop for the rows */
	do row = 1 to 10;
		/* do loop for the columns */
		do plant = 1 to 4;
			/* if then else structure to name the plants */
			if 		plant = 1 then name = 'Plant A';
			else if plant = 2 then name = 'Plant B';
			else if plant = 3 then name = 'Plant C';
			else				   name = 'Plant D';

			/* input response (data values) */
			input dischrg @@;
			/* output the data */
			output;
		end;
	end;
run;

/* print the results */
proc print noobs data = lab3su20;
run;

/* sort the data according to the variable plant */
proc sort data = lab3su20;
	by plant;
run;

/* print the results */
proc print noobs data = lab3su20;
	title4 'Print to check sorted';
run;

/* use proc meanns to generate the mean and variance for each plant
		n				number of obs
		mean			sample mean
		var				sample var
		by plant		group the data according to the plant from which the observation was selected
		var discharge	generate mean and variance of the variable dischrg (for each plant)
*/

proc means n mean var data = lab3su20;
	title4 'Part (ii): Descriptive Statistics';
	by plant;
	var dischrg;
run;


/* Create new temporary SAS dataset which only contains the observations from Plant B */
data onlyB;
	/* use set command to bring in all the data */
	set lab3su20;

/* new code */
	/* create a new variable representing the transformed data */
			 /* new_data = (original variable) - (mean value to test) */
	new_data = dischrg - 1.75;

	/* use if statement to restrict the data from Plant B, ie, Plant 2 */

	if plant = 2; 		/* could also use: if name = 'Plant B' */
run;



/* use proc means to generate information for testing mean of new_data = 0
		n			number of observations
		mean 		sample mean
		t			t-test statistic
		probt		p-value for two-sided test
*/

proc means n mean stddev t probt data = onlyB;
	title4 'Part i: Testing new_data mean = 0 using proc means';
	var new_data;

proc univariate mu0 = 1.75 data = onlyB;
	ods select TestsForLocation;
	title4 'Part ii: using proc univariate to test mean = 1.75 vs mean not = 1.75';
	var dischrg;
run;

/* use proc ttest to test single mean; specify value to test: h0 = value_to_test */
proc ttest h0 = 1.75 data = onlyB;
	title4 'Part iii: using proc ttest to test mean = 1.75 vs mean not = 1.75';
	var dischrg;
run;

/* use proc ttest to test single mean; specify value to test: h0 = value_to_test
	use sides = upper to generate test for mu_B > 1.75 */
proc ttest h0 = 1.75 sides = upper data = onlyB;
	title4 'Part iv: using proc ttest to test Ho: mean = 1.75 vs Ha: mean > 1.75';
	var dischrg;
run;

/* use proc means to generate confidence interval
	specify value of alpha to use: 99% -> alpha = 0.01 */
proc means n mean stddev clm alpha = 0.01 data = onlyB;
	title4 'Part v: 99% CI using proc means';
	var dischrg;
run;

/* use proc ttest to generate confidence interval
	specify the value of alpha to use: -> alpha = 0.01 */
proc ttest alpha = 0.01 data = onlyB;
	title4 'Part vi: 99% CI using proc ttest';
var dischrg;
run;

/* end new code */

