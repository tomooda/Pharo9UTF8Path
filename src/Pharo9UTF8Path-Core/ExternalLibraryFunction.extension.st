Extension { #name : #ExternalLibraryFunction }

{ #category : #'*Pharo9UTF8Path-Core' }
ExternalLibraryFunction >> name: aName module: aModule flags: anInteger argTypes: argTypeArray [

	name := aName.
	module := aModule ffiString.
	flags := anInteger.
	argTypes := argTypeArray
]
