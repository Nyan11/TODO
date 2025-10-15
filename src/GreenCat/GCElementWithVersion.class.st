Class {
	#name : 'GCElementWithVersion',
	#superclass : 'Object',
	#instVars : [
		'element',
		'version',
		'relatedElements'
	],
	#category : 'GreenCat',
	#package : 'GreenCat'
}

{ #category : 'default model values' }
GCElementWithVersion class >> defaultVersion [

	^ GCVersion major: 1 minor: 0 patch: 0
]

{ #category : 'instance creation' }
GCElementWithVersion class >> newWithDefaultVersion [

	^ self new version: self defaultVersion; yourself.

]

{ #category : 'converting' }
GCElementWithVersion >> asGCElement [

	^ self
]

{ #category : 'accessing' }
GCElementWithVersion >> element [

	^ element
]

{ #category : 'accessing' }
GCElementWithVersion >> element: anObject [

	element := anObject
]

{ #category : 'accessing' }
GCElementWithVersion >> relatedElements [

	^ relatedElements
]

{ #category : 'accessing' }
GCElementWithVersion >> relatedElements: aCollection [

	relatedElements := aCollection collect: #asGCElement 
]

{ #category : 'accessing' }
GCElementWithVersion >> version [

	^ version
]

{ #category : 'accessing' }
GCElementWithVersion >> version: anObject [

	version := anObject
]
