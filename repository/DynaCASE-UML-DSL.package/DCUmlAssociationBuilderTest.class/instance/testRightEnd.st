tests
testRightEnd
	self parse: '- Right' rule: #rightEnd.
	self assert: result first equals: 'Right'.
	self assert: result second class equals: DCFAMIXAssociationEnd.
	self assert: result second name equals: nil.
	self assert: result third equals: false