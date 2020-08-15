title1 'Statistics 147 Lab #6';
title2 'Summer 2020';
title3 'Wesley Chang';

options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;



title4 'Question 1';

title5 'Part i';

/* perform the appropriate test to determine whether there is a significant difference in the mean amount of effluent between the four plants */

title6 'Subpart a';
/* first, test for normality of each of the plants using proc univariate and the Shapiro-Wilks test */

data lab6;
	infile 'C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\Labs\Lab 6\plant.dat' firstobs = 2;

	do row = 1 to 10;
		do plant = 1 to 4;
			if 				plant = 1 		then name = 'Plant A';
			else if			plant = 2		then name = 'Plant B';
			else if			plant = 3		then name = 'Plant C';
			else								 name = 'Plant D';

			input dischrg @@;
			output;

		end;
	end;
run;

proc print noobs data = lab6;
	var name dischrg;
run;

proc sort data = lab6;
	by plant;
run;

proc print noobs data = lab6;
	var name dischrg;
run;

proc means n mean var;
	by plant;
	var dischrg;
run;


/* using proc univariate */
proc univariate normal;
	ods select TestsForNormality;
	by plant;
	var dischrg;
run;


title6 'Subpart b';

/* use proc glm to generate appropriate output
	
		class		name of classification variables
		model		dependent = class
		means 		class / HOVTEST = bartlett */

proc glm;
	class plant;
	model dischrg = plant;
	means plant /HOVTEST = bartlett;
run;


title6 'Subpart c';



proc glm;
	class plant;
	model dischrg = plant;
	means plant /HOVTEST = bartlett;
	
	/* use Tukey's test to determine which treatment means are different */
	title7;
	means plant / tukey;

	/* using confidence interval method */
	title7;
	means plant / tukey cldiff;

run;



