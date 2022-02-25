Extension { #name : #SDL2 }

{ #category : #'*Pharo9UTF8Path-Core' }
SDL2 class >> createWindow: title x: x y: y width: w height: h flags: flags [
	^ self ffiCall: #( SDL_Window SDL_CreateWindow ( String title, int x, int y, int w, int h, Uint32 flags ) )
]

{ #category : #'*Pharo9UTF8Path-Core' }
SDL2 class >> primCreateWindow: title x: x y: y width: w height: h flags: flags [
	^ self ffiCall: #( SDL_Window SDL_CreateWindow ( String title, int x, int y, int w, int h, Uint32 flags ) )
]
