Class {
	#name : 'GCCriticalProcessTest',
	#superclass : 'TestCase',
	#instVars : [
		'file'
	],
	#category : 'GreenCat-Test',
	#package : 'GreenCat-Test'
}

{ #category : 'accessing' }
GCCriticalProcessTest >> file [
	^ file
]

{ #category : 'running' }
GCCriticalProcessTest >> fileContents [

	^ 
'The system should create a file for the tests.
The system should delete the file for the test.'
]

{ #category : 'running' }
GCCriticalProcessTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	file := 'GCTest.txt' asFileReference.
	file ensureCreateFile.
	file writeStreamDo: [ :stream | stream << self fileContents ].
]

{ #category : 'running' }
GCCriticalProcessTest >> tearDown [ 

	super tearDown.
	file ifNotNil: [ file ensureDelete ]
]

{ #category : 'tests' }
GCCriticalProcessTest >> testFileHasAVersion [

	| gcElement |
	gcElement := self file asGCElement.
	self assert: gcElement element equals: file.
	self assert: gcElement version equals: GCElementWithVersion defaultVersion.
	
	
]

{ #category : 'tests' }
GCCriticalProcessTest >> testTransformFileToRequirement1 [

	| gcFileElement gcProcess |
	gcFileElement := self file asGCElement.
	gcProcess := GCCriticalProcess new
		             inputElement: gcFileElement;
		             transformDo: [ :source :destination |
			             destination relatedElements:
					             (source element contents lines collect: #asGCElement) ];
		             yourself.
	self assert: gcProcess outputElement isNotNil.
	self assert: (gcProcess outputElement isKindOf: GCElementWithVersion).
	self assert: gcProcess outputElement relatedElements size equals: 2.
	self assert:
		(gcProcess outputElement relatedElements allSatisfy: [ :each |
			 each isKindOf: GCElementWithVersion ])
]

{ #category : 'tests' }
GCCriticalProcessTest >> testTransformFileToRequirement2 [

	| gcFileElement gcProcess |
	gcFileElement := self file asGCElement.
	gcProcess := GCCriticalProcess new
		             inputElement: gcFileElement;
		             transformDo: [ :source :destination |
			             destination relatedElements: source element contents lines ];
		             yourself.
	self assert: gcProcess outputElement isNotNil.
	self assert: (gcProcess outputElement isKindOf: GCElementWithVersion).
	self assert: gcProcess outputElement relatedElements size equals: 2.
	self assert:
		(gcProcess outputElement relatedElements allSatisfy: [ :each |
			 each isKindOf: GCElementWithVersion ])
]

{ #category : 'tests' }
GCCriticalProcessTest >> testTransformFileToRequirement3 [

	| gcFileElement gcProcess outputParent outputChild1 outputChild2 |
	self skip.
	gcFileElement := self file asGCElement.
	gcProcess := GCCriticalProcess new
		             inputElement: gcFileElement;
		             transformDo: [ :source :destination |
			             destination relatedElements:
					             source element contents lines ];
		             yourself.
	outputParent := gcProcess outputElement.
	outputChild1 := gcProcess outputElement relatedElements first.
	outputChild2 := gcProcess outputElement relatedElements second.

	"C'est pas bon car un élément peut avoir plusieurs parents."

	self assert: gcFileElement sourceElement equals: nil.
	self assert: outputParent sourceElement equals: gcFileElement.
	self assert: outputChild1 sourceElement equals: gcFileElement.
	self assert: outputChild2 sourceElement equals: gcFileElement.

	self assert: (gcFileElement directDestinationElements includesAll: {
				 outputParent.
				 outputChild1.
				 outputChild2 })
]
