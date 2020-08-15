title1 'Statistics 147 Assignment #3';
title2 'Summer 2020';
title3 'Wesley Chang';

/* set up options */
options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

title4 'Question 1';

title5 'Part (i) and (ii)';

data agility1;
	
	/* read from file */
	infile 'C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Assignments\3\agility.dat' firstobs = 3;

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
proc print noobs data = agility1;
run;


title5 'Part (iii)';
/* add code to sort the data by the name of the dog */
proc sort data = agility1;
	by dog;
run;

proc print noobs data = agility1;
	title6 'Print to check sorted';
run;


title5 'Part (iv)';
/* add code to generate mean, std dev, and median */
proc means mean stddev median data = agility1;
	title6 'Mean, Standard Deviation, and Median for agility.dat';
	by dog;
	var score;
run;

title5 'Part (v)';
title6;
/* create a new temporary SAS data set, named onlyC, in which data is restricted to the times of Cody */

data onlyC;
	/* use set command to pull data from agility1 */
	set agility1;

	/* use if statement to restrict data to the times of Cody */
	if dog = 1;
run;

/* print onlyC to test if it worked */
proc print noobs data = onlyC;
	title6 'Only Codys scores';
	var score;
run;


title6 'Subpart a';
/* test whether the true mean time of the Cody team is 75 minutes, at a=0.05 */
/* use the t-test, proc ttest */
proc ttest h0 = 75 data = onlyC;
	title7 'Test whether the true mean time of the Cody team is 75 minutes';
	var score;
run;

title6 'Subpart b';
/* find and interpret a 98% confidence interval for the true mean finishing time for the Cody team */
/* use proc means */
proc means clm alpha = 0.02 data = onlyC;
	title7 '98% confidence interval for the Cody team';
	var score;
run;
quit; 
