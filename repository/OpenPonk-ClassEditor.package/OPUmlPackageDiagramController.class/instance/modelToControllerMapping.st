adding
modelToControllerMapping
	^ {OPUMLClass -> OPUmlClassController.
	OPUMLProperty -> OPUmlAttributeController.
	OPUMLOperation -> OPUmlOperationController.
	OPUMLGeneralization -> OPUmlGeneralizationController.
	OPUMLAssociation -> OPUmlAssociationController.
	OPUMLPackage -> OPUmlPackageController.
	OPUMLModel -> OPUmlPackageController.
	OPUMLProfile -> OPUmlPackageController.
	OPUMLExtension -> OPUmlExtensionController.
	OPUMLStereotype -> OPUmlStereotypeController} asDictionary