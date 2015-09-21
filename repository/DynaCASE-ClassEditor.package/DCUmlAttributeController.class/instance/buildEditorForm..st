ui hooks
buildEditorForm: form
	(form addTextInput: 'Name')
		text: self model name;
		whenTextIsAccepted: [ :newValue | 
			self model name: newValue.
			self refreshFigure ].
	(form addTextInput: 'Type')
		text: (self model declaredType ifNil: [ '' ] ifNotNil: [ :t | t name ]);
		whenTextIsAccepted:
				[ :newValue | 
			newValue
				ifEmpty: [ self model declaredType: nil ]
				ifNotEmpty: [ self model declaredType: (FAMIXClass named: newValue) ].
			self refreshFigure ].
	(form addCheckbox: 'Class')
		state: self model isStatic;
		whenChangedDo: [ :val | 
			self model isStatic: val.
			self refreshFigure ].
	(form addTextInput: 'Multiplicity min')
		text: self model multiplicity printLower;
		whenTextIsAccepted:
				[ :val | 
			val
				ifNotEmpty: [ 
					self model multiplicity lower: val asString.
					self refreshFigure ] ].

	(form addTextInput: 'Multiplicity max')
		text: self model multiplicity printUpper;
		whenTextIsAccepted:
				[ :val | 
			val
				ifNotEmpty:
					[ 
					self model multiplicity
						upper:
							(val = '*'
								ifTrue: [ -1 ]
								ifFalse: [ val asNumber ]).
					self refreshFigure ] ]