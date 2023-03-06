Class {
	#name : #NeaData,
	#superclass : #Object,
	#instVars : [
		'hr2'
	],
	#category : #'Weather-NeaRain'
}

{ #category : #'as yet unclassified' }
NeaData >> get2HRWeatherDate: aDate [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| client |
	client := ZnClient new.
	client url: self hr2Url.
	client queryAt: 'date' put: aDate yyyymmdd.
	^ client get.
]

{ #category : #'as yet unclassified' }
NeaData >> hr2Url [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ 'https://api.data.gov.sg/v1/environment/2-hour-weather-forecast'.
]

{ #category : #initialization }
NeaData >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	hr2:= 'https://api.data.gov.sg/environment/2-hour-weather-forecast'.
]
