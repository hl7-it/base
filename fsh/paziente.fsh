//============== ALIAS ===============

Alias: COV_TYP = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: CS_professioni = http://terminology.hl7.it/CodeSystem/istat-professioni
Alias: CS_titolo = http://example.org/qualification
Alias: professioniPaziente = http://hl7.it/fhir/ValueSet/professione-patient-it
Alias: Translation = http://hl7.org/fhir/StructureDefinition/translation

//=========================

//====== Estensione =====================================
Extension:   ExtProfessionePaziente
Id:          patient-occupation-it
Title:       "Professione del paziente"
Description: "Estensione per gestire la professione del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from professioniPaziente (preferred)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Extension:   ExtTitoloStudioPaziente
Id:          patient-qualification-it
Title:       "Titolo di Studio del paziente"
Description: "Estensione per gestire il Titolo di studio del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
// * valueCodeableConcept from StatoEsenzioneV3ActStatus (required)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Instance: esempio-professione
InstanceOf: Patient
Description: "Patient: professione e titolo di studio"
* extension[ExtProfessionePaziente].valueCodeableConcept = CS_professioni#medico
* extension[ExtTitoloStudioPaziente].valueCodeableConcept = CS_titolo#laurea
* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "RSSMRT57D12D612R"
* name.family = "Rossi"
* name.given = "Martino"


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 /*  INIT COMMENTO
Instance: es-trad
InstanceOf: Patient
Description: "Patient: esempio translitterazione del nome"
* identifier[0].system = "http://hl7.it/sid/codiceFiscale"
* identifier[0].value = "DSRPLL71A41L219U"
* name.family = "Désirée"
* name.family.extension["http://hl7.org/fhir/StructureDefinition/translation"].extension["lang"].valueCode = #it-ascii
* name.family.extension[Translation].extension[content].valueString = "Desiree"
* name.given.extension[Translation].lang = #it-ascii
* name.given.extension[Translation].content = "Pelle'"
* name.given = "Pellè"
* gender = #female
 */