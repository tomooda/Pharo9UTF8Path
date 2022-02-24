Extension { #name : #OSSDL2BackendWindow }

{ #category : #'*Pharo9UTF8Path-Core' }
OSSDL2BackendWindow >> title: aTitle [

	sdl2Window title: aTitle ffiString
]
