Extension { #name : #LGitRepository }

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> clone: out url: url local_path: local_path options: options [
	
	^ self
		ffiCall:
			#(LGitReturnCodeEnum git_clone (LGitRepository *out, String url, String local_path, #void *options))
		options: #(optCoerceNilToNull)
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> primClone: out url: url local_path: local_path options: options [
	
	^ self
		ffiCall:
			#(LGitReturnCodeEnum git_clone (LGitRepository *out, String url, String local_path, #void *options))
		options: #(optCoerceNilToNull)
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> primRepository_init: out path: path is_bare: is_bare [
	
	^ self
		ffiCall:
			#(int git_repository_init #(LGitRepository * out , String path , Boolean is_bare))
		options: #()
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> primRepository_open: out bare_path: bare_path [
	
	^ self
		ffiCall:
			#(LGitReturnCodeEnum git_repository_open #(LGitRepository * out , String bare_path))
		options: #()
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> primRepository_open_ext: out path: path flags: flags ceiling_dirs: ceiling_dirs [
	
	^ self
		ffiCall:
			#(LGitReturnCodeEnum git_repository_open_ext #(LGitRepository * out , String path , LGitOpenFlagEnum flags , String ceiling_dirs))
		options: #(optCoerceNilToNull optStringOrNull)
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> primRepository_set_head: refname log_message: log_message [
	
	^ self
		ffiCallSafely:
			#(int git_repository_set_head #(self , String refname , String log_message))
		options: #()
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> repository_init: out path: path is_bare: is_bare [

	^ self primRepository_init: out path: path ffiString is_bare: is_bare
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> repository_open: out bare_path: bare_path [
	
	^ self
		ffiCall:
			#(LGitReturnCodeEnum git_repository_open #(LGitRepository * out , String bare_path))
		options: #()
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> repository_open_ext: out path: path flags: flags ceiling_dirs: ceiling_dirs [

	^ self
		  primRepository_open_ext: out
		  path: path ffiString
		  flags: flags
		  ceiling_dirs: ceiling_dirs ffiString
]

{ #category : #'*Pharo9UTF8Path-Core' }
LGitRepository >> repository_set_head: refname log_message: log_message [
	
	^ self primRepository_set_head: refname ffiString log_message: log_message ffiString
]
