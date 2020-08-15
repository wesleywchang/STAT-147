/* 	Statistics 147 Exam II, Part 1: SAS
	Summer 2020
	Wesley Chang */
title1 'Statistics Exam II, Part 1: SAS';
title2 'Summer 2020';
title3 'Wesley Chang';


/* Set up format of the output */
options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

/* add line of code to clear all windows except the editor window */
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

/* goptions settings */
goptions reset = all colors = (blue,red,green,purple)
	ftitle = swissb ftext=swissb htitle=1.5 htext=1.0;






/* setting the SAS working directory */
data _null;
	/* rc = dlgcdir("Desired directory path"); */
	rc = dlgcdir("C:\Users\wesle\iCloudDrive\Summer 2020\STAT 147 (Session A)\Final");
	/* print new workinng directory */
	put rc=;
run;




title4 'Question 1';
/* Carly and Shannon work in Research & Development for a premium dog food company that was interested in
marketing a new food for adult dogs that are severely overweight. Carly and Shannon are considering 3 recipes
for the new “diet” food and have decided to test them using severely overweight Labrador Retriever adult dogs
(of approximately the same age and health condition). Twenty-four severely overweight Labs were selected at
random and then each randomly assigned to one of the three recipes of dog food. After an appropriate amount
of time, the weight loss, measured in pounds, was recorded. */


title5 'Part i and ii';
/* read in and print out the data file dogdiet.dat (using nested DO Loops) */
/* data set diet_all */
data diet_all;

	/* read from file dogdiet.dat, skipping to first observations on line 3 */
	infile "dogdiet.dat" firstobs=3;

	/* do loop to read data for 8 rows */
	do rows = 1 to 8;

		/* do loop for 3 columns of data */
		do column = 1 to 3;

			/* if then else structure to name each observation */
			if 				column = 1 		then form_name = "Formula1";
			else if			column = 2 		then form_name = "Formula2";
			else								 form_name = "Formula3";

		/* input and output data */
		input number @@;
		output;

		end;
	end;
run;




title5 'Part iii';

/* sort data by formula name */
proc sort data = diet_all;
	by form_name;
run;
/* print to check */
proc print noobs data = diet_all;
	var form_name number;
run;




title5 'Part iv';
/* test for the normality of the data for each formula, using the Shapiro-Wilk test */

/* use proc univariate with the normal options to test normality
	Use ods select TestsForNormality to suppress printing of everything except
	the tests for normality
	Use "by" statement to generate test for each plant */

proc univariate normal data = diet_all;
	ods select TestsForNormality;
	/* generate a test for each group */
	by form_name;
	/* the variable to test */
	var number;
run;


title5 'Part v';
/* test for the equality (homogeneity) of variances, a = 0.05

/* if appropriate, test for equality (homogeneity) of variances */
/* from part iv, we can assume normality in each group */

/* use Bartlett's test */

/* Barlett's test can be conducted using proc glm with the HOVTEST option */
/* we can also test difference in means */

/* Use proc glm to generate appropriate output */
/* class name of classification variable
	model dependent = class
	means class/ HOVTEST = bartlett */

proc glm data = diet_all;
	class form_name;
	model number = form_name;
	means form_name / HOVTEST = bartlett;
run;



title5 'Part vi';
/* test for equality in the difference of means */

/* we assume normality and homogeneity in variances */

/* now, we can test using the same command from above,
	but looking at a different section of the results. */


proc glm data = diet_all;
	class form_name;
	model number = form_name;
	means form_name / HOVTEST = bartlett;
run;



title5 'Part vii';
/* If appropriate, use Tukey’s test and the grouping method to determine which formulas mean
weight loss is/are different */

/* append the proc glm statment from above to perform Tukey's test */

proc glm data = diet_all;
	class form_name;
	model number = form_name;
	means form_name / HOVTEST = bartlett;
	/* for grouping method */
	means form_name /tukey;
run;






title4 'Question 2';

title5 'Only Formula 1';
/* Refer to Question 1. Create a new temporary SAS data set, named onlyFormula1, in which the data is
restricted to the Formula1 labs only. (Be sure to print the data as a check) */

/* subsetting data using if then else structure */
/* only formula 1 */
data onlyFormula1;

	/* use the data set diet_all */
	set diet_all;

	/* restrict data to only those named "Formula 1" */
	if form_name = "Formula1";
run;

/* print onlyF1 to check */
proc print noobs data = onlyFormula1;
	var number;
run;


title5 'Part ii';
/* Zigvo would like to determine whether the true average weight loss for Formula1 is 4 pounds. Perform
the appropriate test of hypothesis. Use a = 0.05 */

/* use proc ttest */
/* 
	h0 = 4
	*/

proc ttest h0 = 4 data = onlyFormula1;
	/* test the values of the weight loss */
	var number;
run;



title5 'Part iii';
/* find and interpret a 97% Confidence interval fro the true mean weight loss of Formula1 */

/* use proc means to get the 97% confidence interval */
/* options:
		clm = confidence interval of mean
		alpha = level of significance
*/

proc means clm alpha = 0.03 data = onlyFormula1;
	/* for the values of the weight loss */
	var number;
run;




title4 'Question 3';


title5 'Part i';

/* Create a new temporary SAS data set, named bothF1F3 in which the data is restricted to the weight
loss of the Formula1 and Formula3 labs. (Be sure to print the data as a check.) */


/* create data set that excludes Formula 2 */
data bothF1F3;

	/* use set diet_all */
	set diet_all;

	/* restrict data to those not titled "Formula 1" */
	/* this means only Formula 2 and Formula 3 are kept */
	if form_name ^= "Formula2";
run;

/* print F2F3 to check */
proc print noobs data = bothF1F3;
	var form_name number;
run;



title5 'Part ii and Part iii';
/*  Is it reasonable to assume equality of variances? Complete the following test */

/* test equality of variances  */
/* use proc ttest without any options */

proc ttest data = bothF1F3;
	class form_name;
	var number;
run;

/* since we assume equal variances, we can use the pooled variance for equality in mean */




title4 'Question 4';

/*  Disc dog is the more generic name for what is commonly called Frisbee dog. In disc dog competitions, dogs and
their human flying disc throwers compete in events such as distance catching and somewhat choreographed
freestyle catching. Scores differ among judges, even when the same performance is being evaluated. Kal and
Thomas have been selected to be judges in a local disc dog competition. The scores, reported by Kal (J1) and
Thomas (J2), for 11 competitors are located in a data file named dogjudge.dat */


title5 'Part i';
/* read in and print out data file dogjudge.dat WITHOUT using do loops */
data judging;

	/* read from file dogjudge.dat, skipping to the first observations on line 3 */
	infile 'dogjudge.dat' firstobs = 3;

	/* reference page 8-9 in textbook for formatting options */
	/* input variables dog, J1, J2 */
	input dog $1-8 J1 J2;
	output;
run;

/* print data as a check */
proc print noobs data = judging;
run;


title5 'Part ii';
/*  Perform the appropriate test of hypothesis to determine whether the average score from Kal (J1) is
significantly different from the average score from Thomas (J2). Use a = 0.05. */

/* H0: muJ1 = muJ2
	H1: muJ1 /=  muJ2
	a = 0.05
*/

/* use proc ttest */
/* paired test */


proc ttest;
	/* pairs */
	paired J1*J2;
run;
