Class {
	#name : #NeaRainUrl,
	#superclass : #Object,
	#instVars : [
		'date',
		'time',
		'depth'
	],
	#category : #'Weather-NeaRain'
}

{ #category : #acccessing }
NeaRainUrl >> date [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ date.
]

{ #category : #acccessing }
NeaRainUrl >> date: aDate [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	date:=aDate.
]

{ #category : #'as yet unclassified' }
NeaRainUrl >> formRainUrl: aDateTime [
	"Return the url given a date time string"
			
	| baseUrl |
	baseUrl := 'https://www.nea.gov.sg/docs/default-source/rain-area/dpsri_70km_', aDateTime ,'0000dBR.dpsri.png'.
	
	^ baseUrl.
]

{ #category : #time }
NeaRainUrl >> formStringDate: aDate hours: hours minutes: minutes [
	"Form a date string with hours and minutes"	
			
	| dString tString |
	dString := (aDate yyyymmdd) copyReplaceAll:'-' with:''.
	tString := (hours asString),(minutes asString).
	^ dString,tString
]

{ #category : #acccessing }
NeaRainUrl >> getRainUrl [
	"Get a VALID Nea Rain picture, it will iterate 3 times decreasing the time by 5 minutes to check if the url is valid"
	"scope: class-variables  &  instance-variables"	
			
	| httpClient min5 dateTimeString |
	httpClient := ZnClient new.
	0 to: depth do:[ :x |
		min5 := self nearest5minutes: time minus: (x * 5).
		dateTimeString := self formStringDate: date hours: min5 hours minutes: min5 minutes. 
		httpClient url: (self formRainUrl: dateTimeString).
		httpClient head.
		"Transcript show: (self formRainUrl: dateTimeString);cr."
		
		httpClient isSuccess ifTrue:[^ self formRainUrl: dateTimeString].
		].
	^ ''.
	
]

{ #category : #initialization }
NeaRainUrl >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	depth := 5.
	time := Time now.
	date := DateAndTime now asDate.
]

{ #category : #time }
NeaRainUrl >> nearest5floor: aNumber [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| min |
	min := (Time now) minutes.
	^ aNumber - (aNumber % 5).
]

{ #category : #time }
NeaRainUrl >> nearest5min [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| min |
	min := (Time now) minutes.
	^ self nearest5floor: min.
]

{ #category : #time }
NeaRainUrl >> nearest5minutes: aTime  minus: delta [
	"Get the nearest time to 5 min acurracy minus the delta"
	"e.g time is 01 and minus is 5 so we will take 1-5 which is 56 minute then the nearest 5 would be 55"	
			
	| result deltaTime min |
	deltaTime := Time hour: 0 minute: delta second: 0. 
	result := aTime subtractTime: deltaTime.
	min := self nearest5floor: (result minutes).
	^ Time hour: result hour24  minute: min second: 0.
]

{ #category : #acccessing }
NeaRainUrl >> time [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ time.
]

{ #category : #acccessing }
NeaRainUrl >> time: aTime [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	time := aTime.
]
