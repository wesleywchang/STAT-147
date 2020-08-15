title1 'Statistics 147 Lab #5';
title2 'Summer 2020';
title3 'Wesley Chang';

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


data bothAB;
	set lab3su20;
	if plant = 1 or plant = 2;
run;

proc print data = bothAB;
run;

proc means n mean stddev data = bothAB;
	by plant;
	var dischrg;
run;


proc ttest data = bothAB;
	class plant;
	var dischrg;
run;




title3 'Question 2';

data paired;
	infile 'c:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Labs\Lab 5\cartest1.dat' firstobs = 2;
	input Car BrandA BrandB;
run;
quit;

proc print noobs data = paired;
run;

proc ttest;
	paired BrandA*BrandB;
run;
