### Scopo

Raccogliere i profili [HL7 FHIR](http://hl7.org/fhir) base sviluppati da
[HL7 Italia](http://hl7.it) e le principali risorse (e.g. modelli
logici, value set, code system) da usarsi trasversalmente in vari
scenari di uso.

### Introduzione

Questa guida raccoglie i profili [HL7 FHIR](http://hl7.org/fhir) base
sviluppati da [HL7 Italia](http://hl7.it), identificati come ***Profili
FHIR IT Base***, e le principali risorse (e.g. modelli logici, value
set, code system) da usarsi trasversalmente in vari scenari di uso.

I profili proposti sono stati sviluppati a partire da una serie di
***Modelli Logici***, rappresentati come HL7 FHIR logical model, inclusi
in questa guida che fungeranno da guida per altre possibili
rappresentazioni non FHIR.

Una esplicita mappatura fra gli elementi dei modelli logici e la loro
rappresentazione in FHIR è fornita in questa guida nel tab *Mapping*.

### Caveat

I *Profili FHIR IT base* presenti in questa guida hanno come loro
principale scopo quello di facilitare una rappresentazione comune di
informazioni tipicamente usate nel contesto italiano. In questo senso:

  - non pretendono di rappresentare ogni possibile informazione
    associabile alle classi rappresentate e potenzialmente di interesse
    in specifici scenari d’uso (e.g. colore dei capelli della persona);

  - né di definire un set minimo comune di dati.

Future guide definiranno ulteriori vincoli da applicarsi a questi
profili per specifici casi d'uso (e.g. Patient Summary; accesso del
Paziente alle proprie informazioni).

Le terminologie (i.e. i code system) di terze parti (e.g. tabelle ISTAT,
codici ministeriali) incluse in questa versione della guida sono fornite
per fini esplicativi, non costituiscono un riferimento ufficiale per le
terminologie in oggetto. Le condizioni di uso per le terminologie
esterne usate sono descritte in [Copyright](copyright.html).

### Contenuti della guida

<table>
<tbody>
<tr class="odd">
<td><p><img src="home-1.png" style="width:5.17551in;height:2.70307in" /></p>
<p>Figura 1 – Contenuti dell’Implementation Guide HL7 FHIR IT Base</p></td>
<td><p>Questa guida include principalmente tre tipologie di artefatti:</p>
<ol type="1">
<li><p>I <strong>Modelli Logici</strong>: che descrivono il contenuto atteso per le diverse classi informative (e.g. Paziente), indipendentemente dalla loro rappresentazione fisica. I modelli sono formalizzati come modelli logici FHIR, ma la loro implementazione potrebbe non essere realizzata necessariamente in FHIR</p></li>
<li><p>I <strong>Profili</strong>: che descrivono come rappresentare in HL7 FHIR le informazioni incluse nei modelli logici</p></li>
<li><p>Le <strong>Terminologie</strong> che includono sistemi di codifica (<a href="https://www.hl7.org/fhir/codesystem.html"><em>Code System</em></a>); liste di valori (<a href="https://www.hl7.org/fhir/terminologies-valuesets.html"><em>Value Set</em></a>) e mappe concettuali (<a href="https://www.hl7.org/fhir/terminologies-conceptmaps.html"><em>Concept Map</em></a>).</p></li>
</ol></td>
</tr>
</tbody>
</table>

I *modelli logici* documentano anche come i singoli elementi dei modelli
siano mappati nei diversi *profili FHIR* (**Model** **Mapping**).

Con *Profili* si intendono in questa guida:

1.  risorse FHIR profilate

2.  Estensioni e loro specializzazioni

3.  Datatype profilati

I profili tipicamente descrivono quali artefatti terminologici usare e
come (**Vocabulary Binding**)

### Struttura della guida

Le principali sezioni di questa guida sono:

  - [Questa pagina](index.html) – definisce il contesto di questa guida

  - Background - fornisce le informazioni che gli implementatori
    dovrebbero conoscere prima di leggere il resto dell'IG. Include due
    pagine:
    
      - [Metodologia](methodology.html) – descrive l’approccio
        metodologico seguito.
    
      - [Principi e disegno](design.html) - definisce alcuni principi di
        disegno e come interpretare correttamente alcuni elementi usati
        nei profili (e.g. mustSupport, slicing)

  - [Indice Artefatti](artifacts.html) – lista tutti gli artefatti FHIR
    inclusi in questa guida

  - [Downloads](downloads.html) - consente di scaricare una copia di
    questa guida ed altre informazioni utili

  - [Copyright](copyright.html) – specifica le condizioni d’uso di
    questa guida e di alcune terminologie referenziate

### Autori e Contributori

<table>
<thead>
<tr class="header">
<th>Ruolo</th>
<th>Nome</th>
<th>Organizzazione</th>
<th>Contatto</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Autore</td>
<td>Giorgio Cangioli</td>
<td>Consulente</td>
<td>giorgio.cangioli_at_gmail.com</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>Contributore</td>
<td>Elena Vio</td>
<td>Arsenàl.IT</td>
<td>evio_at_consorzioarsenal.it</td>
</tr>
<tr class="even">
<td>Contributore</td>
<td>Ivano Christian Tomainu</td>
<td>Insiel S.p.A.</td>
<td>ivano.tomainu_at_insiel.it</td>
</tr>
<tr class="odd">
<td>Contributore</td>
<td>Paola Lupieri</td>
<td>Insiel S.p.A.</td>
<td>paola.lupieri_at_insiel.it</td>
</tr>
<tr class="even">
<td>Contributore</td>
<td>Stefano Terreni</td>
<td>Insiel S.p.A.</td>
<td>stefano.terreni_at_insiel.it</td>
</tr>
<tr class="odd">
<td>Contributore</td>
<td>Flavio Mucchiut</td>
<td>Insiel S.p.A.</td>
<td>flavio.mucchiut_at_insiel.it</td>
</tr>
<tr class="even">
<td>Contributore</td>
<td>Luca Del Col</td>
<td>IN. VA. S.p.A.</td>
<td>ldelcol_at_invallee.it</td>
</tr>
<tr class="odd">
<td>Contributore</td>
<td>Davide Corallo</td>
<td>CSI Piemonte</td>
<td>davide.corallo_at_csi.it</td>
</tr>
<tr class="even">
<td>Contributore</td>
<td>Luigi Enrico Maccolini</td>
<td>Umbria Digitale</td>
<td>luigi.maccolini[at]umbriadigitale.it</td>
</tr>
<tr class="odd">
<td>Contributore</td>
<td>Mario Ciampi</td>
<td>CNR ICAR</td>
<td>mario.ciampi_at_icar.cnr.it</td>
</tr>
</tbody>
</table>
