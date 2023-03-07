Class {
	#name : #NeaRain,
	#superclass : #Object,
	#category : #'Weather-NeaRain'
}

{ #category : #acccessing }
NeaRain >> getRainPic [
	"Return Rain Picture as a Morph"
			
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
