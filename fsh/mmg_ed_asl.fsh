//============== ALIAS ===============
Alias: COV_TYP = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: V3ActStatus = http://terminology.hl7.org/CodeSystem/v3-ActStatus
Alias: V3NullFlavor = http://terminology.hl7.org/CodeSystem/v3-NullFlavor
Alias: AbsentReason = http://terminology.hl7.org/CodeSystem/data-absent-reason
Alias: dataAbsentReason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
// Alias: StatoEsenzioneCoverage = http://hl7.it/fhir/StructureDefinition/statoEsenzione-Coverage
// Alias: PractitionerMMG = http://hl7.it/fhir/StructureDefinition/Practitioner-mmg-it
//=========================
//====== Estensione =====================================
Extension:   StatoEsenzioneCoverage
Id:          coverage-exceptionStatus
Title:       "Stato Esenzione"
Description: "Estensione per gestire lo stato di una esenzione"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from VsStatoEsenzione (required)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//====== Profili =====================================
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* ---- COMMENTATO -- */
Profile:  CoverageItBase
Parent:   Coverage
Id:       Coverage-it-base
Title:    "Coverage - base"
Description: "Profilo base generico per Coverage: include la rappresentazione dell'ASL di residenza e delle esensioni."
//-------------------------------------------------------------------------------------------
/* -----------  ---*
* status 1..1 MS
* type = COV_TYP#PUBLICPOL
* beneficiary only Reference(http://hl7.it/fhir/StructureDefinition/Patient-it-base)
* payor[Organization] only Reference(OrganizationAziendaSanitaria)
* costToBeneficiary MS  // commento
/* --------
* costToBeneficiary.value[x] MS
* costToBeneficiary.value[x].extension contains dataAbsentReason named no-value 0..1 MS
--- */
* costToBeneficiary.valueQuantity.extension contains dataAbsentReason named no-value 0..1 MS
* costToBeneficiary.valueMoney.extension contains dataAbsentReason named no-value 0..1 MS
* costToBeneficiary.exception MS
* costToBeneficiary.exception.extension contains StatoEsenzioneCoverage named stato-esenzione 0..1 MS
* costToBeneficiary.exception.type MS
* costToBeneficiary.exception.type ^short = "codice esensione"
* costToBeneficiary.exception.type from http://hl7.it/fhir/ValueSet/minsan-esenzioni (extensible)
* costToBeneficiary.exception.period MS 


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/* 000000000000000000 00000000000000 */
Instance: EsempioEsenzione
InstanceOf: CoverageItBase
Description: "Esempio Esenzione"
* status = 	http://hl7.org/fhir/ValueSet/fm-status#active
* type = COV_TYP#PUBLICPOL
* beneficiary = Reference(Patient/esempio-CF-residenza)
* payor = Reference(Organization/ASL-example)
* costToBeneficiary.valueMoney.extension[no-value].valueCode = #not-applicable
* costToBeneficiary.exception.extension[stato-esenzione].valueCodeableConcept = V3ActStatus#active
* costToBeneficiary.exception.type = http://terminology.hl7.it/CodeSystem/minsan-esenzioni#E01

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  OrganizationItBase
Parent:   Organization
Id:       Organization-it-base
Title:    "Organization - base"
Description: "Profilo base generico per Organization"
//-------------------------------------------------------------------------------------------
* identifier MS // SI	0..*	Identifier	Identifies this organization across multiple systems
* active	MS
* type	MS 
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  OrganizationAziendaSanitaria
Parent:   OrganizationItBase
Id:       Organization-it-ausl
Title:    "Organization - azienda sanitaria"
Description: "Profilo base specifico per Organization: include le informazioni minime per descrivere una Azienda Sanitaria"
//-------------------------------------------------------------------------------------------
* identifier.system = "http://terminology.hl7.it/CodeSystem/fls11" 
* type = http://terminology.hl7.it/CodeSystem/it-tipoEntita#ausl "Azienda Sanitaria" // CodeableConcept	Kind of organization
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: ASL-example
InstanceOf: Organization
Description: "Organization: esempio Azienda Sanitaria"
//-------------------------------------------------------------------------------------------
* identifier.system = "http://terminology.hl7.it/CodeSystem/fls11" 
* identifier.value = "020101" 
* type = http://terminology.hl7.it/CodeSystem/it-tipoEntita#ausl "Azienda Sanitaria"
* name = "AZIENDA U.S.L. VALLE D'AOSTA"
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: nice-org
InstanceOf: Organization
Description: "Organization: esempio Azienda Sanitaria"
//-------------------------------------------------------------------------------------------
* identifier.system = "http://example.org/identificativo" 
* identifier.value = "12345"
* active = true
* name = "Fantastica Azienda"
* telecom[0].system = #phone
* telecom[0].value = "tel:+39 123 456 7890"
* telecom[0].use = #mobile
* telecom[1].system = #email
* telecom[1].value = "mailto:info@nice-org.it"
* telecom[1].use = #work
* address[0].line = "1, Piazza Signoria"
* address[0].city = "Firenze"    
* address[0].postalCode = "50100" 
* address[0].country = "IT"
* contact.name.text = "Dott. Ivo Serbelloni Viendalmare"

 


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerBaseIt
Parent:   Practitioner
Id:       Practitioner-it-base
Title:    "Practitioner - base"
Description: "Profilo base generico per Practitioner"
//-------------------------------------------------------------------------------------------
* identifier MS // add a slice for the fiscal code
* identifier ^short = "Identificativo dell'operatore sanitario" //
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains codiceFiscale  0..1
* identifier[codiceFiscale] MS
* identifier[codiceFiscale] ^patternIdentifier.system = "http://hl7.it/sid/codiceFiscale" // pattern
* name MS
* name ^short = "Nome dell'operatore sanitario: include le informazioni minime per descrivere un operatore sanitario"


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerMMGExample
InstanceOf: Practitioner
Description: "Esempio MMG"
* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "RSSMRT57D12D612R"
* identifier[1].system = "http://example.org/sid/codiceRegionale"
* identifier[1].value = "123456789"
* name.family = "Rossi"
* name.given = "Martino"
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerRoleItBase
Parent:   PractitionerRole
Id:       PractitionerRole-it-base
Title:    "PractitionerRole - base"
Description: "Profilo base generico per PractitionerRole"
//-------------------------------------------------------------------------------------------

* identifier MS // add a slice for the fiscal code
* identifier ^short = "Identificativo dell'operatore (e.g. Codice Fiscale, ID Regionale)" //
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains codiceFiscale  0..1
* identifier[codiceFiscale] MS
* identifier[codiceFiscale] ^patternIdentifier.system = "http://hl7.it/sid/codiceFiscale" // pattern
* period MS
* practitioner	MS // S	0..1	Practitioner that is able to provide the defined services for the organization
* practitioner	^short = "Dettagli dell'operatore"
* practitioner only Reference(PractitionerBaseIt)
* organization	MS // S	0..1	Reference(Organization)	Organization where the roles are available
* organization	^short = "Organizzazione di Appartenenza"
* organization	only Reference(OrganizationItBase)
* code	MS // S	0..*	CodeableConcept	Roles which this practitioner may perform

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerRoleMMG
Parent:   PractitionerRoleItBase
Id:       PractitionerRole-it-mmg
Title:    "PractitionerRole - MMG/PLS"
Description: "Profilo base specifico per PractitionerRole:  include le informazioni minime per descrivere un Medico Medicina Generale od un Pediatra di Libera Scelta e la sua ASL di appartenenza"
//-------------------------------------------------------------------------------------------

* identifier ^short = "Identificativo del MMG/PLS (e.g. Codice Fiscale, ID Regionale)" //
* practitioner	^short = "Dettagli del Medico"
* organization	^short = "Azienda Sanitaria di Appartenenza"
* organization	only Reference(OrganizationAziendaSanitaria)
* code from MmgPlsRoles (required)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerRoleMMGExample
InstanceOf: PractitionerRole
Description: "Esempio MMG"

* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "RSSMRT57D12D612R"
* identifier[1].system = "http://example.org/sid/codiceRegionale"
* identifier[1].value = "123456789"
* practitioner = Reference(Practitioner/PractitionerMMGExample)
* organization = Reference(Organization/ASL-example)


