# Briefing: ChangThai-Schlangenbestellung (Bestell-Kiosk + Küchenanzeige)

Dieses Dokument fasst den Stand zusammen, damit in einem neuen Chat direkt weitergearbeitet werden kann.

## Ausgangslage

- Für Lerchox (Eric) gibt es bereits die Gruppen-Bestell-App **ChangThai-Zmittag**:
  - Live: https://lerchox.github.io/changthai-zmittag/
  - Code: GitHub-Repository `Lerchox/changthai-zmittag` (öffentlich, GitHub Pages)
  - Eine HTML-Datei (`index.html`), PWA mit `manifest.webmanifest`, `sw.js`, Icons (ChangThai-Elefant, Nutzung von ChangThai genehmigt), selbst gehostete Schriften.
  - Wochenmenü zentral in `menu.json` (Gerichte, Fleisch/Vegi mit Preisen klein/gross, Schärfegrade). Wird jeden Montag 07:47 automatisch aus dem Menübild auf changthai.ch aktualisiert.
  - Keine Server, alle Daten nur lokal im Browser.
- Der Inhaber von **ChangThai** (Thai-Foodtruck, Region Sursee/Olten, WhatsApp +41 79 922 33 22) findet die App toll und hat ein neues Anliegen.

## Problem des Inhabers

Kunden können heute erst bestellen, wenn sie vorne am Tresen stehen. Das bremst die Schlange. Besser wäre: Die Leute bestellen schon **während sie anstehen**, und er sieht auf seiner Seite sofort, was er zubereiten muss, ohne nachzufragen (Prinzip wie Bestell-Terminal bei McDonald's).

## Gewählte Lösung

1. **Bestellseite (Kunde)**
   - QR-Code am Truck → Kunde bestellt auf dem **eigenen Handy**.
   - Zusätzlich ein **Tablet** am Truck mit derselben Seite für Leute ohne Handy (Kiosk-Modus, nach jeder Bestellung zurück auf Start).
   - Auswahl wie in der Zmittag-App: Gericht, Fleisch/Vegi, klein/gross, Schärfe (nur **basisscharf, CH-scharf, Thai-scharf**), Anzahl, Vorname.
   - Nach dem Absenden: grosse **Bestellnummer** («Deine Nr. 23») und Status (eingegangen / in Arbeit / fertig).
   - Menü und Preise aus derselben `menu.json` wie die Zmittag-App.
2. **Küchenanzeige (Inhaber)**
   - Auf Handy oder besser einem günstigen Tablet an der Arbeitsfläche.
   - Alle offenen Bestellungen live, gross lesbar, mit **Ton** bei neuer Bestellung.
   - Knöpfe «in Arbeit» und «fertig»; fertige Bestellungen verschwinden aus der Liste.
   - Geschützt (z.B. PIN), damit Kunden sie nicht öffnen können.
3. **Kleiner Server** für den Datenaustausch in Echtzeit
   - Vorschlag: Firebase (Google), Gratis-Stufe reicht für einen Foodtruck. Alternative: Supabase.
   - Internet am Truck über Handy-Hotspot.
4. **Bezahlung bleibt wie heute** am Tresen (TWINT/bar). Keine Online-Zahlung.

## Wichtige Rahmenbedingungen

- **Testen vor Übergabe:** Lerchox will alles selbst testen, bevor er es dem Inhaber gibt. Dafür eine Test-Umgebung (eigenes Firebase-Projekt oder Test-Modus), z.B. Handy = Kunde, PC/zweites Handy = Küche.
- **Datenschutz (Schweizer DSG):** nur Vorname + Bestellung speichern, Bestellungen nach dem Tag automatisch löschen, kurzer Datenschutz-Hinweis auf der Bestellseite.
- **Standorte wechseln täglich** (Büron, Dagmersellen, Sursee, Reiden, Olten). Ein QR-Code für alle Standorte; Bestellungen pro Tag zählen (Nummern starten täglich bei 1).
- **Sprache:** Deutsch (Schweiz), einfache Bedienung, grosse Knöpfe.
- Später möglich: Umzug auf ein GitHub-Konto bzw. eine Adresse von ChangThai (z.B. `bestellen.changthai.ch`). Daher QR-Code erst drucken, wenn die Adresse feststeht.

## Nächste Schritte

1. Prototyp bauen (Bestellseite + Küchenanzeige), zuerst mit Test-Server.
2. Lerchox testet mit zwei Geräten.
3. Anpassungen, dann Vorführung beim Inhaber.
4. Entscheid über definitive Adresse/Konto, dann QR-Code und Tablet-Einrichtung.
