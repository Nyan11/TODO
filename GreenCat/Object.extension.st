Extension { #name : 'Object' }

{ #category : '*GreenCat' }
Object >> asGCElement [

	^ GCElementWithVersion newWithDefaultVersion
		  element: self;
		  yourself
]
