# Team Activity Summarizer
## 📖 User Guide

Questo strumento legge il file Excel in cui il team elenca i task completati e, usando l'IA, redige automaticamente dei riassunti narrativi (non semplici elenchi puntati), salvandoli in un documento Word ordinato.

Questa guida ti spiegherà tutto ciò che devi sapere per usarlo in modo semplice e privo di errori.

---

### 1. 📂 Struttura della Cartella

Per non creare confusione, nella cartella principale (questa dove ti trovi ora) vedrai solo tre cose:

1. **Il file Excel**: (es. `A_Team meeting what how who file.xlsx`) - Il file con i dati del team.
2. **run_summarizer.bat**: L'eseguibile da cliccare due volte per avviare il processo.
3. **README.md**: Questo documento guida che stai leggendo.

C'è una cartella nascosta "dietro le quinte" chiamata `src` che contiene tutto il codice sorgente (il motore del software). **Non spostare o rinominare la cartella `src` o i file al suo interno.**

---

### 2. 📝 Regole per il file Excel Input

Affinché il programma funzioni correttamente, devi seguire **due regole d'oro**:

**Regola N.1 - Nome del file:**
Il file Excel **DEVE** chiamarsi esattamente come impostato nel programma. Attualmente, il programma cerca un file chiamato: 
`A_Team meeting what how who file.xlsx`
(Se vuoi rinominare il file Excel nel futuro, dovrai aprire il file `src/config.json` e aggiornare la voce `"excel_file"`).

**Regola N.2 - Posizione del file:**
Il file Excel deve trovarsi **nella stessa cartella del file `run_summarizer.bat` e di questo README**. Non deve essere messo nella cartella `src` né in altre sottocartelle.

**Regola N.3 - Struttura Interna (Colonne):**
Il file Excel deve avere **obbligatoriamente** queste due colonne (scritte esattamente così):
1. **`Person`**: Contiene il nome del dipendente (es. Charlotte).
2. **`Questions`**: Contiene le domande del file originale. Lo script andrà a cercare per ogni persona la riga che contiene la dicitura **`what I have done`** (lo script capisce anche se lo scrivi tutto in maiuscolo o minuscolo).

Una volta presenti queste due colonne, tutte le altre colonne contenenti le date (es. `01/01/2026`, `08/01/2026`) verranno lette automaticamente e le celle compilate saranno estratte per i riassunti!

---

### 3. 🚀 Come avviare la Generazione dei Sommari

1. Assicurati che l'ultimo documento Excel (`A_Team meeting what how who file.xlsx`) sia aggiornato e salvato nella cartella principale.
2. Assicurati che il file Word precedente (`Team_Activity_Summaries.docx`) sia **chiuso**, altrimenti il sistema non avrà il permesso di sovrascriverlo.
3. Fai **doppio clic** sul file **`run_summarizer.bat`**.

Si aprirà una finestra nera del terminale. Potrai monitorare il processo, che ti dirà quante persone ha trovato e ti mostrerà lo stato di generazione del riassunto per ogni dipendente. 

⚠️ **Nota:** A ogni richiesta l'API impiega qualche secondo. Con 22 persone, il completamento impiegherà probabilmente tra 1 e 2 minuti.

Al termine, ti chiederà di "Premere un tasto per continuare". A quel punto potrai chiudere la finestra e troverai il tuo file Word `Team_Activity_Summaries.docx` pronto nella cartella principale!

---

### 4. ⚙️ Vuoi Modificare un Modello IA o Chiave?

Se devi cambiare l'Api Key di OpenRouter o il modello testuale che stai usando:
1. Apri la cartella `src`
2. Apri il file `config.json` (puoi usare il Blocco Note)
3. Modifica la `"openrouter_api_key"` o `"model"` lasciando inalterata la punteggiatura (`{`, `}`, e le virgolette `"`).
