figures
createDiagramElement
	^ OPUmlAssociationShape new
		modelElement: self model;
		in: [ :e | e localStyle strokeColor: Color white ];
		yourself