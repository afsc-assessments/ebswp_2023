Mort$multisppM1[[1]]  # pollock M1 residual mortality in the multispp model
Mort$M2_Matrixyr$M2_1  # pollock predation mortality matrix (rows= years, cols = ages) 
total_M = Mort$multisppM1[[1]][1] + Mort$M2_Matrixyr$M2_1[,1]   #AGE 1 total mort
myM <- Mort$multisppM1[[1]] +  Mort$M2_Matrixyr$M2_1 
for (i in 1:dim(myM)[1]) myM[i,] <-Mort$multisppM1[[1]] +  Mort$M2_Matrixyr$M2_1[i,]  
dim(myM)
myM

  + Mort$M2_Matrixyr$M2_1[,1] 
names(Mort)
#> "M2_Matrixyr"   "meanM2_Matrix" "singlesppM1"   "multisppM1"
# load results from Multispp:
load(file.path(fl_2,"results/CEATTLE_results.Rdata"))
M2_1<-apply(tmp$M2_1,2,mean)
M2_2<-apply(tmp$M2_2,2,mean)
M2_3<-apply(tmp$M2_3,2,mean)
MortMat<-list(M2_1=tmp$M2_1,M2_2=tmp$M2_2,M2_3=tmp$M2_3)

M1<-list()
M1[[1]]<-round(M2_1+tmp$M1_1[1,],4)
M1[[2]]<-round(M2_2+tmp$M1_2[1,],4)
M1[[3]]<-round(M2_3+tmp$M1_3[1,],4)
msmM1<-list()
msmM1[[1]]<-round(tmp$M1_1[1,],4)
msmM1[[2]]<-round(tmp$M1_2[1,],4)
msmM1[[3]]<-round(tmp$M1_3[1,],4)

meanMortMat<-list(M2_1=M2_1,M2_2=M2_2,M2_3=M2_3)
Mort<-list(M2_Matrixyr=MortMat, meanM2_Matrix=meanMortMat,singlesppM1=M1,multisppM1=msmM1)

________________________________

Dr. Kirstin K. Holsman
Research Fishery Biologist
NOAA/NMFS
Alaska Fisheries Science Center
Rm 1103,  Building 4
7600 Sand Point Way N.E.
Seattle, Washington 98115
kirstin.holsman@noaa.gov
office: (206) 526-4691
________________________________


On Mon, Nov 4, 2019 at 4:30 PM Jim Ianelli - NOAA Federal <jim.ianelli@noaa.gov> wrote:
  so I took an M matrix out of the rdata file (attached). The original didn't converge (think magnitude at 1-yr olds was off) so did 
a run where I set age-1 M to 85% of what I got from CEATTLE.

Not sure I got the right matrix
The pattern over time and age seems a little odd
the model ran, and gave reasonable results as expected (v high recruits).
jim
1978	1.901	0.417	0.347	0.32	0.305	0.306	0.305	0.305	0.306	0.3	0.302	0.303	0.303	0.303	0.303
1979	2.086	0.413	0.343	0.319	0.305	0.305	0.305	0.304	0.306	0.3	0.302	0.303	0.303	0.303	0.303
1980	2.265	0.427	0.346	0.321	0.305	0.306	0.305	0.305	0.307	0.3	0.301	0.303	0.303	0.303	0.303
1981	2.436	0.463	0.359	0.326	0.307	0.308	0.307	0.306	0.309	0.3	0.301	0.305	0.305	0.305	0.305
1982	2.402	0.465	0.362	0.328	0.307	0.308	0.308	0.307	0.311	0.3	0.302	0.306	0.306	0.306	0.306
1983	2.708	0.493	0.375	0.336	0.309	0.31	0.312	0.308	0.317	0.3	0.302	0.308	0.308	0.308	0.308
1984	2.699	0.478	0.371	0.335	0.309	0.309	0.311	0.308	0.315	0.3	0.302	0.306	0.306	0.306	0.306
1985	2.781	0.485	0.374	0.335	0.31	0.31	0.31	0.309	0.313	0.3	0.304	0.305	0.305	0.305	0.305
1986	2.95	0.516	0.386	0.344	0.313	0.313	0.311	0.312	0.313	0.3	0.308	0.305	0.305	0.305	0.305
1987	2.847	0.528	0.391	0.342	0.312	0.312	0.311	0.312	0.313	0.3	0.306	0.307	0.307	0.307	0.307
1988	2.81	0.563	0.406	0.351	0.314	0.314	0.315	0.315	0.319	0.3	0.306	0.309	0.309	0.309	0.309
1989	2.405	0.493	0.379	0.338	0.311	0.311	0.311	0.311	0.315	0.3	0.303	0.306	0.306	0.306	0.306
1990	2.434	0.463	0.366	0.33	0.308	0.309	0.309	0.309	0.312	0.3	0.303	0.305	0.305	0.305	0.305
1991	2.466	0.44	0.354	0.326	0.307	0.307	0.307	0.307	0.311	0.3	0.303	0.304	0.304	0.304	0.304
1992	2.45	0.427	0.348	0.321	0.306	0.306	0.305	0.305	0.307	0.3	0.302	0.303	0.303	0.303	0.303
1993	2.656	0.448	0.354	0.324	0.306	0.307	0.306	0.306	0.308	0.3	0.302	0.304	0.304	0.304	0.304
1994	2.72	0.469	0.362	0.327	0.307	0.308	0.307	0.306	0.31	0.3	0.302	0.305	0.305	0.305	0.305
1995	2.555	0.469	0.364	0.328	0.307	0.308	0.308	0.306	0.311	0.3	0.302	0.306	0.306	0.306	0.306
1996	2.411	0.462	0.362	0.328	0.307	0.308	0.308	0.306	0.311	0.3	0.301	0.305	0.305	0.305	0.305
1997	2.651	0.481	0.37	0.332	0.308	0.309	0.309	0.308	
...

[Message clipped]  View entire message
Attachments area
kkkkkkkkkkkkkkk