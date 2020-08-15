/* Set up output and graphics options */
options ls = 78 nocenter nodate nonumber ps=55 formdlim='*'; 
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;
     
     /* Use the title command to generate main titles for your output */
     title1 'Statistics 147, Summer 2020';
     title2 'Wesley Chang';
     title3 'SAS Practice Program 1';
     
 data try1;
 	input x @@;
 	
 	y = x**3;
 	
 	datalines;
 	1 3 5 7 9 -8 -6 -4 -2 0
 	;
 run;
 
/* print data as a check */
proc print data = try1;
	title4 'My very first SAS data step <3';
run;

/* See which variables/columns are in the dataset */
proc contents short data = try1;
run;

/* FORMAT:
	proc gplot data = tempSasDataName;
		plot vertical * horizontal; */

/* create a ploy of y vs x using proc gplot */
proc sgplot data = try1;
	/* update title */
	title4 'Plot of Y vs X';
	
	/* VERTICAL axis comes FIRST in the plot command */
	plot y*x
run;

quit;
