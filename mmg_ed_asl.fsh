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

ValueSet: DenominazioniUrbanisticheGeneriche
Id: istat-dug
Title: "Registro delle Denominazioni Urbanistiche Generiche (DUG)"
Description: "Registro delle Denominazioni Urbanistiche Generiche (DUG)"

* codes from system http://registry.geodati.gov.it/dug
 
 /*    COMMENTATO
CodeSystem: DUG
Id: DUG
Title: "Registro delle Denominazioni Urbanistiche Generiche (DUG)"
Description: "Registro delle Denominazioni Urbanistiche Generiche (DUG)"
 
* #1 "arco"
* #2 "autostrada"
* #3 "belvedere"
* #4 "calata"
* #5 "calle"
* #6 "cavalcavia"
* #7 "circonvallazione"
* #8 "corso"
* #9 "corte"
* #10 "cortile"
* #11 "discesa"
* #12 "galleria"
* #13 "gradinata"
* #14 "larghetto"
* #15 "largo"
* #16 "litoranea"
* #17 "lungargine"
* #18 "lungofiume"
* #19 "lungolago"
* #20 "lungomare"
* #21 "lungoparco"
* #22 "lungotorrente"
* #23 "molo"
* #24 "parcheggio"
* #25 "passaggio"
* #26 "passeggiata"
* #27 "percorso ciclabile"
* #28 "percorso ciclopedonale"
* #29 "percorso pedonale"
* #30 "piazza"
* #31 "piazzale"
* #32 "piazzetta"
* #33 "pista ciclabile"
* #34 "ponte"
* #35 "raccordo"
* #36 "rampa"
* #37 "ronco"
* #38 "rotatoria"
* #39 "rotonda"
* #40 "salita"
* #41 "scalinata"
* #42 "scesa"
* #43 "sentiero"
* #44 "slargo"
* #45 "sottopasso"
* #46 "sovrappasso"
* #47 "spiazzo"
* #48 "strada"
* #49 "strada antica"
* #50 "strada comunale"
* #51 "strada consortile"
* #52 "strada nuova"
* #53 "strada panoramica"
* #54 "strada poderale"
* #55 "strada privata"
* #56 "strada provinciale"
* #57 "strada regionale"
* #58 "strada statale"
* #59 "strada vecchia"
* #60 "strada vicinale"
* #61 "stradella"
* #62 "stradello"
* #63 "stradone"
* #64 "tangenziale"
* #65 "traversa"
* #66 "traversa privata"
* #67 "via"
* #68 "via antica"
* #69 "via comunale"
* #70 "via nazionale"
* #71 "via nuova"
* #72 "via panoramica"
* #73 "via privata"
* #74 "via provinciale"
* #75 "via vecchia"
* #76 "viale"
* #77 "vialetto"
* #78 "vico"
* #79 "vico chiuso"
* #80 "vico cieco"
* #81 "vico privato"
* #82 "vicoletto"
* #83 "vicolo"
* #84 "vicolo chiuso"
* #85 "vicolo cieco"
* #86 "vicolo privato"
* #87 "viottolo"


===  FINE */


 