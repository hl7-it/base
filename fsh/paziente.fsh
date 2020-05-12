//============== ALIAS ===============

Alias: COV_TYP = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: professioniPaziente = http://hl7.it/fhir/ValueSet/professione-patient-it


//=========================

//====== Estensione =====================================
Extension:   ProfessionePazienterofessionePaziente
Id:          patient-professione-it
Title:       "Professione del paziente"
Description: "Estensione per gestire la professione del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
* valueCodeableConcept from professioniPaziente (preferred)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Extension:   TitoloStudioPaziente
Id:          patient-titoloStudio-it
Title:       "Titolo di Studio del paziente"
Description: "Estensione per gestire il Titolo di studio del paziente come CodeableConcept"
//-------------------------------------------------------------------------------------------
* value[x] only CodeableConcept
// * valueCodeableConcept from StatoEsenzioneV3ActStatus (required)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
