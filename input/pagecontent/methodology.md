### Approccio generale

Questa guida viene sviluppata seguendo un approccio **iterativo** ed
**incrementale**.

<table>
<tbody>
<tr class="odd">
<td><p><img src="method-1.png" style="width:6.33265in;height:3.44556in" /></p>
<p>Figura 1 - Approccio generale</p></td>
</tr>
</tbody>
</table>

1.  I **requisiti** funzionali sono raccolti, discussi e formalizzati
    come FHIR logical models (**Modelli Logici**)

2.  Il contenuto informativo dei modelli viene poi mappato su una
    rappresentazione fisica basata sullo standard HL7 FHIR, attraverso
    una serie di **profili** e **vocabolari** FHIR.

3.  Questi artefatti FHIR saranno quindi **preadottati** ed utilizzati
    in sessioni di prova (**-a-thon**), i cui risultati saranno usati
    per il miglioramento della qualità della guida stessa.

4.  Una volta consolidati gli artefatti saranno **pubblicati** nella
    loro forma finale, e **adottati** per implementazioni e/o per
    derivare altre guide.

5.  Le informazioni di ritorno provenienti dagli utilizzatori saranno
    infine usate per **manutenere** questi artefatti

### Ambienti di pubblicazione

La pubblicazione degli artefatti prodotti, incluso questa implementation
guide, avviene potenzialmente in tre ambienti diversi (Figura 2 -
Ambienti di pubblicazione):

1.  un ambiente di prova, denominato **sandbox**, in cui sono pubblicati
    i risultati delle prime prototipazioni, non necessariamente legate
    ad una specifica implementation guide. Quest’ambiente potrebbe non
    essere più usato durante la manutenzione di una specifica guida.

2.  un ambiente di sviluppo, **build**, in cui viene pubblicata l’ultima
    versione registrata in *GitHub*. Infine,

3.  un ambiente di rilascio (**produzione**) in cui sono pubblicate le
    versioni consolidate, tipicamente post-ballot.

<table>
<tbody>
<tr class="odd">
<td><blockquote>
<p><img src="method-2.png" style="width:3.78163in;height:2.82007in" /></p>
<p>Figura - Ambienti di pubblicazione</p>
</blockquote></td>
</tr>
</tbody>
</table>

### Ciclo di vita

Negli ambienti di sviluppo e di produzione sono pubblicati le guide nei
loro diversi “gradi di conformità”, e.g. Standard for Trial Use,
Normativa.

Figura 3 mostra un caratteristico ciclo di vita di una guida:

1.  In una prima fase prototipale gli artefatti sono condivisi nel
    sandbox senza alcuna precisa loro caratterizzazione.

2.  Quindi, a meno di non avere una guida di tipo informativo, viene
    preparata una prima pubblicazione come ***Standard for Trial Use**.*
    Tale stato indica una pubblicazione che ha passato varie fasi di
    review, ma che non ha ancora una sufficiente maturità per essere
    considerata definitiva. La maturità viene in questo caso misurata
    anche in termini di reali adozioni.

3.  Quando la guida ha raggiunto un sufficiente livello di maturità, a
    valle anche di eventi tipo -a-thon, viene pubblicata come guida
    ***Normativa.***

<table>
<tbody>
<tr class="odd">
<td><p><img src="method-3.png" style="width:6.11514in;height:1.73061in" /></p>
<p>Figura – Ciclo di vita e versioni di una guida</p></td>
</tr>
</tbody>
</table>

Indipendentemente dalla loro tipologia, le guide sono soggette ad un
processo di manutenzione e continuo aggiornamento, ogni versione
pubblicata è caratterizzata da una *versione esterna* (e.g. STU; STU2;
R1; R1.1) e da un *semantic version, cioè* da un numero di versione
interna (e.g. 0.0.1; 2.0.1). Per ogni versione esterna è possibile avere
più semantic version.

Una pubblicazione STU è sempre associata ad una specifica release,
nell’esempio della figura STU deve essere letto come Release 1, STU 1.

In presenza di una versione pubblicata come normativa (e.g. Rel. 1.2) è
possibile che una versione STU (e.g. Release 2, STU1) venga sviluppata
come evoluzione della precedente guida.
