import excel "D:\stata\aprovacao_presidencial\aprovacao.xlsx", sheet("Planilha1") firstrow  clear
replace day = 15 if month == 3 & year == 1990 & presidente == "COLLOR"
gen data = mdy(month, day, year)
format data %td
sort data
quietly by data:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
encode presidente, gen(id)
xtset id data

sort data
gen timet = _n
xtset id timet

xtline d.bom, overlay legend(off) 


tline(01jan1995, lwidth(vvthin) lpattern(dash) lcolor(white)) tline(01jan1999, lwidth(none) lpattern(dash) lcolor(white)) /*
*/ tline(01jan2003, lwidth(vvthin) lpattern(dash) lcolor(white)) tline(01jan2007, lwidth(none) lpattern(dash) lcolor(white)) /*
*/ tline(01jan2011, lwidth(vvthin) lpattern(dash) lcolor(white)) tline(01jan2015, lwidth(none) lpattern(dash) lcolor(white)) /*
*/ tline(28dec1992, lwidth(vvthin) lpattern(dash) lcolor(white)) tline(15mar1990, lwidth(vvthin) lpattern(dash) lcolor(white)) /*
*/ tline(12may2016, lwidth(vvthin) lpattern(dash) lcolor(white)) /*
*/ scheme(s1rcolor) ytitle("% que avalia o governo como BOM") title("Aprovação dos presidentes - Sarney a Dilma") /*
*/ plot2(lc(cranberry)) plot3(lc(blue)) plot4(lc(orange_red)) plot5(lc(red)) plot7(lc(khaki)) plot6(lc(lavender)) /*
*/ ylabel(20(20)80, nogrid)

graph export pre2.png, width(4000) replace
