Class {
	#name : #NeaArea,
	#superclass : #Object,
	#instVars : [
		'name',
		'latLon'
	],
	#category : #'Weather-NeaRain'
}

{ #category : #accessing }
NeaArea >> data: aDict [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| label_location |
	name := aDict at: 'name'.
	latLon := LatLong new.
	label_location:=aDict at: 'label_location'. 
	latLon lat: (label_location at:'latitude') lon: (label_location at:'longitude').
	
]

{ #category : #accessing }
NeaArea >> latLon [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ latLon.
]
