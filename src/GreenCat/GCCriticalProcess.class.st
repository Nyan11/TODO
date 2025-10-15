Class {
	#name : 'GCCriticalProcess',
	#superclass : 'Object',
	#instVars : [
		'inputElement',
		'outputElement',
		'transformation'
	],
	#category : 'GreenCat',
	#package : 'GreenCat'
}

{ #category : 'initialization' }
GCCriticalProcess >> initialize [

	super initialize.
	inputElement := GCElementWithVersion newWithDefaultVersion.
	outputElement := GCElementWithVersion newWithDefaultVersion.
]

{ #category : 'accessing' }
GCCriticalProcess >> inputElement [

	^ inputElement
]

{ #category : 'accessing' }
GCCriticalProcess >> inputElement: anObject [

	inputElement := anObject
]

{ #category : 'accessing' }
GCCriticalProcess >> outputElement [

	^ outputElement
]

{ #category : 'accessing' }
GCCriticalProcess >> outputElement: anObject [

	outputElement := anObject
]

{ #category : 'enumerating' }
GCCriticalProcess >> transformDo: aBlock [

	self transformation: aBlock.
	aBlock value: self inputElement value: self outputElement
]

{ #category : 'accessing' }
GCCriticalProcess >> transformation [

	^ transformation
]

{ #category : 'accessing' }
GCCriticalProcess >> transformation: anObject [

	transformation := anObject
]
