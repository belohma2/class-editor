Class {
	#name : #OPUmlPackageControllerTest,
	#superclass : #OPUmlElementControllerTest,
	#category : #'OpenPonk-ClassEditor-Tests - Controllers'
}

{ #category : #accessing }
OPUmlPackageControllerTest >> controllerClass [
	^ OPUmlPackageController
]

{ #category : #accessing }
OPUmlPackageControllerTest >> modelClass [
	^ OPUMLPackage
]

{ #category : #'instance creation' }
OPUmlPackageControllerTest >> newEmptyModel [
	^ OPUMLPackage new name: 'Something'
]

{ #category : #'tests - creation' }
OPUmlPackageControllerTest >> testAddDiagramAsTargetForModel [
	diagramController addAsTargetFor: controller.
	self assert: diagramController model packagedElements asArray equals: {controller model}
]

{ #category : #'tests - creation' }
OPUmlPackageControllerTest >> testCanDiagramBeTargetForModel [
	self assert: (diagramController canBeTargetFor: controller)
]

{ #category : #'tests - creation' }
OPUmlPackageControllerTest >> testCreateDiagramElement [
	self
		assert: controller createDiagramElement class
		equals: OPUmlPackageCompartmentableShape
]

{ #category : #'tests - creation' }
OPUmlPackageControllerTest >> testCreateFromPalette [
	self assert: (diagramController canBeTargetFor: controller)
]

{ #category : #'tests - removing' }
OPUmlPackageControllerTest >> testRemoveEmpty [
	controller model: self newEmptyModel.
	controller showWithoutDependentInDiagram: diagramController.
	controller remove.
	self assert: diagramController view elements asArray equals: #().
	self assert: diagramController controllers asArray equals: #()
]

{ #category : #'tests - removing' }
OPUmlPackageControllerTest >> testRemoveFromModel [
	| packagedModel |
	packagedModel := self newEmptyModel.
	diagramController model packagedElements add: packagedModel.
	diagramController showWithoutDependentInDiagramModel: packagedModel.
	controller := diagramController controllerForModel: packagedModel.
	controller removeModel.
	self
		assert: diagramController model packagedElements asArray
		equals: #()
]

{ #category : #'tests - diagram' }
OPUmlPackageControllerTest >> testShowClassInDiagram [
	| class |
	class := OPUMLClass new.
	diagramController showWithoutDependentInDiagramModel: class.
	self
		assert:
			(diagramController view elements
				anySatisfy: [ :each | each model isNotNil and: [ each model modelElement = class ] ])
]

{ #category : #'tests - diagram' }
OPUmlPackageControllerTest >> testShowClassWithAttributeInDiagram [
	| class prop |
	class := OPUMLClass new.
	prop := OPUMLProperty new.
	class ownedAttributes add: prop.
	diagramController showInDiagramModel: class.
	self
		assert:
			(diagramController view elements
				anySatisfy:
					[ :each | each model isNotNil and: [ each model modelElement = prop ] ])
]

{ #category : #tests }
OPUmlPackageControllerTest >> testSupport [
	self assert: (diagramController hasSupportForModel: self newEmptyModel)
]
