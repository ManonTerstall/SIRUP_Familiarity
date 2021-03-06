import urllib, json, csv, math, re, requests
from collections import Counter
from itertools import izip
from operator import itemgetter, attrgetter, methodcaller
import numpy as np
from scipy import stats
from array import array
import MySQLdb

def extractSimilar(pid):
	result = []
	r = requests.get('http://vistatv.eculture.labs.vu.nl/get_similar_programme?pid=' + pid)
	json_data = r.json()

	return json_data

def writeSim(pid1, pid2, cosine):
	conn = MySQLdb.connect(host= "host",
                  user="username",
                  passwd="password",
                  db="databse")

	x = conn.cursor()

	x.execute("""INSERT INTO `LDandMetadata recommendations` (Pid1,Pid2,Similarity) VALUES (%s,%s,%s)""", (pid1,pid2,cosine))
	conn.commit()

def extractData(pid):
	result = []
	url = "http://www.bbc.co.uk/programmes/"+pid+".json" #make URL with pid in it

	response = urllib.urlopen(url); #open the URL
	dataPROGRAM = json.loads(response.read()) #extract all data in the JSON file and put in variable
	performers = []
	contributors = []
	try:
		canonicalPROGRAM = dataPROGRAM['programme']['versions'][0]['pid'] #canonical, will be used for extra information
		url = "http://www.bbc.co.uk/programmes/"+canonicalPROGRAM+".json" #make URL of canonical pid
		response = urllib.urlopen(url); #open canonical URL

		dataCANONICAL = json.loads(response.read()) #save canonical data in variable

		try:
			performersInfo = dataCANONICAL['version']['segment_events']
			for p in performersInfo:
				performers.append(p['segment']['artist'].encode("utf-8"))
		except Exception:
			print "performers"
		contributorsInfo = dataCANONICAL['version']['contributors'] # no distinction between writer/author etc.
		
		for c in contributorsInfo:
			contributors.append(c['name'].encode("utf-8"))
	except Exception:
		pass


	title = dataPROGRAM['programme']['display_title']['title'] #extract title
	title = title.encode("utf-8")
	#result.append(title)
	subtitle = dataPROGRAM['programme']['title'] #extract subtitle
	subtitle = subtitle.encode("utf-8")
	#result.append(subtitle)
	
	#duration = dataPROGRAM['programme']['versions'][0]['duration']

	#initialize variables for storage
	# lists used in case multiple options are available
	information = dataPROGRAM['programme']['categories']
	genre = []
	format = []
	subject = []
	for i in information:
		if i['type'] == 'genre':
			if not i['title'].encode("utf-8") in genre: #only store each genre one time']
				genre.append(i['title'].encode("utf-8"))
		if i['type'] == 'format':
			if not i['title'] in format: #only store each format one time
				format.append(i['title'].encode("utf-8"))
		if i['type'] == 'subject':
			if not i['title'] in subject: #only store each subject one time
				subject.append(i['title'].encode("utf-8"))


	#### find programmeType. In try statement cause not all programme have a type, which will cause an error
	typeProgram = []
	try:
		typeProgram.append(dataPROGRAM['programme']['parent']['programme']['type'].encode("utf-8"))
	except Exception:
		pass

	try:
		service = dataPROGRAM['programme']['ownership']['service']['title']
	except Exception:
		service = dataPROGRAM['programme']['parent']['programme']['ownership']['service']['title']

	'''synopsisShort = dataPROGRAM['programme']['short_synopsis']
				synopsisMedium = dataPROGRAM['programme']['medium_synopsis']
				
				if len(synopsisMedium)>0:
					synopsis = synopsisMedium
				else:
					synopsis = synopsisShort'''

	return title, subtitle, genre, format, subject, typeProgram, performers, contributors, service


def calculateCosineMetadata(pid1, pid2):
	#print pid1, pid2
	#print "a", a
	#print "b", b

	a = []
	b = []
	position = 3
	while(position < 9):
		if(len(pid1[position]) > 0 and len(pid2[position])> 0):
			for i in pid1[position]:
				a.append(i)
			for i in pid2[position]:
				b.append(i)
		position += 1


	# reference: http://stackoverflow.com/questions/28819272/python-how-to-calculate-the-cosine-similarity-of-two-lists
	# count word occurrences
	a_vals = Counter(a)
	b_vals = Counter(b)
	#print a_vals
	#print b_vals

	# convert to word-vectors
	word = list(set(a_vals) | set(b_vals))
	a_vect = [a_vals.get(words, 0) for words in word]     
	b_vect = [b_vals.get(words, 0) for words in word]    

	# find cosine
	len_a  = math.sqrt(sum(av*av for av in a_vect))      
	len_b  = math.sqrt(sum(bv*bv for bv in b_vect))  
	#print len_a
	#print len_b     
	dot    = sum(av*bv for av,bv in zip(a_vect, b_vect))   
	#print dot
	if dot == 0 or (len_a * len_b) == 0:
		cosine = 0
		#print dot, len_a * len_b
	else:
		cosine = dot / (len_a * len_b)
	#print cosine                          
	return cosine

def calculateCosineLD(a, b):
	upper = 0
	lower_b = 0
	lower_a = 0

	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + a + '&position=1')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + b + '&position=1')
	json_data_b = r.json()

	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply

	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])


	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])


	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + a + '&position=1')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + b + '&position=1')
	json_data_b = r.json()
	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply


	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])

	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])

	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + a + '&position=2')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + b + '&position=2')
	json_data_b = r.json()

	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply

	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])


	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])


	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + a + '&position=2')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + b + '&position=2')
	json_data_b = r.json()
	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply


	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])

	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])

	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + a + '&position=3')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_properties_frequency_per_position?pid=' + b + '&position=3')
	json_data_b = r.json()

	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply

	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])


	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])


	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + a + '&position=3')
	json_data_a = r.json()
	r = requests.get('http://vistatv.eculture.labs.vu.nl/local_types_frequency_per_position?pid=' + b + '&position=3')
	json_data_b = r.json()
	for j in json_data_a:
		for i in json_data_b:
			if j['value'] == i['value']:
				multiply = (i['frequency'] * j['frequency'])
				upper += multiply


	for i in json_data_a:
		lower_a += (i['frequency']*i['frequency'])

	for i in json_data_b:
		lower_b += (i['frequency']*i['frequency'])
	
	lower = math.sqrt(lower_a) * math.sqrt(lower_b)
	if not upper == 0 or not lower == 0.0:
		cosine = upper/lower 
	else:
		cosine = 0  
	#print a, b, cosine                
	return cosine

pids = []

doubles = 0

with open('/Users/manonterstall/Google Drive/Online Evaluation/pidsDone.csv', 'rU') as g:
	readers = csv.reader(g, delimiter =',')
	for row in readers:
		pids.append(row[0])
		#print row

pid_one = []
pid_two = []

for i in pids:
	try:
		title, subtitle, genre, format, subject, typeProgram, performers, contributors, service = extractData(i)

		addInfo = [i, title, subtitle, genre, format, subject, typeProgram, performers, contributors]
		pid_one.append(addInfo)
		pid_two.append(addInfo)
	except Exception:
		print i

print 'total after selection', len(pid_one)

#print pid_one
#print pid_two
written = 0
for pid1 in pid_one:
	check = extractSimilar(pid1[0])
	#print "1", pid1[0]
	for pid2 in pid_two:
		#print "2", pid2[0]
		if not pid1[0] == pid2[0]:
			#print "hello"
			#print pid1[0], pid2[0]
			cosineMeta = calculateCosineMetadata(pid1,pid2)
			if pid2[0] in check:
				#print pid1[0], pid2[0]
				cosineLD = calculateCosineLD(pid1[0],pid2[0])
				#print cosine
			else:
				cosineLD = 0
			cosine = (cosineMeta+cosineLD)/2
			writeSim(pid1[0], pid2[0], cosine)
	pid_two.remove(pid1)
