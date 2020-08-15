/* Set up format of the output */
options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

ods graphics off;

data _null_;
    rc=dlgcdir("/folders/myshortcuts/STAT_147_(Session_A)/Labs/Lab 2");
    put rc=;
run;

data _null_;
    rc=dlgcdir();
    put rc=;
run;

/* Create titles */
title1 'Statistics 147, Summer 2020';
title2 'Lab 2';
title3 'Wesley Chang';

/* 	
	Create a SAS data set called age_level, 
	open data files using an infile statement, 
	with data that beings on line 2
*/

data age_level;
	infile '/folders/myshortcuts/STAT_147_(Session_A)/Labs/Lab 2/ages.dat' firstobs = 2;
	input Father Mother;
run;

proc print data = age_level;
	title4 'Question 1';