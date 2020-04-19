//============== ALIAS ===============

Alias: COV_TYP = http://terminology.hl7.org/CodeSystem/v3-ActCode

//=========================



//====== Profili =====================================

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Profile:  CoverageItEsensioni

Parent:   Coverage

Id:       Coverage-esenzioni-it

Title:    "Coverage Esensioni e ASL di Residenza"

Description: "Profilo base coverage usato per gestire l'ASL di residenza e le esensioni."

//-------------------------------------------------------------------------------------------

* status 1..1 MS

* type = COV_TYP#PUBLICPOL

* beneficiary only Reference(http://hl7.it/fhir/StructureDefinition/Patient-it-base)

* payor[Organization] only Reference(OrganizationAziendaSanitaria)

* costToBeneficiary MS  // commento

* costToBeneficiary.exception MS

* costToBeneficiary.exception.type MS

* costToBeneficiary.exception.type ^short = "codice esensione"

* costToBeneficiary.exception.type from http://terminology.fhir.it/ValueSet/esensioni (extensible)

* costToBeneficiary.exception.period MS

 



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

* identifier[codiceFiscale].system = "http://hl7.it/fhir/StructureDefinition/certificazioneAnagrafica"

* name MS

* name ^short = "Nome del Medico"





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

* practitioner only Reference(PractitionerMMG)

* organization	MS // S	0..1	Reference(Organization)	Organization where the roles are available

* organization	^short = "Azienda Sanitaria di Appartenenza"

* organization	only Reference(OrganizationAziendaSanitaria)

* code	MS // S	0..*	CodeableConcept	Roles which this practitioner may perform

* code from MmgPlsRoles (required)





CodeSystem: RoleCodeIT

Id: V3RoleCodeIT

Title: "Estensione del Vocabolario HL7 V3 RoleCode"

Description: "Estensione del Vocabolario HL7 V3 RoleCode"



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





ValueSet: MmgPlsRoles

Id: MmgPlsRoles

Title: "MMG/PLS"

Description: "Medico Medicina Generale e Pediatra di Libera Scelta"



* V3RoleCodeIT#MMG  "medico di medicina generale"

* V3RoleCodeIT#PLS  "pediatra di libera scelta"



 
