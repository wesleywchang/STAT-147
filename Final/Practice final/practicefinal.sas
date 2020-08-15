title1 'Practice final for SAS';


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
	rc = dlgcdir("C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Final\Practice final");
	/* print new workinng directory */
	put rc=;
run;


title2 'Problem 3';

/* consider problem 1, complete the following using SAS */

data agegroup;
	infile 'agegroup_f19.dat' firstobs=3;

	do rows = 1 to 10;
		do columns = 1 to 4;
			if			columns = 1		then group = "Group 1";
			else if		columns = 2		then group = "Group 2";
			else if		columns = 3		then group = "Group 3";
			else							 group = "Group 4";

			input hrate @@;
			output;
		end;
	end;
run;

proc sort data = agegroup;
	by group;
run;

proc print noobs data = agegroup;
	var group hrate;
run;

title3 'Part i';
/* perform appropriate test(s) of hypothesis to determine whether there 
	is a significant difference in mean increase in heart rate betweent the four age groups
*/

title4 'Subpart a';
/* test for normality of each of the 4 age groups (Shaprio-Wilks Test) */

/* use proc univariate with the normal options to test normality
	Use ods select TestsForNormality to suppress printing of everything except
	the tests for normality
	Use "by" statement to generate test for each plant */

proc univariate normal;
	ods select TestsForNormality;
	/* generate a test for each group */
	by group;
	/* the variable to test */
	var hrate;
run;



title4 'Subpart b';
/* if appropriate, test for equality (homogeneity) of variances */
/* from (a), we can assume normality in each group */

/* use Bartlett's test */

/* Barlett's test can be conducted using proc glm with the HOVTEST option */
/* we can also test difference in means */

/* Use proc glm to generate appropriate output */
/* class name of classification variable
	model dependent = class
	means class/ HOVTEST = bartlett */

proc glm;
	class group;
	model hrate = group;
	means group / HOVTEST = bartlett;
run;


title4 'Subpart c';
/* if appropriate, test for the equality of means */

/* we assume normality and homogeneity in variances */
/* now, we can test using the same command from above,
	but looking at a different section of the results. */

proc glm;
	class group;
	model hrate = group;
	means group / HOVTEST = bartlett;
run;



title4 'Subpart d';
/* if appropriate, employ multiple comparions (Tukey's test) to determine which mean(s) might be significantly different */

/* append the proc glm statment from above to perform Tukey's test */

proc glm;
	class group;
	model hrate = group;
	means group / HOVTEST = bartlett;
	/* for grouping method */
	means name /tukey;
	/* for confidence interval method */
	means name /tukey cldiff;
run;



title3 'Part ii';
/* perform the appropriate test(s) of hypothesis to determine whether there the mean increase in heart rate for
	age group 1 is significantly larger than the mean increase in heart rate for group 2 */

/* first, create a dataset that restricts the data to only group 2 and 3 */
data G1G2;
	set agegroup;

	if group = "Group 1" or group = "Group 2";
run;

proc print noobs data = G1G2;
	var group hrate;
run;


title4 'Subpart a';
/* test for equality of variances */

/* proc ttest */
/* test H0: variance G1 = variance G2 */
/* proc ttest */
/* use sides = U (upper) */
proc ttest sides = U data = G1G2;
	/* compare by group */
	class group;
	/* compare the differencees in heart rates */
	var hrate;
run;


title4 'Subpart b';
/* test the means, based on your results in part (a) */

/* same commmand as above, but looking at the results for the means */

/* proc ttest */
/* proc ttest */
/* test H0: G1 > G2 */
/* use sides = U (upper) */
/* assume equal variances */
proc ttest sides = U data = G1G2;
	/* compare by group */
	class group;
	/* compare the differencees in heart rates */
	var hrate;
run;


title3 'Part iii';
title4 '';
/* perform the appropriate test(s) of hypothesis to determine whether the mean increase in heart rate for G3 is greater than 25 */

/* first, isolate group 3 into a new data set */
data onlyG3;
	/* from the data set agegroup */
	set agegroup;
	/* if the group name is Group 3 */
	if group = "Group 3";
run;

/* print to check */
proc print noobs data = onlyG3;
	var group hrate;
run;

title4 'Method 1';
/* METHOD 1 */

/* use proc ttest */
/* sides = U (upper) 
	h0 = 25
	*/

proc ttest sides = U h0 = 25 data = onlyG3;
	/* test the values of the difference in heart rate */
	var hrate;
run;


title4 'Method 2';
/* METHOD 2 */

/* use proc univariate */
/* for one-sided test, must divide the p-value by two */
proc univariate mu0 = 25 data = onlyG3;
	/* use TestsForLocation */
	ods select TestsForLocation;
	var hrate;
run;



title3 'Part iv';
title4 '';
/* find and interpret a 98% CI for the mean increase in heart rate for Group 4 (/

/* first, isolate group 4 into a new data set */
data onlyG4;
	/* from the data set agegroup */
	set agegroup;
	/* if the group name is Group 4 */
	if group = "Group 4";
run;

/* print to check */
proc print noobs data = onlyG4;
	var group hrate;
run;


/* use proc means to get the 98% confidence interval */
/* options:
		clm = confidence interval of mean
		alpha = level of significance
*/

proc means clm alpha = 0.02;
	var hrate;
run;




title2 'Question 4';
title3 '';
title4 '';


title3 'Part i';
/* write the appropriate SAS code to read in and print the data from litter2_f19.dat
	DO NOT USE DO LOOPS */

data litter2;
	/* read the file, with the first observation on line 2 */
	infile 'litter2_f19.dat' firstobs = 2;

	/* input statement creating list Litter, Male, and Female */
	input Litter Male Female @@;
	output;
run;

/* print litter2 as a check */
proc print noobs data = litter2;
run;


title3 'Part ii';
/* perform the appropriate test of hypothesis to determine if there is a significant difference
	in average selling price between male and female puppies */

/* this is a paired test */
/* use proc ttest with a paired options */
proc ttest;
	/* put your pairs here */
	paired Male*Female;
run;

quit;
