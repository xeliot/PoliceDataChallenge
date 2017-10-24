import csv
import matplotlib.pyplot as plt
import numpy

#Set options
dz = 2 #2 for district, 3 for zone
crimeType = "SHOPLIFTING" #pick any, type in all caps, exactly as in data

crimeDict = {}

#searching through data
with open("Seattle911ResponseCorrected.csv", newline = "") as csvfile: 
    reader = csv.reader(csvfile,delimiter=",", quotechar = "|")
    for row in reader:
        if row[1] == crimeType:
            if row[dz] not in crimeDict:
                crimeDict[str(row[dz])] = 1
            else:
                crimeDict[str(row[dz])] += 1

#Raw results
print(crimeDict)

#Graphing
areas = crimeDict.keys()
data = crimeDict.values()
ypos = numpy.arange(len(areas))

plt.bar(ypos, data, align="center", alpha = 0.5)
plt.xticks(ypos, areas)
if dz == 2:
    plt.xlabel("District")
if dz == 3:
    plt.xlabel("Zone")
plt.ylabel("Frequency")
plt.title(crimeType + " by location in Seattle")
plt.show()
