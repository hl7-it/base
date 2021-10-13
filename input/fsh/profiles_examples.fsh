

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
// * status = 	http://hl7.org/fhir/ValueSet/fm-status#active
* status = 	#active
* type = COV_TYP#PUBLICPOL
* beneficiary = Reference(Patient/esempio-CF-residenza)
* payor = Reference(Organization/asl-020101)
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
* type from http://terminology.hl7.it/ValueSet/tipoOrganizzazione (example) 
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  OrganizationHcp
Parent:   OrganizationItBase
Id:       Organization-it-hcp
Title:    "Organization - Operatore sanitario/socio sanitario"
Description: "Profilo base specifico per Organization: include le informazioni minime per descrivere una organizzazione che eroga od è responsabile per prestazioni sanitarie o socio sanitarie"
//-------------------------------------------------------------------------------------------

* identifier MS
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "$this.system"
* identifier ^slicing.discriminator[1].type = #value
* identifier ^slicing.discriminator[1].path = "$this.value"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier pattern"
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* identifier contains 
	asl 0..1 
	and aslRegione 0..1
	and aziendaOspedaliera 0..1 
	and struttura 0..1 
	and partitaIva 0..1
	and codiceFiscale 0..1
	and strutturaInterna 0..1

* identifier[asl] ^short = "Identificativo Azienda Sanitaria Locale (FLS 11 - 6 char)"
* identifier[asl].system = "http://hl7.it/sid/fls" (exactly) // pattern
// * identifier[asl].value 1..1
* identifier[asl].value from http://terminology.hl7.it/ValueSet/minsan-idAsl (required)

* identifier[aslRegione].system from http://terminology.hl7.it/ValueSet/uri-idAslRegione // pattern
* identifier[aslRegione] ^short = "Identificativo Regionale Azienda Sanitaria Locale (FLS 11 - 3 char)"
// * identifier[aslRegione].value 1..1

// * identifier[aziendaOspedaliera] ^patternIdentifier.system = "http://hl7.it/sid/hsp" // pattern
* identifier[aziendaOspedaliera].system = "http://hl7.it/sid/hsp" (exactly)  // pattern
* identifier[aziendaOspedaliera] ^short = "Identificativo Azienda Ospedaliera (HSP 11)"


//* identifier[aziendaOspedaliera].value 1..1
* identifier[aziendaOspedaliera].value from http://terminology.hl7.it/ValueSet/minsan-idAziendeOspedaliere (required)
* identifier[struttura].system = "http://hl7.it/sid/hsp" (exactly) // pattern
* identifier[struttura] ^short = "Identificativo Struttura di Ricovero (HSP 11)"
//* identifier[struttura].value 1..1
* identifier[struttura].value from http://terminology.hl7.it/ValueSet/minsan-idStrutture (required)
* identifier[strutturaInterna].system = "http://hl7.it/sid/hsp" (exactly) // pattern
// * identifier[strutturaInterna].value 1..1
* identifier[strutturaInterna].value from http://terminology.hl7.it/ValueSet/minsan-idStruttureInterne (required)
* identifier[partitaIva].system = "http://hl7.it/sid/partitaIva" (exactly)  // pattern
* identifier[partitaIva] ^short = "Partita IVA Organizzazione"
* identifier[codiceFiscale].system = "http://hl7.it/sid/codiceFiscale" (exactly)  // pattern
* identifier[codiceFiscale] ^short = "Codice Fiscale Organizzazione"

* active	MS
* type	MS
* type from http://terminology.hl7.it/ValueSet/tipoOrgSocioSanitaria (extensible)
* name	MS
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: asl-020101
InstanceOf: Organization
Description: "Organization: esempio Azienda Sanitaria"
// 2020	
//-------------------------------------------------------------------------------------------
* identifier[0].system = "http://hl7.it/sid/fls" 
* identifier[0].value = "020101"
* identifier[1].system = "http://hl7.it/sid/vda/asl" 
* identifier[1].value = "101"
* identifier[2].system = "http://hl7.it/sid/partitaIva" 
* identifier[2].value = "00177330073"
* identifier[3].system = "http://hl7.it/sid/codiceFiscale" 
* identifier[3].value = "91001750073"
* active = 	true
* type = http://terminology.hl7.it/CodeSystem/it-tipoEntita#asl "Azienda Sanitaria Locale"
* name = "AZIENDA U.S.L. VALLE D'AOSTA"

* telecom[0].system = #phone
* telecom[0].value = "(0165) 5431"
* telecom[1].system = #fax
* telecom[1].value = "(0165) 544587"
* telecom[2].system = #email
* telecom[2].value = "protocollo@pec.ausl.vda.it"
* telecom[3].system = #url
* telecom[3].value = "http://www.ausl.vda.it"

* address[0].line = "VIA GUIDO REY 1"
* address[0].city = "AOSTA"
* address[0].city.extension[0].url = ISO_SC_coding
* address[0].city.extension[0].valueCoding = CS_unitaTerritoriali#007003 "AOSTA"    
* address[0].district = "AO"
* address[0].state = "VALLE D'AOSTA"
* address[0].state.extension[0].url = ISO_SC_coding
* address[0].state.extension[0].valueCoding = CsMinsanRegioni#020 "VALLE D'AOSTA"
* address[0].postalCode = "11100"
* address[0].country = "IT"


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
* code from http://terminology.hl7.it/ValueSet/mmgOrPls (required)
// * code from VsMmgPlsRoles (required)



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
* organization = Reference(Organization/asl-020101)
* code = CS_V3ItRoles#MMG

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: PractitionerRoleExample
InstanceOf: PractitionerRole
Description: "Esempio PractitionerRole"

* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "PLLDSR80E47A462P"
* period.start = "2005-04-15"
* practitioner = Reference(Practitioner/PractitionerExample)
* organization = Reference(Organization/asl-020101)
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

/* TO BE REACTIVATED
== */