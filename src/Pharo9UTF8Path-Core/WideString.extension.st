Extension { #name : #WideString }

{ #category : #'*Pharo9UTF8Path-Core' }
WideString >> ffiString [

	^ (self encodeWith: 'utf-8') asString
]

{ #category : #'*Pharo9UTF8Path-Core' }
WideString >> tfPointerAddress [

	^ self ffiString tfPointerAddress
]
