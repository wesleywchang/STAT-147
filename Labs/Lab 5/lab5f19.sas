/* Set up format of the output */
options ls = 78 nocenter nodate nonumber ps=55 formdlim='*';
 /* ls = linesize,  ps = pagesize   
           nocenter      justifies the output so it is not centered on the page
           nodate        suppresses printing of today's date on each page of output
           nonumber      suppresses printing of page number on each page of output
           formdlim      overrides the internal page breaks and replaces them 
                            with the designated symbol*/

/* Use DM to clear all windows except the editor window */

DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

/* Create a temporary SAS dataset named lab4w19 */

data lab4f19;
/* Create titles */
title1 'Statistics 147 Lab #6, Fall 2019';
title2 'Ian Dimapasok';
title3 'Question 1';
title4 'Part (i) Read in and print data';
/* Open data file plantf19.dat */

infile 'C:\Users\cdima002\Downloads\PLANTF19.dat' firstobs = 2;

/* Create nested do loops to read in data
NOTE: There are 10 rows and columns of data
First, do loop for rows*/
	do row = 1 to 10;
/* Do loop for columns*/
		do plant = 1 to 4;
/* Use If-Then-Else structure to name the plants*/
			if      plant = 1 then name = 'Plant A';
			else if plant = 2 then name = 'Plant B';
			else if plant = 3 then name = 'Plant C';
			else 				   name = 'Plant D';
/* Input response (data values) */
			input dischrg @@;
/* Output the data*/
			output;
/* Close do loops*/
		end;
	end;
/* Print the results */
proc print noobs;

/* First sort the datat according to the varibale plant */
proc sort;
/* Modify title4*/
title4 'Part (ii) Descriptive Statistics';
by plant;
/* Use proc means to generate the mean and variance for each plant*/
proc means n mean var;
	by plant;
	var dischrg;

/* Create new temporary data set which contain only observations from Plant B */
data onlyB;
/* Use set command to bring in all the data from the existing temporary data set called lab4f19 */
	set lab4f19;
/* Modify title4 */
	title4 'Part (iii): Plant B only with Descriptive Statistics';
/* Use if statement to restrict the data to Plant B, i.e., Plant 2 */
	if plant = 2; /*Could also use: if name = 'Plant B'; */

/* *************************************************************** */
/* *************************************************************** */
/* Create new variable representing the transformed data
new_data = (original variable) - (mean value to test) */
new_data = dischrg - 1.75;
/* Use proc means to generate information for testing mean of new_data=0 
	n	number of observations
	mean	sample mean
	t	t-test statistic
	probt	p-value for two-sided test */
proc means n mean t probt;
title4 'Part(i) Testing new-data mean = 0 using proc means';
	var new_data;

/* Use proc univariate to test mu0 value
   Use ods select TestsForLocation to surpress printing of 
   all output except for tests for location */
proc univariate mu0 = 1.75;
	ods select TestsForLocation;
	title4 'Part ii Using proc univariate to test mean = 1.75 vs mean not = 1.75';
	var dischrg;

/* Use proc ttest to test single mean; specify value to test: h0 = value_to_test */
proc ttest h0 = 1.75;
	title4 'Part iii Using proc ttest to test mean = 1.75 vs mean not = 1.75';
	var dischrg;

/* Use proc ttest to test single mean; specify value to test: h0 = value_to_test */
proc ttest h0 = 1.75;
	title4 'Part iv Using proc ttest to test mean = 1.75 vs mean > 1.75';
	var dischrg;

/* Use proc means to generate confidence interval
   Specify value of alpha to use: 99% -> alpha = 0.01 */
proc means n mean stddev clm alpha = 0.01;
	title4 'Part v 99% CI using proc means';
	var dischrg;

/* Use proc ttest to generate confidence interval
	Specify the value of alpha to use -> alpha = 0.01 */
proc ttest alpha = 0.01;
	title4 'Part vi 99% CI using proc ttest';
	var dischrg;
proc print noobs;
/* Use proc means to generate the mean and variance for each plant*/
proc means n mean stddev;
	var dischrg;
/* *************************************************************** */
/* *************************************************************** */

/* Create new dataset which contain observations from only Plant A and Plant B*/
data bothAB;
/* Use set command to bring in all the data from exisitng temorary data set called lab4f19 */
	set lab4f19;
/* Modify title4*/
	title4 ' Part(iv): Plant A and Plant B with Descriptive Statistics';
/* Use if statement to restrict the data to Plants A and B, i.e., Plants 1 and 2*/
	if plant = 1 or plant = 2;
proc print;
/* Use proc means to generate descriptive statistics*/
proc means n mean stddev;
	by plant;
	var dischrg;

/* Use proc ttest to generate information
	class	name of classification variable
	var		name of variable to test */
title4 'Part i';
proc ttest;
	class plant;
	var dischrg;

/* *************************************************************** */

/* Create temporary SAS dataset */
data paired;
	infile 'c:\Users\cdima002\Downloads\cartest1.dat' firstobs = 2;
	input car brandA brandB;
run;
quit;
