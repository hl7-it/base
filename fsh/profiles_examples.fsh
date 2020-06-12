//============== ALIAS ===============
Alias: COV_TYP = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: V3ActStatus = http://terminology.hl7.org/CodeSystem/v3-ActStatus
Alias: V3NullFlavor = http://terminology.hl7.org/CodeSystem/v3-NullFlavor
Alias: AbsentReason = http://terminology.hl7.org/CodeSystem/data-absent-reason
Alias: dataAbsentReason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: CS_V3ItRoles = http://terminology.hl7.it/CodeSystem/it-v3RoleCode
Alias: StatoEsenzioneCoverage = http://hl7.it/fhir/StructureDefinition/coverage-exceptionStatus
// Alias: PractitionerMMG = http://hl7.it/fhir/StructureDefinition/Practitioner-mmg-it


Alias: CS_professioni = http://terminology.hl7.it/CodeSystem/istat-professioni
Alias: CS_TitoloStudio = http://terminology.hl7.it/CodeSystem/istat-ctsi03
Alias: professioniPaziente = http://hl7.it/fhir/ValueSet/istat-professione
Alias: titoloStudio = http://hl7.it/fhir/ValueSet/istat-titoloStudio
Alias: Translation = http://hl7.org/fhir/StructureDefinition/translation


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

/* 000000000000000000 00000000000000 */
Instance: EsempioEsenzione
// InstanceOf: CoverageItBase
InstanceOf: Coverage
Description: "Esempio Esenzione"
* status = 	http://hl7.org/fhir/ValueSet/fm-status#active
* type = COV_TYP#PUBLICPOL
* beneficiary = Reference(Patient/esempio-CF-residenza)
* payor = Reference(Organization/ASL-example)
* costToBeneficiary.valueMoney.extension[0].url = dataAbsentReason
* costToBeneficiary.valueMoney.extension[0].valueCode = #not-applicable
* costToBeneficiary.exception.extension[0].url = StatoEsenzioneCoverage
* costToBeneficiary.exception.extension[0].valueCodeableConcept = V3ActStatus#active
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
* type from http://hl7.it/fhir/ValueSet/tipoOrganizzazione (example) 
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  OrganizationHcp
Parent:   OrganizationItBase
Id:       Organization-it-hcp
Title:    "Organization - Operatore socio sanitario"
Description: "Profilo base specifico per Organization: include le informazioni minime per descrivere una organizzazione che eroga od è responsabile per prestazioni socio sanitarie"
//-------------------------------------------------------------------------------------------

* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains 
	asl 0..1 
	and aziendaOspedaliera 0..1 
	and struttura 0..1 
	// and strutturaInterna 0..1
* identifier[asl] MS
* identifier[asl] ^patternIdentifier.system = http://hl7.it/sid/fls // pattern
* identifier[asl].value 1..1
* identifier[asl].value from http://hl7.it/fhir/ValueSet/minsan-idAsl (required)
* identifier[aziendaOspedaliera] ^patternIdentifier.system = "http://hl7.it/sid/hsp" // pattern
* identifier[aziendaOspedaliera].value 1..1
* identifier[aziendaOspedaliera].value from http://hl7.it/fhir/ValueSet/minsan-idAziendeOspedaliere (required)
* identifier[struttura] ^patternIdentifier.system = "http://hl7.it/sid/hsp" // pattern
* identifier[struttura].value 1..1
* identifier[struttura].value from http://hl7.it/fhir/ValueSet/minsan-idStrutture (required)
// * identifier[strutturaInterna] ^patternIdentifier.system = "http://hl7.it/sid/hsp" // pattern
// * identifier[strutturaInterna].value 1..1
// * identifier[strutturaInterna].value from http://hl7.it/fhir/ValueSet/minsan-idStruttureInterne (required)
* active	MS
* type	MS
* type from http://hl7.it/fhir/ValueSet/tipoOrgSocioSanitaria (extensible)
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: ASL-example
InstanceOf: Organization
Description: "Organization: esempio Azienda Sanitaria"
//-------------------------------------------------------------------------------------------
* identifier.system = "http://hl7.it/sid/asl" 
* identifier.value = "020101"
* active = 	true
* type = http://terminology.hl7.it/CodeSystem/it-tipoEntita#asl "Azienda Sanitaria Locale"
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
* organization	only Reference(OrganizationHcp)
* code from VsMmgPlsRoles (required)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerRoleMMGExample
InstanceOf: PractitionerRole
Description: "Esempio MMG"

* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "RSSMRT57D12D612R"
* identifier[1].system = "http://example.org/sid/codiceRegionale"
* identifier[1].value = "123456789"
* period.start = "1997-09-01"
* practitioner = Reference(Practitioner/PractitionerMMGExample)
* organization = Reference(Organization/ASL-example)
* code = CS_V3ItRoles#MMG

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerRoleExample
InstanceOf: PractitionerRole
Description: "Esempio PractitionerRole"

* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "PLLDSR80E47A462P"
* period.start = "2005-04-15"
* practitioner = Reference(Practitioner/PractitionerExample)
* organization = Reference(Organization/ASL-example)
* code.text = "impiegata"

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerExample
InstanceOf: Practitioner
Description: "Esempio Practitioner"
* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "PLLDSR80E47A462P"
* name.family = "Pellé"
* name.given = "Désirée"
* gender = #female
* birthDate = "1980-07-05"

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++







//=========================

//====== Estensione =====================================
Extension:   ExtProfessionePaziente
Id:          patient-occupation-it
Title:       "Professione del paziente"
Description: "Estensione per gestire la professione del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from professioniPaziente (example)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Extension:   ExtTitoloStudioPaziente
Id:          patient-qualification-it
Title:       "Titolo di Studio del paziente"
Description: "Estensione per gestire il Titolo di studio del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from titoloStudio (example)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: esempio-professione
InstanceOf: Patient
Description: "Patient: professione e titolo di studio"
* extension[ExtProfessionePaziente].valueCodeableConcept = CS_professioni#2.4.1 "Medici"
* extension[ExtTitoloStudioPaziente].valueCodeableConcept = CS_TitoloStudio#72004001 "Medicina e chirurgia"
* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "RSSMRT57D12D612R"
* name.family = "Rossi"
* name.given = "Martino"