Class {
	#name : #LatLong,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'lat',
		'lon',
		'part4'
	],
	#category : #'Weather-NeaRain'
}

{ #category : #acccessing }
LatLong >> haversineDistance: aLatLong [
	"Get the distance between 2 Lat Lon based on the Haversine formulat"
  | R dLat dLon a c |
  R := 6371.0. "Earth's radius in kilometers"
  dLat := (self lat - aLatLong lat) degreesToRadians.
  dLon := (self lon - aLatLong lon) degreesToRadians.
  a :=  ((dLon / 2) sin squared) * ((aLatLong lat degreesToRadians) cos * (self lat degreesToRadians) cos) + ((dLat / 2) sin squared).
  c := 2 * a sqrt arcSin.
  ^ R * c.
 	 
]

{ #category : #acccessing }
LatLong >> lat [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ lat.
]

{ #category : #setter }
LatLong >> lat: aFloatLat lon: aFloatLon [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	lat := aFloatLat.
	lon := aFloatLon.
	
]

{ #category : #acccessing }
LatLong >> latRad [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ self lat degreesToRadians
]

{ #category : #acccessing }
LatLong >> lon [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ lon.
]

{ #category : #acccessing }
LatLong >> lonRad [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ self lon degreesToRadians.
]
