Class {
	#name : #HTMLScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_HTML'
}

{ #category : #'generated-initialization' }
HTMLScanner class >> initializeKeywordMap [

	keywordMap := Dictionary new.
	#( #( 14 'area' #( 15 #( #tag ) ) ) #( 14 'base' #( 15 #( #tag ) ) )
	   #( 14 'br' #( 15 #( #tag ) ) ) #( 14 'col' #( 15 #( #tag ) ) )
	   #( 14 'embed' #( 15 #( #tag ) ) )
	   #( 14 'hr' #( 15 #( #tag ) ) ) #( 14 'img' #( 15 #( #tag ) ) )
	   #( 14 'input' #( 15 #( #tag ) ) )
	   #( 14 'link' #( 15 #( #tag ) ) ) #( 14 'meta' #( 15 #( #tag ) ) )
	   #( 14 'param' #( 15 #( #tag ) ) )
	   #( 14 'source' #( 15 #( #tag ) ) )
	   #( 14 'track' #( 15 #( #tag ) ) )
	   #( 14 'wbr' #( 15 #( #tag ) ) ) ) do: [ :each |
		(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
			at: (each at: 2)
			put: each last ].
	^ keywordMap
]

{ #category : #generated }
HTMLScanner >> emptySymbolTokenId [

	^ 44
]

{ #category : #generated }
HTMLScanner >> errorTokenId [

	^ 45
]

{ #category : #generated }
HTMLScanner >> scan1 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan10 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: $0 and: $9) or: [
		(currentCharacter between: $A and: $Z) or: [
			currentCharacter between: $a and: $z ] ] ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan11 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan13 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [
		[
		self recordMatch: #( 6 10 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		(currentCharacter between: Character tab and: Character lf) or: [
			currentCharacter == Character cr or: [
				currentCharacter == Character space ] ] ] whileTrue ].
	^ self scan12
]

{ #category : #generated }
HTMLScanner >> scan12 [

	[
	self recordMatch: #( 10 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan13 [

	self recordMatch: #( 9 ).
	self step.
	currentCharacter == $! ifTrue: [ ^ self scan13X2 ].
	currentCharacter == $% ifTrue: [ ^ self scan25 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $? ifTrue: [ ^ self scan13X1 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan2 ].
						currentCharacter == $t ifTrue: [ ^ self scan36 ] ] ] ].
			^ self scan1 ].
		currentCharacter == $t ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $y ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $l ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $e ifTrue: [ ^ self scan39 ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan13X1 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $? ifTrue: [ ^ self scan30 ].
	currentCharacter == $x ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $? ifTrue: [ ^ self scan30 ].
		currentCharacter == $m ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $? ifTrue: [ ^ self scan30 ].
			currentCharacter == $l ifTrue: [ ^ self scan31 ] ] ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan13X2 [

	self step.
	currentCharacter == $- ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan17 ].
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $[ ifTrue: [ ^ self scan20 ].
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan14 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $> ifTrue: [ ^ self scan16 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan15 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan15 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 4 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $> ifTrue: [ ^ self scan16 ].
			^ self scan14 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan15 ].
			currentCharacter == $> ifTrue: [ ^ self scan16 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan15 ].
				currentCharacter == $> ifTrue: [ ^ self scan16 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan15 ].
					currentCharacter == $> ifTrue: [ ^ self scan16 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan15 ].
						currentCharacter == $> ifTrue: [ ^ self scan16 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan15 ].
							currentCharacter == $> ifTrue: [ ^ self scan16 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan15 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 4 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan15 ].
									currentCharacter == $> ifTrue: [ ^ self scan16 ] ] ] ] ] ] ] ].
		^ self scan14 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan16 ].
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan16 [

	[
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan15 ].
	currentCharacter == $> ] whileTrue.
	^ self scan14
]

{ #category : #generated }
HTMLScanner >> scan17 [

	[
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan18 [

	self step.
	currentCharacter == $- ifTrue: [
		[
		self step.
		currentCharacter == $- ] whileTrue.
		currentCharacter == $< ifTrue: [ ^ self scan19 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 1 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
		^ self scan17 ].
	currentCharacter == $< ifTrue: [ ^ self scan19 ].
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan19 [

	[
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan18 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan18 ].
		currentCharacter == $< ifTrue: [ ^ self scan19 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan18 ].
			currentCharacter == $< ifTrue: [ ^ self scan19 ].
			^ self scan17 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $- ifTrue: [ ^ self scan18 ].
			currentCharacter == $< ifTrue: [ ^ self scan19 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $- ifTrue: [ ^ self scan18 ].
				currentCharacter == $< ifTrue: [ ^ self scan19 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $- ifTrue: [ ^ self scan18 ].
					currentCharacter == $< ifTrue: [ ^ self scan19 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $- ifTrue: [ ^ self scan18 ].
						currentCharacter == $< ifTrue: [ ^ self scan19 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $- ifTrue: [ ^ self scan18 ].
							currentCharacter == $< ifTrue: [ ^ self scan19 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $- ifTrue: [ ^ self scan18 ].
								currentCharacter == $< ifTrue: [ ^ self scan19 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $- ifTrue: [ ^ self scan18 ].
									currentCharacter == $< ifTrue: [ ^ self scan19 ] ] ] ] ] ] ] ].
		^ self scan17 ].
	currentCharacter == $< ] whileTrue.
	^ self scan17
]

{ #category : #generated }
HTMLScanner >> scan2 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $< ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan20 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [ ^ self scan23 ].
	currentCharacter == $] ifTrue: [ ^ self scan24 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan21 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan22 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan23 ].
	currentCharacter == $] ifTrue: [ ^ self scan24 ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan22 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 4 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ ^ self scan23 ].
		currentCharacter == $] ifTrue: [ ^ self scan24 ].
		^ self scan20 ].
	currentCharacter == $] ifTrue: [ ^ self scan24 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ ^ self scan23 ].
		currentCharacter == $] ifTrue: [ ^ self scan24 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan21 ].
			currentCharacter == $> ifTrue: [ ^ self scan23 ].
			currentCharacter == $] ifTrue: [ ^ self scan24 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan21 ].
				currentCharacter == $> ifTrue: [ ^ self scan23 ].
				currentCharacter == $] ifTrue: [ ^ self scan24 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan21 ].
					currentCharacter == $> ifTrue: [ ^ self scan23 ].
					currentCharacter == $] ifTrue: [ ^ self scan24 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan21 ].
						currentCharacter == $> ifTrue: [ ^ self scan23 ].
						currentCharacter == $] ifTrue: [ ^ self scan24 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan21 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 4 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan21 ].
								currentCharacter == $> ifTrue: [ ^ self scan23 ] ].
							currentCharacter == $] ifTrue: [ ^ self scan24 ] ] ] ] ] ] ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan23 [

	[
	self recordMatch: #( 4 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $] ifTrue: [ ^ self scan24 ].
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan24 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan21 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 2 4 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan21 ].
		currentCharacter == $> ifTrue: [ ^ self scan23 ].
		currentCharacter == $] ifTrue: [ ^ self scan24 ].
		^ self scan20 ].
	currentCharacter == $] ] whileTrue.
	^ self scan20
]

{ #category : #generated }
HTMLScanner >> scan25 [

	[
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan26 ].
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan26 [

	[
	self step.
	currentCharacter == $% ] whileTrue.
	currentCharacter == $< ifTrue: [ ^ self scan27 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan26 ].
		currentCharacter == $< ifTrue: [ ^ self scan27 ] ].
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan27 [

	[
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan26 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $% ifTrue: [ ^ self scan26 ].
		currentCharacter == $< ifTrue: [ ^ self scan27 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan26 ].
			currentCharacter == $< ifTrue: [ ^ self scan27 ].
			^ self scan25 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $% ifTrue: [ ^ self scan26 ].
			currentCharacter == $< ifTrue: [ ^ self scan27 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $% ifTrue: [ ^ self scan26 ].
				currentCharacter == $< ifTrue: [ ^ self scan27 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $% ifTrue: [ ^ self scan26 ].
					currentCharacter == $< ifTrue: [ ^ self scan27 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $% ifTrue: [ ^ self scan26 ].
						currentCharacter == $< ifTrue: [ ^ self scan27 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $% ifTrue: [ ^ self scan26 ].
							currentCharacter == $< ifTrue: [ ^ self scan27 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $% ifTrue: [ ^ self scan26 ].
								currentCharacter == $< ifTrue: [ ^ self scan27 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $% ifTrue: [ ^ self scan26 ].
									currentCharacter == $< ifTrue: [ ^ self scan27 ] ] ] ] ] ] ] ].
		^ self scan25 ].
	currentCharacter == $< ] whileTrue.
	^ self scan25
]

{ #category : #generated }
HTMLScanner >> scan28 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $? ifTrue: [ ^ self scan30 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan29 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $? ifTrue: [ ^ self scan30 ].
			^ self scan28 ].
		currentCharacter == $? ifTrue: [ ^ self scan30 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan29 ].
			currentCharacter == $? ifTrue: [ ^ self scan30 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan29 ].
				currentCharacter == $? ifTrue: [ ^ self scan30 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan29 ].
					currentCharacter == $? ifTrue: [ ^ self scan30 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan29 ].
						currentCharacter == $? ifTrue: [ ^ self scan30 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan29 ].
							currentCharacter == $? ifTrue: [ ^ self scan30 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan29 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan29 ] ].
								currentCharacter == $? ifTrue: [ ^ self scan30 ] ] ] ] ] ] ].
		^ self scan28 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan30 ].
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan3 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		^ self scan1 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan2 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan2 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan2 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan2 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan2 ] ] ] ] ] ] ] ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan30 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan29 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan29 ].
		currentCharacter == $? ifTrue: [ ^ self scan30 ].
		^ self scan28 ].
	currentCharacter == $? ] whileTrue.
	^ self scan28
]

{ #category : #generated }
HTMLScanner >> scan31 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [ ^ self scan34 ].
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan32 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan33 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan34 ].
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan33 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 3 17 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		^ self scan31 ].
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan32 ].
			currentCharacter == $> ifTrue: [ ^ self scan34 ].
			currentCharacter == $? ifTrue: [ ^ self scan35 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan32 ].
				currentCharacter == $> ifTrue: [ ^ self scan34 ].
				currentCharacter == $? ifTrue: [ ^ self scan35 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan32 ].
					currentCharacter == $> ifTrue: [ ^ self scan34 ].
					currentCharacter == $? ifTrue: [ ^ self scan35 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan32 ].
						currentCharacter == $> ifTrue: [ ^ self scan34 ].
						currentCharacter == $? ifTrue: [ ^ self scan35 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan32 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 3 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan32 ].
								currentCharacter == $> ifTrue: [ ^ self scan34 ] ].
							currentCharacter == $? ifTrue: [ ^ self scan35 ] ] ] ] ] ] ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan34 [

	[
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ] whileTrue.
	currentCharacter == $? ifTrue: [ ^ self scan35 ].
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan35 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan32 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 3 5 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan32 ].
		currentCharacter == $> ifTrue: [ ^ self scan34 ].
		currentCharacter == $? ifTrue: [ ^ self scan35 ].
		^ self scan31 ].
	currentCharacter == $? ] whileTrue.
	^ self scan31
]

{ #category : #generated }
HTMLScanner >> scan36 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ifTrue: [ ^ self scan38 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan37 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan37 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 7 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $> ifTrue: [ ^ self scan38 ].
			^ self scan36 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan37 ].
			currentCharacter == $> ifTrue: [ ^ self scan38 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan37 ].
				currentCharacter == $> ifTrue: [ ^ self scan38 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan37 ].
					currentCharacter == $> ifTrue: [ ^ self scan38 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan37 ].
						currentCharacter == $> ifTrue: [ ^ self scan38 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan37 ].
							currentCharacter == $> ifTrue: [ ^ self scan38 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan37 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 7 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan37 ].
									currentCharacter == $> ifTrue: [ ^ self scan38 ] ] ] ] ] ] ] ].
		^ self scan36 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan38 ].
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan38 [

	[
	self recordMatch: #( 7 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan37 ].
	currentCharacter == $> ] whileTrue.
	^ self scan36
]

{ #category : #generated }
HTMLScanner >> scan39 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ifTrue: [ ^ self scan41 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan4 [

	[
	self recordMatch: #( 6 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter between: Character tab and: Character lf) or: [
		currentCharacter == Character cr or: [
			currentCharacter == Character space ] ] ] whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan40 [

	[
	self step.
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan40 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 8 17 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $> ifTrue: [ ^ self scan41 ].
			^ self scan39 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan40 ].
			currentCharacter == $> ifTrue: [ ^ self scan41 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan40 ].
				currentCharacter == $> ifTrue: [ ^ self scan41 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan40 ].
					currentCharacter == $> ifTrue: [ ^ self scan41 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan40 ].
						currentCharacter == $> ifTrue: [ ^ self scan41 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan40 ].
							currentCharacter == $> ifTrue: [ ^ self scan41 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan40 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 8 16 ).
									self step.
									currentCharacter == $< ifTrue: [ ^ self scan40 ].
									currentCharacter == $> ifTrue: [ ^ self scan41 ] ] ] ] ] ] ] ].
		^ self scan39 ].
	currentCharacter == $< ] whileTrue.
	currentCharacter == $> ifTrue: [ ^ self scan41 ].
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan41 [

	[
	self recordMatch: #( 8 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan40 ].
	currentCharacter == $> ] whileTrue.
	^ self scan39
]

{ #category : #generated }
HTMLScanner >> scan42 [

	[
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan43 [

	[
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan44 ].
	currentCharacter == $< ] whileTrue.
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan44 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan43 ].
	currentCharacter == $> ifTrue: [
		self recordMatch: #( 17 19 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		^ self scan42 ].
	currentCharacter == $s ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		currentCharacter == $c ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan43 ].
			currentCharacter == $r ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan43 ].
				currentCharacter == $i ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan43 ].
					currentCharacter == $p ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan43 ].
						currentCharacter == $t ifTrue: [
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan43 ].
							currentCharacter == $> ifTrue: [
								self recordMatch: #( 16 ).
								self step.
								currentCharacter == $< ifTrue: [ ^ self scan43 ] ] ] ] ] ].
			^ self scan42 ].
		currentCharacter == $t ifTrue: [
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan43 ].
			currentCharacter == $y ifTrue: [
				self step.
				currentCharacter == $< ifTrue: [ ^ self scan43 ].
				currentCharacter == $l ifTrue: [
					self step.
					currentCharacter == $< ifTrue: [ ^ self scan43 ].
					currentCharacter == $e ifTrue: [
						self step.
						currentCharacter == $< ifTrue: [ ^ self scan43 ].
						currentCharacter == $> ifTrue: [
							self recordMatch: #( 18 ).
							self step.
							currentCharacter == $< ifTrue: [ ^ self scan43 ] ] ] ] ] ] ].
	^ self scan42
]

{ #category : #generated }
HTMLScanner >> scan45 [

	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan46 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan46 [

	[
	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $) ifTrue: [
		self recordMatch: #( 14 ).
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		currentCharacter == $] ifTrue: [ ^ self scan47 ].
		^ self scan1 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $] ifTrue: [ ^ self scan47 ].
	(currentCharacter between: $- and: $.) or: [
		(currentCharacter between: $0 and: $:) or: [
			(currentCharacter between: $A and: $Z) or: [
				currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
		whileTrue.
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan47 [

	self recordMatch: #( 14 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan48 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan45 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan46 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan5 [

	[
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan7 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan6 [

	self recordMatch: #( 20 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scan7 [

	[
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan6 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $" ifTrue: [ ^ self scan6 ].
		currentCharacter == $< ifTrue: [ ^ self scan7 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan7 ].
			^ self scan5 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan7 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $" ifTrue: [ ^ self scan6 ].
				currentCharacter == $< ifTrue: [ ^ self scan7 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $" ifTrue: [ ^ self scan6 ].
					currentCharacter == $< ifTrue: [ ^ self scan7 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $" ifTrue: [ ^ self scan6 ].
						currentCharacter == $< ifTrue: [ ^ self scan7 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $" ifTrue: [ ^ self scan6 ].
							currentCharacter == $< ifTrue: [ ^ self scan7 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $" ifTrue: [ ^ self scan6 ].
								currentCharacter == $< ifTrue: [ ^ self scan7 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $" ifTrue: [ ^ self scan6 ].
									currentCharacter == $< ifTrue: [ ^ self scan7 ] ] ] ] ] ] ] ].
		^ self scan5 ].
	currentCharacter == $< ] whileTrue.
	^ self scan5
]

{ #category : #generated }
HTMLScanner >> scan8 [

	[
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan9 ].
	true ] whileTrue
]

{ #category : #generated }
HTMLScanner >> scan9 [

	[
	self step.
	currentCharacter == $' ifTrue: [ ^ self scan6 ].
	currentCharacter == $/ ifTrue: [
		self step.
		currentCharacter == $' ifTrue: [ ^ self scan6 ].
		currentCharacter == $< ifTrue: [ ^ self scan9 ].
		currentCharacter == $> ifTrue: [
			self recordMatch: #( 17 ).
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan9 ].
			^ self scan8 ].
		currentCharacter == $s ifTrue: [
			self step.
			currentCharacter == $' ifTrue: [ ^ self scan6 ].
			currentCharacter == $< ifTrue: [ ^ self scan9 ].
			currentCharacter == $c ifTrue: [
				self step.
				currentCharacter == $' ifTrue: [ ^ self scan6 ].
				currentCharacter == $< ifTrue: [ ^ self scan9 ].
				currentCharacter == $r ifTrue: [
					self step.
					currentCharacter == $' ifTrue: [ ^ self scan6 ].
					currentCharacter == $< ifTrue: [ ^ self scan9 ].
					currentCharacter == $i ifTrue: [
						self step.
						currentCharacter == $' ifTrue: [ ^ self scan6 ].
						currentCharacter == $< ifTrue: [ ^ self scan9 ].
						currentCharacter == $p ifTrue: [
							self step.
							currentCharacter == $' ifTrue: [ ^ self scan6 ].
							currentCharacter == $< ifTrue: [ ^ self scan9 ].
							currentCharacter == $t ifTrue: [
								self step.
								currentCharacter == $' ifTrue: [ ^ self scan6 ].
								currentCharacter == $< ifTrue: [ ^ self scan9 ].
								currentCharacter == $> ifTrue: [
									self recordMatch: #( 16 ).
									self step.
									currentCharacter == $' ifTrue: [ ^ self scan6 ].
									currentCharacter == $< ifTrue: [ ^ self scan9 ] ] ] ] ] ] ] ].
		^ self scan8 ].
	currentCharacter == $< ] whileTrue.
	^ self scan8
]

{ #category : #generated }
HTMLScanner >> scanForToken [

	scope == #style ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan43 ].
		((currentCharacter between: Character tab and: Character lf) or: [
			 currentCharacter == Character cr or: [
				 currentCharacter == Character space ] ]) ifTrue: [
			[
			self recordMatch: #( 6 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan43 ].
			(currentCharacter between: Character tab and: Character lf) or: [
				currentCharacter == Character cr or: [
					currentCharacter == Character space ] ] ] whileTrue ].
		^ self scan42 ].
	scope == #default ifTrue: [ ^ self scan11 ].
	scope == #attvalue ifTrue: [ ^ self scanForTokenX2 ].
	scope == #tag ifTrue: [ ^ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1 [

	self step.
	currentCharacter == $( ifTrue: [ ^ self scan48 ].
	^ self scanForTokenX1X5
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X1 [

	self step.
	currentCharacter == $# ifTrue: [ ^ self scan45 ].
	currentCharacter == $( ifTrue: [ ^ self scan48 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan46 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X2 [

	self recordMatch: #( 11 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X3 [

	self recordMatch: #( 13 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X4 [

	self recordMatch: #( 12 ).
	self step.
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX1X5 [

	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X4 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $> ifTrue: [ ^ self scanForTokenX1X2 ].
	currentCharacter == $[ ifTrue: [ ^ self scanForTokenX1X1 ].
	('#*' includes: currentCharacter) ifTrue: [ ^ self scan45 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan4 ].
	(currentCharacter == $: or: [
		 (currentCharacter between: $A and: $Z) or: [
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan46 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2 [

	self step.
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	currentCharacter == $# ifTrue: [
		self step.
		currentCharacter == $< ifTrue: [ ^ self scan2 ].
		(currentCharacter isDigit or: [
			 (currentCharacter between: $A and: $F) or: [
				 currentCharacter between: $a and: $f ] ]) ifTrue: [
			[
			self recordMatch: #( 20 ).
			self step.
			currentCharacter == $< ifTrue: [ ^ self scan2 ].
			currentCharacter isDigit or: [
				(currentCharacter between: $A and: $F) or: [
					currentCharacter between: $a and: $f ] ] ] whileTrue ].
		^ self scan1 ].
	currentCharacter == $' ifTrue: [ ^ self scan8 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit ifTrue: [ ^ self scanForTokenX2X1 ].
	((currentCharacter between: $A and: $Z) or: [
		 currentCharacter between: $a and: $z ]) ifTrue: [ ^ self scan10 ].
	((currentCharacter between: Character tab and: Character lf) or: [
		 currentCharacter == Character cr or: [
			 currentCharacter == Character space ] ]) ifTrue: [ ^ self scan4 ].
	^ self scan1
]

{ #category : #generated }
HTMLScanner >> scanForTokenX2X1 [

	[
	self recordMatch: #( 20 ).
	self step.
	currentCharacter == $% ifTrue: [ ^ self scan6 ].
	currentCharacter == $< ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit ] whileTrue.
	((currentCharacter between: $A and: $Z) or: [
		 currentCharacter between: $a and: $z ]) ifTrue: [ ^ self scan10 ].
	^ self scan1
]
