#open data base
#select unique users that are in both userEnd and userStart
import urllib, json, csv, math, re, requests, numpy, datetime
import itertools
from itertools import izip
from operator import itemgetter, attrgetter, methodcaller
import numpy as np
from scipy import stats
from array import array
import MySQLdb


informationBoth = [] #sim value, serendipitous yes or no ##sim value, serendipitous yes or no, diversity genre, diversity format, diversity overall
informationOnyLike = []
informationOnyDislike = []
informationAllTogether = []

comedy = ["Satire","Sitcoms","Standup","Comedy","Character","Sketch"]
drama =["soap","Action", "action", "War & Disaster", "Medical","Soaps","Biographical","Historical","Drama","Relationships & Romance","Crime","Horror & Supernatural","Thriller","Action & Adventure","Musical","SciFi & Fantasy","Classic & Period", "Sci fi", "Sci Fi", "sci fi"]
entertainment =["reality","Entertainment & Comedy", "Entertainment","Variety Shows", "cookery"]
factual = ["Culture & the Media", "Crime & Justice","Homes & Gardens","Homes","Money","Consumer","Families & Relationships","History","Life Stories","Antiques","Food & Drink","Arts, Culture & the Media","Science & Nature","Politics","Cars & Motors","Travel","Science & Technology","Pets & Animals","Health & Wellbeing","Gardens","Disability","Factual","Arts","Opera","Nature & Environment"]
music =["Soul", "Easy Listening", "Soundtracks & Musicals","Jazz" ,"Classic Pop & Rock","Classical","Pop & Chart","Rock & Indie","Music"]
news =["News"]
religion = ["Religion & Ethics", "Religion"]
sport =["Golf","Triathlon", "Football" ,"World Cup","Rowing","Sport","Tennis","Rugby League","Formula One", "Motorsport", "Athletics"]
weather = ["Weather"]

#country statistics
amountEngland = 0
amountScotland = 0
amountWales = 0
amountNorthernIsland = 0

#education
amountNone = 0
amountHighSchool = 0
amountSome = 0
amountBach = 0
amountMast = 0
amountPhd = 0

#age
age = []

ageCatFem = [0,0,0,0,0,0]
ageCatMen = [0,0,0,0,0,0]

#gender
genderFemale = 0
genderMale = 0

linkeddata = []
metadata = []
both = []

allTogether = []

def checkAnswerSame(u):

	cursor.execute("""SELECT * FROM answerRecOne WHERE user_id = %s""", (u))
	x = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecTwo WHERE user_id = %s""", (u))
	y = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecThree WHERE user_id = %s""", (u))
	a = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecFour WHERE user_id = %s""", (u))
	b = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecFive WHERE user_id = %s""", (u))
	c = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecSix WHERE user_id = %s""", (u))
	d = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecSeven WHERE user_id = %s""", (u))
	e = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecEight WHERE user_id = %s""", (u))
	f = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecNine WHERE user_id = %s""", (u))
	g = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecTen WHERE user_id = %s""", (u))
	h = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecEleven WHERE user_id = %s""", (u))
	i = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecTwelve WHERE user_id = %s""", (u))
	j = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecThirteen WHERE user_id = %s""", (u))
	k = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecFourteen WHERE user_id = %s""", (u))
	l = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecFifteen WHERE user_id = %s""", (u))
	m = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecSixteen WHERE user_id = %s""", (u))
	n = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecSeventeen WHERE user_id = %s""", (u))
	o = cursor.fetchall();
	cursor.execute("""SELECT * FROM answerRecEighteen WHERE user_id = %s""", (u))
	p = cursor.fetchall();
	for rowa in a:
		for rowb in b:
			for rowc in c:
				for rowd in d:
					for rowe in e:
						for rowf in f:
							for rowg in g:
								for rowh in h:
									for rowi in i:
										for rowj in j:
											for rowk in k:
												for rowl in l:
													for rowm in m:
														for rown in n:
															for rowo in o:
																for rowp in p:
																	for rowx in x:
																		for rowy in y:
																			if rowa[3] == rowb[3] == rowc[3] == rowd[3] ==rowe[3] == rowf[3] ==rowg[3] == rowh[3] ==rowi[3] == rowj[3] ==rowk[3] == rowl[3] ==rowm[3] == rown[3] ==rowo[3] == rowp[3] == rowx[3] == rowy[3] :
																				return 'False'
																			else:
																				return 'True'


def getAnswer(rec, u):
	#print "rec", rec
	if rec == "answerRecOne":
		cursor.execute("""SELECT * FROM answerRecOne WHERE user_id = %s""", (u))
	if rec == "answerRecTwo":
		cursor.execute("""SELECT * FROM answerRecTwo WHERE user_id = %s""", (u))
	if rec == "answerRecThree":
		cursor.execute("""SELECT * FROM answerRecThree WHERE user_id = %s""", (u))
	if rec == "answerRecFour":
		cursor.execute("""SELECT * FROM answerRecFour WHERE user_id = %s""", (u))
	if rec == "answerRecFive":
		cursor.execute("""SELECT * FROM answerRecFive WHERE user_id = %s""", (u))
	if rec == "answerRecSix":
		cursor.execute("""SELECT * FROM answerRecSix WHERE user_id = %s""", (u))
	if rec == "answerRecSeven":
		cursor.execute("""SELECT * FROM answerRecSeven WHERE user_id = %s""", (u))
	if rec == "answerRecEight":
		cursor.execute("""SELECT * FROM answerRecEight WHERE user_id = %s""", (u))
	if rec == "answerRecNine":
		cursor.execute("""SELECT * FROM answerRecNine WHERE user_id = %s""", (u))
	if rec == "answerRecTen":
		cursor.execute("""SELECT * FROM answerRecTen WHERE user_id = %s""", (u))
	if rec == "answerRecEleven":
		cursor.execute("""SELECT * FROM answerRecEleven WHERE user_id = %s""", (u))
	if rec == "answerRecTwelve":
		cursor.execute("""SELECT * FROM answerRecTwelve WHERE user_id = %s""", (u))
	if rec == "answerRecThirteen":
		cursor.execute("""SELECT * FROM answerRecThirteen WHERE user_id = %s""", (u))
	if rec == "answerRecFourteen":
		cursor.execute("""SELECT * FROM answerRecFourteen WHERE user_id = %s""", (u))
	if rec == "answerRecFifteen":
		cursor.execute("""SELECT * FROM answerRecFifteen WHERE user_id = %s""", (u))
	if rec == "answerRecSixteen":
		cursor.execute("""SELECT * FROM answerRecSixteen WHERE user_id = %s""", (u))
	if rec == "answerRecSeventeen":
		cursor.execute("""SELECT * FROM answerRecSeventeen WHERE user_id = %s""", (u))
	if rec == "answerRecEighteen":
		cursor.execute("""SELECT * FROM answerRecEighteen WHERE user_id = %s""", (u))
	answerRecOne = cursor.fetchall();
	#print len(answerRecOne)
	#getInfo(answerRecOne)
	for row in answerRecOne:
		#print u, " data ", row[1]
		pleasantA = row[2]
		relevantA =row[3]
		unexpectedA = row[4]
		interestA = row[5]
		simLike = row[6] #when like -1 unknown
		simDislike = row[7] #when dislike -1, unknown
		sort = row[8] #ld, metadata or both
		know = row[9]
		like = row[10]

		if(simLike < 0):
			caseTwo = 'dislikeOnly'
		elif(simDislike < 0):
			caseTwo = 'likeOnly'
		else:
			caseTwo = 'both'
		#print caseTwo
	if len(answerRecOne) > 0:
		info = [caseTwo, sort, know, like, pleasantA, relevantA, unexpectedA, interestA, simLike, simDislike]
		return info, sort
	else:
		return 'Null', 'Null'

def writeMetadata(metadata):
	with open('path/metadata.csv', 'wb') as csvfile:
		writer = csv.writer(csvfile)
		for row in metadata:
			writer.writerow(row)


def writeLD(linkeddata):
	with open('path/ld.csv', 'wb') as csvfile:
		writer = csv.writer(csvfile)
		for row in linkeddata:
			writer.writerow(row)

def writeBoth(both):
	with open('path/both.csv', 'wb') as csvfile:
		writer = csv.writer(csvfile)
		for row in both:
			writer.writerow(row)

def writeAll(allTogether):
	with open('path/all.csv', 'wb') as csvfile:
		writer = csv.writer(csvfile)
		for row in allTogether:
			writer.writerow(row)

def checkFormat(formats):
	formatL = []
	for f in formats:
		if f not in formatL:
			formatL.append(f)
	return len(formatL)


def checkGenre(genres):
	genreL = []
	for g in genres:
		if g in comedy:
			if not 'comedy' in genreL:
				genreL.append("comedy")
		elif g in drama:
			if not 'drama' in genreL:
				genreL.append("drama")
		elif g in entertainment:
			if not 'entertainment' in genreL:
				genreL.append("entertainment")
		elif g in factual:
			if not 'factual' in genreL:
				genreL.append("factual")
		elif g in music:
			if not 'music' in genreL:
				genreL.append("music")
		elif g in news:
			if not 'news' in genreL:
				genreL.append("news")
		elif g in religion:
			if not 'religion' in genreL:
				genreL.append("religion")
		elif g in sport:
			if not 'sport' in genreL:
				genreL.append("sport")
		elif g in weather:
			if not 'weather' in genreL:
				genreL.append("weather")
		else:
			print "not in", g
	return len(genreL)


def putInfo(listOne, listTwo, timeSpent, rec, totalMeta, totalLD, totalBoth ):
	info, sort = getAnswer(rec, u)
	listThree = []
	listThree.append(info)

	add = list(itertools.chain(listOne, listThree, listTwo))
	add = list(itertools.chain(*add))
	if(len(add) == 16):
		if(not (sort == 'Null' or info == 'Null')):
			if(sort == 'linked data'):
				linkeddataProgram.append(add)
				totalLD = totalLD + 1
			elif(sort == 'both'):
				bothProgram.append(add)
				totalBoth = totalBoth + 1
			elif(sort == 'metadata'):
				metadataProgram.append(add)
				totalMeta = totalMeta + 1
			else:
				print 'sort selection', sort
			allTogetherPorgram.append(add)
	return totalMeta, totalLD, totalBoth 

# get user_ids userStart
# get user_ids userEnd
# result is all unique user_ids. CHECK IF NO DOUBLES IN THE END
connection = MySQLdb.connect(host = "host", user = "username", passwd = "password", db = "database")
cursor = connection.cursor()
cursor.execute("select distinct userEnd.user_id From userEnd INNER JOIN answerRecEighteen ON userEnd.user_id=answerRecEighteen.user_id")
dataStart = cursor.fetchall()

user =[]

print "without selection", len(dataStart)

for rowStart in dataStart:
	if rowStart[0] not in user:
		if checkAnswerSame(rowStart[0]) == 'True':

			user.append(rowStart[0])

timeSpent = []
times = []

print "amount of unique users", len(user)

count =0 
#user = user[1:2]
for u in user:
	cursor.execute("SELECT * FROM secondPageAnswer WHERE user_id = %s", u)
	answerSecond = cursor.fetchall();
	#print answerSecond

	listOne =[]
	listTwo =[]
	listThree=[]

	for row in answerSecond:
		gender = row[2]
		ageU = row[3]
		degree = row[4]
		country = row[5]
		genreLikeTwo = row[7].split(',')
		formateLikeTwo = row[8].split(',')

		genreLikeTwo = [x.strip(' ') for x in genreLikeTwo]
		formateLikeTwo = [x.strip(' ') for x in formateLikeTwo]

		age.append(ageU)
		if(gender == "Male"):
			genderMale += 1
			if(ageU < 20):
				ageCatMen[0] = ageCatMen[0] + 1
			elif(ageU < 30):
				ageCatMen[1] = ageCatMen[1] + 1
			elif(ageU < 40):
				ageCatMen[2] = ageCatMen[2] + 1
			elif(ageU < 50):
				ageCatMen[3] = ageCatMen[3] + 1
			elif(ageU < 60):
				ageCatMen[4] = ageCatMen[4] + 1
			else:
				ageCatMen[5] = ageCatMen[5] + 1
		elif(gender == "Female"):
			if(ageU < 20):
				ageCatFem[0] = ageCatFem[0] + 1
			elif(ageU < 30):
				ageCatFem[1] = ageCatFem[1] + 1
			elif(ageU < 40):
				ageCatFem[2] = ageCatFem[2] + 1
			elif(ageU < 50):
				ageCatFem[3] = ageCatFem[3] + 1
			elif(ageU < 60):
				ageCatFem[4] = ageCatFem[4] + 1
			else:
				ageCatFem[5] = ageCatFem[5] + 1
			genderFemale += 1

		if(degree == "None"):
			amountNone += 1
		elif(degree == "Some college"):
			amountSome += 1
		elif(degree == "High school graduate"):
			amountHighSchool += 1
		elif(degree == "Bachelor degree"):
			amountBach += 1	
		elif(degree == "Master degree"):
			amountMast += 1
		elif(degree == "Advanced graduate or Ph.D."):
			amountPhd += 1

		if(country == "England"):
			amountEngland += 1
		elif(country == "Scotland"):
			amountScotland += 1
		elif(country == "Wales"):
			amountWales += 1
		elif(country == "Northern Ireland"):
			amountNorthernIsland += 1
		else:
			print "country", country

		info = [gender, ageU, degree, country]

	end = 0
	start = 0
	cursor.execute("SELECT * FROM userEnd WHERE user_id = %s", u)
	answerEnd = cursor.fetchall();
	cursor.execute("SELECT * FROM usersStart WHERE user_id = %s", u)
	answerStart = cursor.fetchall();

	for row in answerEnd:
		end = row[1]
	for row in answerStart:
		start = row[1]

	if len(answerSecond) > 0:
		time = end - start
		time = time.total_seconds()
		times.append(time)
		listOne.append(info)
	else:
		print u
	#print "info", len(info)
	cursor.execute("SELECT * FROM firstPageAnswer WHERE user_id = %s", u)
	answerFirst = cursor.fetchall();
	for row in answerFirst:
		if(len(row[2]) > 0 and len(row[3]) > 0):
			case = "both"
		elif(len(row[2]) > 0):
			case = "likeOnly"
		elif(len(row[3])> 0):
			case = "dislikeOnly"

		genreUser = row[4].split(',')
		genreUser = [x.strip(' ') for x in genreUser]
		amountGenreLike = checkGenre(genreUser + genreLikeTwo)
		formatUser = row[5].split(',')
		formatUser = [x.strip(' ') for x in formatUser]
		amountFormatLike = checkFormat(formatUser + formateLikeTwo)

		info = [amountGenreLike, amountFormatLike]
		count = count + 1
	listTwo.append(info)

	linkeddataProgram = []
	bothProgram = []
	metadataProgram = []
	allTogetherPorgram = []

	totalMeta = 0
	totalLD = 0
	totalBoth = 0



	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecOne', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecTwo', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecThree', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecFour', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecFive', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecSix', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecSeven', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecEight', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecNine', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecTen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecEleven', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecTwelve', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecThirteen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecFourteen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecFifteen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecSixteen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecSeventeen', totalMeta, totalLD, totalBoth)
	totalMeta, totalLD, totalBoth = putInfo(listOne, listTwo, timeSpent, 'answerRecEighteen', totalMeta, totalLD, totalBoth)
	#print u, totalMeta, totalLD, totalBoth
	if len(allTogetherPorgram) == 18:
		for i in metadataProgram:
			metadata.append(i)
		for i in linkeddataProgram:
			linkeddata.append(i)
		for i in bothProgram:
			both.append(i)
		for i in allTogetherPorgram:
			allTogether.append(i)

	else:
		print u, len(metadataProgram), len(linkeddataProgram), len(bothProgram)

#print allTogether[0]
#print list(itertools.chain(*allTogether))

print "metadata: ", len(metadata)," linked data: ", len(linkeddata), " both: ", len(both), " all: ", len(allTogether)

writeMetadata(metadata)
writeLD(linkeddata)
writeBoth(both)
writeAll(allTogether)

print "STATISTICS!!"
print "England", amountEngland
print "Scotland", amountScotland
print "Wales", amountWales
print "Northern Ireland", amountNorthernIsland

#education
print "no education", amountNone
print "high school", amountHighSchool
print "some", amountSome
print "bachelor", amountBach
print "master", amountMast
print "phd", amountPhd

#print age

print "female", genderFemale
print "male", genderMale

print "lowest age", min(age)
print "higest age", max(age)
print "average age", sum(age)/float(len(age))
print "standard deviation age", numpy.std(age) 
print "len", len(age)

print "lowest time", min(times)
print "highest time", u, max(times,5)

#for i in times:
#	print i/60

print "len user", len(user)
print "END STATISTICS!!!"
print "user"
print ""
print user

print ageCatFem, " FEMALE"
print ageCatMen, "MEN"
