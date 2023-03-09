Class {
	#name : #NeaForecastData,
	#superclass : #Object,
	#instVars : [
		'jsonData'
	],
	#category : #'Weather-NeaRain'
}

{ #category : #'as yet unclassified' }
NeaForecastData >> apiInfo [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ jsonData at:'api_info'.
]

{ #category : #'as yet unclassified' }
NeaForecastData >> areaMetaData [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ jsonData at: 'area_metadata'.
]

{ #category : #'as yet unclassified' }
NeaForecastData >> closest: aLatLong [
	"comment stating purpose of instance-side message"
			
	| dist currentArea|
	currentArea := NeaArea new.
	currentArea data: (self areaMetaData at: 1).
	dist := currentArea latLon haversineDistance: aLatLong.
	
	self areaMetaData allButFirst do: [ :x |
		| tempArea tempDist | 
		tempArea := NeaArea new.
		tempArea data: x.
		tempDist := tempArea latLon haversineDistance: aLatLong.
		
		tempDist < dist ifTrue: [ 
			currentArea := tempArea.
			 ]
		].
	^ currentArea.
]

{ #category : #accessing }
NeaForecastData >> data: aNeoJsonObject [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	jsonData := aNeoJsonObject.
]

{ #category : #'as yet unclassified' }
NeaForecastData >> forecasts [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ (self items at: 2) at: 'forecasts'.
]

{ #category : #'as yet unclassified' }
NeaForecastData >> getForecastByAreaName: aString [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ self forecasts select: [ :x | (x at:'area') = aString. ].
]

{ #category : #accessing }
NeaForecastData >> items [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ jsonData at: 'items'.
]
