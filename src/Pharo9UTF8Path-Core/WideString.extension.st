Extension { #name : #WideString }

{ #category : #'*Pharo9UTF8Path-Core' }
WideString >> ffiString [

	^ (self encodeWith: OSEnvironment current defaultEncoding) asString
]

{ #category : #'*Pharo9UTF8Path-Core' }
WideString >> tfPointerAddress [

	^ self ffiString tfPointerAddress
]
