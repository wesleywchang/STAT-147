title1 'Statistics 147 Assignment #5';
title2 'Summer 2020';
title3 'Wesley Chang';

options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;


title4 'SAS Question 1';

data agility;
	infile 'C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Assignments\5\agility.dat' firstobs = 3;

	/* do loop for rows */
	do row = 1 to 8;
		/* do loop for columns */
		do dog = 1 to 3;
			/* if then structure to name dogs */
			if			dog = 1 then name = 'Cody';
			else if		dog = 2 then name = 'Dusty';
			else					 name = 'Shadow';

			/* input statement */
			input score @@;
			output;
		end;
	end;
run;

/* print out results */
proc print noobs data = agility;
run;

/* add code to sort the data by the name of the dog */
proc sort data = agility;
	by dog;
run;

proc print noobs data = agility;
	title6 'Print to check sorted';
run;


title5 'Part i';
title6 'test for normality';
/* test for normality for each of the dogs, using Shapiro-Wilk test */

/* use proc univariate with the normal options to test normality
	Use ods select TestsForNormality to suppress printing of everything except
	the tests for normality
	Use "by" statement to generate test for each plant */

proc univariate normal;
	ods select TestsForNormality;
	by name;
	var score;
run;


title5 'Part ii and iii';
title6 'Test for equality (homogeneity of variances), using Bartletts test; and difference in means';

/* Barlett's test can be conducted using proc glm with the HOVTEST option */
/* we can also test difference in means */

/* Use proc glm to generate appropriate output */
/* class name of classification variable
	model dependent = class
	means class/ HOVTEST = bartlett */

proc glm;
	class name;
	model score = name;
	means name /HOVTEST = bartlett;
run;


title5 'Part iv';
title6 'using Tukeys test to determine which means are significantly different';

/* append the code from parts ii and iii to include
		means name / tukey
	to perform Tukey's test
	*/

proc glm;
	class name;
	model score = name;
	means name /HOVTEST = bartlett;
	/* for grouping method */
	means name / tukey;
	/* for confidence interval method */
	means name /tukey cldiff;
run;
