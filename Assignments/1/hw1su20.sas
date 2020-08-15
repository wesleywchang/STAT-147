/* Set up format of the output */
options nocenter ps
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

title1 'Statistics 147 Assignment #1';
    title2 'Summer 2020';
    title3 'Wesley Chang';

title4 'Question 1';

title5 'Subpart (i)';
/* i */
/* read data into wheat from file, listing variable names HardRed and SoftRed */
data wheat;
	infile 'C:\Users\wchan061_ucr\Downloads\wheat2.dat' firstobs=2;
	input HardRed SoftRed;
run;

/* print wheat */
proc print data = wheat;
run;


/* ii */
/* use proc to sort data by HardRed, then print */
title5 'Subpart (ii)';
proc sort;
	by HardRed;
proc print;
	var HardRed;
run;


/* iii */
/* 	generate bar chart for SoftRed using midpoints at 35 to 70, in increments of 10
	add coloration (lightblue as color of graph/chart background frame, verydarkblue
	as the color of the outline, hexagon as the shape of the bars, verydarkgreen as 
	the color of the text within the chart/graph and pink as the color for the bars */

title5 'Subpart (iii)';
proc gchart data = wheat;
	title6 'Bar Chart for SoftRed';
	vbar3d SoftRed / midpoints = 35 to 70 by 10 /* vertical 3d bar chart */
		cfr = lightblue 						/* frame */
		coutline = verydarkblue					/* outline */
		shape = hexagon							/* shape */
		ctext = verydarkgreen;					/* text */
	pattern color = pink;						/* color for bars */
run;


title5 'Subpart (iv)';
/* generate descriptive statistics for the yield in each variety */
/* proc univariate */

/* for SoftRed */
proc univariate data = wheat;
	title6 'SoftRed Summary Statistics';
	var SoftRed;
run;
	
/* for HardRed */
proc univariate data = wheat;
	title6 'HardRed Summary Statistics';
	var HardRed;
run;


title5 'Subpart (v)';
/* 	plot HardRed vs SoftRed, with SoftRed on vertical axis
	use proc gplot */

/* adjust format of the plot symbols */
symbol1 color = red
		value = dot
		height = 1;

/* generate high resolution plot using proc gplot */
proc gplot data = wheat;
	title6 'Plot of HardRed vs SoftRed';
	plot SoftRed*HardRed /
		caxis = darkgreen
		ctext = darkred;
run; 
