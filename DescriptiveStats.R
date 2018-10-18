
# # -----------
# Iraq Transport Corridors
# World Bank, DIME
# # -----------


#set the working directory to where the files are stored - !CHANGE THIS TO YOUR OWN DIRECTORY!
setwd("/Users/rbtrichler/Box Sync/iraqtransport_gie")

# Load in Iraq geoquery extract csv
iraqmerge<-read.csv("Data/road_grid_750_extracts.csv")

#change in viirs from 2012 to 2016
iraqmerge$viirschange = iraqmerge$viirs_ntl_monthly.201612.mean - iraqmerge$viirs_ntl_monthly.201212.mean
#create quartile for nigghtime lights in April 2012
quantile(iraqmerge$viirs_ntl_monthly.201204.mean, na.rm=TRUE)
iraqmerge$viirs_m0_cat <- as.integer(cut(iraqmerge$viirs_ntl_monthly.201211.mean, quantile(iraqmerge$viirs_ntl_monthly.201211.mean, na.rm = TRUE,probs=0:4/4), include.lowest = TRUE))


grp <- iraqmerge
aggregate(iraqmerge$viirs_ntl_monthly.201211.mean, by=list(iraqmerge$viirs_m0_cat), FUN=sd)
aggregate(iraqmerge$viirs_ntl_monthly.201612.mean, by=list(iraqmerge$viirs_m0_cat), FUN=sd)
aggregate(iraqmerge$viirschange, by=list(iraqmerge$viirs_m0_cat), FUN=median)

mg <- aggregate(df$dt, by=c(df$group), FUN=mean) 

