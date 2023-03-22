Class {
	#name : #NeaForecastDataTest,
	#superclass : #TestCase,
	#category : #'Weather-Tests'
}

{ #category : #tests }
NeaForecastDataTest >> testHasData [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	
	"Check if the data has not been initialized"		
	self assert: NeaForecastData new hasData equals: false.
]

{ #category : #tests }
NeaForecastDataTest >> testNilCollection [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	| data r |		
	data := NeaForecastData new.
	r:=data closest: (LatLong new lat: 1 lon: 103).
]
