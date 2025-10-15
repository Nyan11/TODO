Class {
	#name : 'GCVersion',
	#superclass : 'Object',
	#instVars : [
		'major',
		'minor',
		'patch'
	],
	#category : 'GreenCat',
	#package : 'GreenCat'
}

{ #category : 'instance creation' }
GCVersion class >> major: aNumber1 minor: aNumber2 patch: aNumber3 [

	^ self new major: aNumber1; minor: aNumber2; patch: aNumber3; yourself
]

{ #category : 'comparing' }
GCVersion >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ major = anObject major and: [
		  minor = anObject minor and: [ patch = anObject patch ] ]
]

{ #category : 'comparing' }
GCVersion >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ major hash bitXor: (minor hash bitXor: patch hash)
]

{ #category : 'accessing' }
GCVersion >> major [

	^ major
]

{ #category : 'accessing' }
GCVersion >> major: anObject [

	major := anObject
]

{ #category : 'accessing' }
GCVersion >> minor [

	^ minor
]

{ #category : 'accessing' }
GCVersion >> minor: anObject [

	minor := anObject
]

{ #category : 'accessing' }
GCVersion >> patch [

	^ patch
]

{ #category : 'accessing' }
GCVersion >> patch: anObject [

	patch := anObject
]
