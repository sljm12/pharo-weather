Class {
	#name : #NeaRainUrlTest,
	#superclass : #TestCase,
	#category : #'Weather-Tests'
}

{ #category : #tests }
NeaRainUrlTest >> testNearest5Floor [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| nea v |
	nea := NeaRainUrl new.
	v := nea nearest5floor: 59.
	self assert: v equals: 55.
	
	v := nea nearest5floor: 1.
	self assert: v equals: 0.

	v := nea nearest5floor: 5.
	self assert: v equals: 5.	
]

{ #category : #tests }
NeaRainUrlTest >> testNearest5minutesMinus [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| nea r time |
	nea := NeaRainUrl new.
	time := Time hour: 10 minute: 1 second: 0.
	r := nea nearest5minutes: time minus: 0. 
	self assert: r minute equals: 0.
	
	time := Time hour: 10 minute: 1 second: 0.
	r := nea nearest5minutes: time minus: 5. 
	self assert: r minute equals: 55.
	self assert: r hour24 equals: 9.
]
