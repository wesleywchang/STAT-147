/* Set up formate of the output */
options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*'

/* Use DM to clear all windows except the editor window */
DM log "odsresults; clear; out; clear; log; clear;";

ods graphics off;

/* Create a temporary SAS data set and enter the values manually */
data quizzes;

/* Input variable list
	quiz		represents quiz number
	section1 	represents quiz averages for Section 1
	section2	represents quiz averages for Section 2
	@@			allows entry of more than one piece of data per line */

	input quiz section1 section2 @@;

/* Use mean function command to calc the average for both sections for each quiz */
	overall_average = mean(of section1 - section2);

/* Use datalines command to indicate the data is about to follow.
	Enter the values alternating between quiz, section1, and section2. */

datalines;
1 7.6 6.6 2 6.2 8.2 3 8.0 6.5 4 5.6 4.8
5 9.7 9.0 6 7.6 7.2 7 6.6 5.7
;
run; /* use run statement to separate data step from poc step */

/* Print the data as a check */

proc print noobs;
	var overall average;

proc sort data = quizzes;
	by overall_average;

proc print data = quizzes;
run;
quit;
