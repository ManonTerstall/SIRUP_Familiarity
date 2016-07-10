import csv
import sys
import json
import urllib

pidRec = []
doubles = 0
with open('path to csv file with pids','rU') as csvfile:
	readers = csv.reader(csvfile, delimiter =',', quotechar ='|')
	for row in readers:
		if len(row) > 0:
			if not row[0] in pidRec:
				pidRec.append(row[0])
			else:
				doubles += 1

print "total doubles ", doubles


def extractData(pid):
	genre = []
	format = []
	synopsis = []

	url = "http://www.bbc.co.uk/programmes/"+pid+".json" #make URL with pid in it
	response = urllib.urlopen(url); #open the URL
	dataPROGRAM = json.loads(response.read()) #extract all data in the JSON file and put in variable

	title = dataPROGRAM['programme']['display_title']['title'] #extract title
	
	#print "in extract ", title, pid
	try:
		if "Series" in title:
			title = dataPROGRAM['programme']['parent']['programme']['title']
	except Exception:
		pass
	subtitle = dataPROGRAM['programme']['title'] #extract subtitle
	
	synopsis.append(dataPROGRAM['programme']['short_synopsis'])

	#initialize variables for storage
	# lists used in case multiple options are available
	information = dataPROGRAM['programme']['categories']
	for i in information:
		if i['type'] == 'genre':
			if not i['title'] in genre: #only store each genre one time
				genre.append(i['title'])
		if i['type'] == 'format':
			if not i['title'] in format: #only store each format one time
				format.append(i['title'])

	#### find programmeType. In try statement cause not all programme have a type, which will cause an error

	imageURL = "http://ichef.bbci.co.uk/images/ic/640x360/"+dataPROGRAM['programme']['image']['pid']+".jpg"

	return 	title, subtitle, synopsis, genre, format, imageURL

f = open('path to json file', 'w')

#delete = ["News", "Weather", "Series"] # delete news and weather programs

genreSeen = []
counterGenre = 0

end = len(pidRec)
position = 0
f.write('{"program" : [')
counterPids = 0 
titleSeen = []
subtitleSeen = []

for r in pidRec:
	try:
		stop = "false"
		title, subtitle, synopsis, genre, format, imageURL = extractData(r)
		if not subtitle in subtitleSeen:
			if not title == "":
				titleSeen.append(title)
				subtitleSeen.append(subtitle)
				title = str(title.encode("utf-8"))
				subtitle = str(subtitle.encode("utf-8"))
				synopsis = str(synopsis[0].encode("utf-8"))

				if not (("BBC" in title and "News" in title) or "Weather" in title or title == ''):
					image = "http://www.bbc.co.uk/iplayer/images/episode/"+r+"_303_170.jpg"
					f.write('{"pid" : "' + r +'",')

					if position < end-1:
						f.write('"title" : ')
						f.write('"'+ title +'"')
						f.write(",")

						f.write('"subtitle" : ')
						f.write('"' + subtitle + '"')
						f.write(",")

					
						#synopsis short here
						f.write('"synopsis" : "' + synopsis +'"') 
						f.write(",")

						f.write('"genre" : [')
						ending = len(genre) - 1
						positie = 0
						for i in genre:
							if not i in genreSeen:
								genreSeen.append(i)
								counterGenre += 1
							i = str(i.encode("utf-8"))
							if positie < ending:
								f.write('"'+i+'", ')
							else: 
								f.write('"'+i+'"')
							positie += 1
						f.write("] ")
						f.write(",")


						f.write('"format" : [')
						ending = len(format) - 1
						positie = 0
						for i in format:
							i = str(i.encode("utf-8"))
							if positie < ending:
								f.write('"'+i+'", ')
							else: 
								f.write('"'+i+'"')
							positie += 1

						f.write("]")
						f.write(",")

						f.write('"imageTwo" : ')
						f.write('"' + imageURL + '"')
						f.write('},')
					else:
						f.write('"title" : ')
						f.write('"'+title+'"')
						f.write(",")

						f.write('"subtitle" : ')
						f.write('"'+subtitle+'"')
						f.write(",")

						#synopsis short here
						f.write('"synopsis" : "' + synopsis +'"') 
						f.write(",")

						f.write('"genre" : [')
						ending = len(genre) - 1
						positie = 0
						for i in genre:
							i = str(i.encode("utf-8"))
							if not i in genreSeen:
								genreSeen.append(i)
								counterGenre += 1
							if positie < ending:
								f.write('"'+i+'", ')
							else: 
								f.write('"'+i+'"')
							positie += 1
						f.write("] ")
						f.write(",")


						f.write('"format" : [')
						ending = len(format) - 1
						positie = 0
						for i in format:
							i = str(i.encode("utf-8"))
							if positie < ending:
								f.write('"'+i+'", ')
							else: 
								f.write('"'+i+'"')
							positie += 1

						f.write("]")
						f.write(",")

						f.write('"imageTwo" : ')
						f.write('"' + imageURL + '"')
						f.write('}')
					counterPids += 1
				else:
					print "overgeslagen is ", title, r
			
	except Exception:
		print " error on ", r
	position += 1

f.write("]}")




print "total pids ", counterPids


