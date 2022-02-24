Extension { #name : #OSSDL2Driver }

{ #category : #'*Pharo9UTF8Path-Core' }
OSSDL2Driver >> createWindowWithAttributes: attributes osWindow: osWindow [
	| flags handle aBackendWindow glAttributes x y |
	
	flags := attributes visible ifTrue: [ SDL_WINDOW_SHOWN ] ifFalse: [ SDL_WINDOW_HIDDEN ].
	attributes fullscreen ifTrue: [ flags := flags | SDL_WINDOW_FULLSCREEN_DESKTOP ].
	attributes borderless ifTrue: [ flags := flags | SDL_WINDOW_BORDERLESS ].
	flags := flags | SDL_WINDOW_ALLOW_HIGHDPI.
	
	" Set the OpenGL attributes."
	glAttributes := attributes glAttributes.
	glAttributes ifNotNil: [ 
		flags := flags | SDL_WINDOW_OPENGL.
		self setGLAttributes: glAttributes ].
	
	"Get the actual initial position value."
	x := attributes x.
	y := attributes y.
	attributes windowCentered ifTrue: [
		x := SDL_WINDOWPOS_CENTERED.
		y := SDL_WINDOWPOS_CENTERED ].

	"Extra creation flags"
	attributes resizable ifTrue: [ 
		flags := flags | SDL_WINDOW_RESIZABLE ].

	attributes maximized ifTrue: [ 
		flags := flags | SDL_WINDOW_MAXIMIZED ].
	
	attributes minimized ifTrue: [ 
		flags := flags | SDL_WINDOW_MINIMIZED ].

	"Create the window"
	WindowMapMutex critical: [ 
		handle := SDL2 createWindow: attributes title ffiString
			x: x
			y: y
			width: attributes width 
			height: attributes height 
			flags: flags.
		
		aBackendWindow := OSSDL2BackendWindow newWithHandle: handle attributes: attributes.
		aBackendWindow osWindow: osWindow.
		self registerWindow: aBackendWindow.
		
		"The OSWindow handle has to be set inside of this critical section to avoid losing some events such as expose."
		osWindow setJustCreatedHandle: aBackendWindow.
	].
	^ aBackendWindow
]
