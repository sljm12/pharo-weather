Class {
	#name : #NeaRainTest,
	#superclass : #TestCase,
	#category : #'Weather-Tests'
}

{ #category : #tests }
NeaRainTest >> testGetRainUrl [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| nea r |
	nea := NeaRain new.
	r := nea getRainUrl: '202302221300'.
	self assert: r equals: 'https://www.nea.gov.sg/docs/default-source/rain-area/dpsri_70km_2023022213000000dBR.dpsri.png'.
]
