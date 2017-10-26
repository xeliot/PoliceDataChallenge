#set to path of csv file of police incident response
Seattle911Response <- read.csv("~/Downloads/Seattle_Police_Department_911_Incident_Response.csv")


#removing columns
Seattle911Response[, "Event.Clearance.Code"]<-NULL
Seattle911Response[, "General.Offense.Number"]<-NULL
Seattle911Response[, "CAD.Event.Number"]<- NULL
Seattle911Response[, "CAD.CDW.ID"]<- NULL
Seattle911Response[, "Hundred.Block.Location"]<- NULL
Seattle911Response[, "Incident.Location"]<- NULL
Seattle911Response[, "Initial.Type.Description"]<- NULL
Seattle911Response[, "Initial.Type.Subgroup"]<- NULL
Seattle911Response[, "Initial.Type.Group"]<- NULL
Seattle911Response[, "Census.Tract"]<- NULL
Seattle911Response[, "At.Scene.Time"]<- NULL
Seattle911Response[, "Dsitrict.Sector"]<- NULL
Seattle911Response[, "Event.Clearance.Description"]<- NULL
Seattle911Response[, "District"]<- NULL

colnames(Seattle911Response) <- c("Event.Clearance.SubGroup", "Event.Clearance.Group", "Event.Clearance.Date", "District", "Zone", "Long", "Lat")

#removing 2010-2014
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2009")
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2010")
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2011")
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2012")
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2013")
Seattle911Response <- subset(Seattle911Response, substr(Event.Clearance.Date, 7, 10)!="2014")

#removing event clearance group categories
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="ANIMAL COMPLAINTS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="TRAFFIC RELATED CALLS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="DISTURBANCES")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="FAILURE TO REGISTER (SEX OFFENDER)")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="FALSE ALACAD")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="FALSE ALARM")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="HAZARDS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="LEWD CONDUCT")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="LIQUOR VIOLATIONS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="MISCELLANEOUS MISDEMEANORS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="MOTOR VEHICLE COLLISION INVESTIGATION")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="NARCOTICS COMPLAINTS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="NUISANCE, MISCHIEF")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="NULL")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="OTHER PROPERTY")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="OTHER VICE")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="PROSTITUTION")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="PUBLIC GATHERINGS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="RECKLESS BURNING")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="SUSPICIOUS CIRCUMSTANCES")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="THREATS, HARASSMENT")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="TRESPASS")
Seattle911Response <- subset(Seattle911Response, Event.Clearance.Group!="VICE CALLS")

#Split Date and Time
Seattle911Response$Time <- c(substr(Seattle911Response$Event.Clearance.Date, 12, 22))
Seattle911Response$Date <- c(substr(Seattle911Response$Event.Clearance.Date, 1, 10))
Seattle911Response$Event.Clearance.Date <- NULL

## Split month day year cols
Seattle911Response$Month <- c(substr(Sseattle911Response$Date, 1, 2))
Seattle911Response$Day <- c(substr(Seattle911Response$Date, 4, 5))
Seattle911Response$Year <- c(substr(Seattle911Response$Date, 7, 10))
Seattle911Response$Date <- NULL

#Convert time to Military
df2=structure(Seattle911Response$Time, .Dim = c(174173L, 1L))
Seattle911Response$Time <- paste(substr(strptime(df2, "%I:%M:%S %p"), 12, 13), substr(strptime(df2, "%I:%M:%S"), 15, 16), sep="")
