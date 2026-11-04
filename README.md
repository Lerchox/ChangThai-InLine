# ChangThai bestellen

Bestellseite für den Foodtruck ChangThai: Kunden scannen den QR-Code am Truck und bestellen schon beim Anstehen. Bezahlt wird am Tresen.

- `index.html` – Kundenseite (`#kunde`), Tablet-Kiosk (`?kiosk`), Küchenanzeige (`#kueche`, mit PIN)
- `menu.json` – Kopie des Wochenmenüs; geladen wird zuerst das Menü der Zmittag-App
- Testmodus, solange `FIREBASE = null`: Bestellungen bleiben im Browser (zwei Tabs: Kunde und Küche, PIN 1234)
- `tools/build-artifact.sh` – Testversion für die Claude-Vorschau
