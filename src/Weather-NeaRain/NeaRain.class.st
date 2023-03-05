Class {
	#name : #NeaRain,
	#superclass : #Object,
	#category : #'Weather-NeaRain'
}

{ #category : #'as yet unclassified' }
NeaRain >> currentDateTimeString [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| date dateStr timeStr |
	date :=(DateAndTime now) asDate.
	dateStr := (date yyyymmdd) copyReplaceAll:'-' with:''.
	timeStr := (Time now) hhmm24.
	^ dateStr,timeStr.
]

{ #category : #'as yet unclassified' }
NeaRain >> findRainUrl [
			
	| date time |
	date := (DateAndTime now) asDate.
	time := (Time now).
	^ self testRainUrlDate: date time: time. 
]

{ #category : #'as yet unclassified' }
NeaRain >> formStringDate: aDate hours: hours minutes: minutes [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| dString tString |
	dString := (aDate yyyymmdd) copyReplaceAll:'-' with:''.
	tString := (hours asString),(minutes asString).
	^ dString,tString
]

{ #category : #'as yet unclassified' }
NeaRain >> getRainPic [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| url  rain base b32  neaurl |
	neaurl := NeaRainUrl new.
	neaurl date: (DateAndTime now) asDate.
	neaurl time: Time now.
	url := neaurl getRainUrl.
	rain := ZnEasy getPng: url.
	base := ZnEasy getPng: 'https://www.nea.gov.sg/assets/images/map/base-853.png'.
	rain := rain scaledToSize: (base extent).
	
	b32 := Form extent: base extent depth: 32.
	b32 := b32 mergeWith: base.	
	^ b32 mergeWith: rain.
	
]
