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
Id:          coverage-statoEsenzione
Title:       "Stato Esenzione"
Description: "Estensione per gestire lo stato di una esenzione"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from StatoEsenzioneV3ActStatus (required)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//====== Profili =====================================



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* ---- COMMENTATO -- */
Profile:  CoverageItEsensioni
Parent:   Coverage
Id:       Coverage-esenzioni-it
Title:    "Coverage Esensioni e ASL di Residenza"
Description: "Profilo base coverage usato per gestire l'ASL di residenza e le esensioni."

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
* costToBeneficiary.exception.type from http://hl7.it/fhir/ValueSet/esenzioni-MinSan (extensible)
* costToBeneficiary.exception.period MS 




// Alias: CoverageItEsensioni = http://hl7.it/fhir/StructureDefinition/Coverage-esenzioni-it

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* 000000000000000000 00000000000000 */
Instance: EsempioEsenzione
InstanceOf: CoverageItEsensioni
Description: "Esempio Esenzione"

* status = 	http://hl7.org/fhir/ValueSet/fm-status#active
* type = COV_TYP#PUBLICPOL
* beneficiary = Reference(Patient/Patient-CF-residenza)
* payor = Reference(Organization/ASL-example)
* costToBeneficiary.valueMoney.extension[no-value].valueCode = #not-applicable
* costToBeneficiary.exception.extension[stato-esenzione].valueCodeableConcept = V3ActStatus#active
* costToBeneficiary.exception.type = http://hl7.it/fhir/CodeSystem/esenzioni-MinSan#E01


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Profile:  OrganizationAziendaSanitaria
Parent:   Organization
Id:       Organization-AziendaSanitaria-it
Title:    "Azienda Sanitaria"
Description: "Profilo Organization per descrivere una Azienda Sanitaria"

//-------------------------------------------------------------------------------------------

* identifier MS // SI	0..*	Identifier	Identifies this organization across multiple systems
* identifier.system = "http://terminology.hl7.it/CodeSystem/fls11" 
* active	MS
* type	0..* MS // 
* type = http://terminology.hl7.it/CodeSystem/tipoEntita#ausl "Azienda Sanitaria" // CodeableConcept	Kind of organization
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: ASL-example
InstanceOf: Organization-AziendaSanitaria-it
Description: "Organization: esempio Azienda Sanitaria"
//-------------------------------------------------------------------------------------------

* identifier.system = "http://terminology.hl7.it/CodeSystem/fls11" 
* identifier.value = "020101" 
* type = http://terminology.hl7.it/CodeSystem/tipoEntita#ausl "Azienda Sanitaria"
* name = "AZIENDA U.S.L. VALLE D'AOSTA"






//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/* COMMENTED */

Profile:  PractitionerMMG
Parent:   Practitioner
Id:       Practitioner-mmg-it
Title:    "Practitioner per MMG/PLS"

Description: "Profilo base Practitioner usato per descrivere Medico Medicina Generale e Pediatra di Libera Scelta"

* identifier MS // add a slice for the fiscal code
* identifier ^short = "Identificativo del MMG/PLS (e.g. Codice Fiscale, ID Regionale)" //
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier contains codiceFiscale  0..1
* identifier[codiceFiscale] MS
* identifier[codiceFiscale] ^patternIdentifier.system = "http://hl7.it/sid/codiceFiscale" // pattern
* name MS
* name ^short = "Nome del Medico"


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerMMGExample
InstanceOf: Practitioner
Description: "Esempio MMG"

* identifier.system = "http://hl7.it/sid/codiceFiscale"
* identifier.value = "RSSMRT57D12D612R"
* identifier.system = "http://example.org/sid/codiceRegionale"
* identifier.value = "123456789"
* name.family = "Rossi"
* name.given = "Martino"


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Profile:  PractitionerRoleMMG
Parent:   PractitionerRole
Id:       PractitionerRole-mmg-it
Title:    "PractitionerRole per MMG/PLS"
Description: "Profilo base PractitionerRole usato per descrivere Medico Medicina Generale e Pediatra di Libera Scelta e l'ASL di appartenenza"

//-------------------------------------------------------------------------------------------



/*  

  To Do:

  - add voc binding for code 

*/



* identifier MS // add a slice for the fiscal code

* identifier ^short = "Identificativo del MMG/PLS (e.g. Codice Fiscale, ID Regionale)" //

* identifier ^slicing.discriminator.type = #pattern

* identifier ^slicing.discriminator.path = "$this"

* identifier ^slicing.rules = #open

* identifier ^slicing.description = "Slice based on the identifier pattern"

* identifier contains codiceFiscale  0..1

* identifier[codiceFiscale] MS

* identifier[codiceFiscale].system = "http://hl7.it/fhir/StructureDefinition/certificazioneAnagrafica"

* period MS

* practitioner	MS // S	0..1	Reference(Practitioner)	Practitioner that is able to provide the defined services for the organization

* practitioner	^short = "Dettagli del Medico"
// * practitioner only Reference(PractitionerMMG)
* practitioner only Reference(Practitioner)
* organization	MS // S	0..1	Reference(Organization)	Organization where the roles are available
* organization	^short = "Azienda Sanitaria di Appartenenza"
* organization	only Reference(OrganizationAziendaSanitaria)
* code	MS // S	0..*	CodeableConcept	Roles which this practitioner may perform
* code from MmgPlsRoles (required)



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CodeSystem: RoleCodeIT
Id: V3RoleCodeIT
Title: "Estensione del Vocabolario HL7 V3 RoleCode"
Description: "Estensione del Vocabolario HL7 V3 RoleCode"

//-------------------------------------------------------------------------------------------

* #MMG  "medico di medicina generale"

* #PLS  "pediatra di libera scelta"

* #MSD  "medico del servizio/struttura del distretto/azienda" 

* #MCA  "medico continuità assistenziale" 

* #MO  "medico ospedaliero" 

* #MSA  "medico specialista ambulatoriale" 

* #MAU  "medico di azienda ospedaliero-universitaria" 

* #GMT  "guardia medica turistica" 

* #SPA  "specialista di struttura privata accreditata" 

* #MI  "medico INAIL" 

* #MC  "medico consulente" 

* #AS "altra specializzazione" 

* #AA "altro (tirocinanti, specializzandi, etc)"



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ValueSet: MmgPlsRoles

Id: MmgPlsRoles

Title: "MMG/PLS"

Description: "Medico Medicina Generale e Pediatra di Libera Scelta"

//-------------------------------------------------------------------------------------------
* V3RoleCodeIT#MMG  "medico di medicina generale"
* V3RoleCodeIT#PLS  "pediatra di libera scelta"

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ValueSet: StatoEsenzioneV3ActStatus
Id: StatoEsenzione-V3ActStatus
Title: "Stato delle esenzioni (V3ActStatus)."
Description: "Value Set basato sul vocabolario HL7 V3 ActStatus che descrive lo stato delle esenzioni. Questo value set è adottato da HL7 CDA R2 IG 'DOCUMENTO DI ESENZIONE'"
//-------------------------------------------------------------------------------------------
* V3ActStatus#active "attivo" // "Esenzione in corso di validità"
* V3ActStatus#suspended  "sospeso" // "Esenzione momentaneamente sospesa (ad esempio in attesa del rinnovo di un’iscrizione temporanea)"
* V3ActStatus#aborted  "abortito" // "Esenzione mai stata valida (ad esempio è stata assegnata per errore e il documento corrispondente era già stato prodotto in stato active)"
* V3ActStatus#completed "completato" // "Esenzione non più in corso di validità"
* V3NullFlavor#UNK "sconosciuto"
