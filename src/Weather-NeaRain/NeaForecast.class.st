Class {
	#name : #NeaForecast,
	#superclass : #Object,
	#category : #'Weather-NeaRain'
}

{ #category : #'as yet unclassified' }
NeaForecast >> get2HRWeatherDate: aDate [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| client |
	client := ZnClient new.
	client url: self hr2Url.
	client queryAt: 'date' put: aDate yyyymmdd.
	^ NeoJSONReader fromString: client get.
]

{ #category : #'as yet unclassified' }
NeaForecast >> hr2Url [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ 'https://api.data.gov.sg/v1/environment/2-hour-weather-forecast'.
]

{ #category : #initialization }
NeaForecast >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			

]
