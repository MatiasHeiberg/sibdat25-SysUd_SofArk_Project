---
sortKey: 8.53858
section: Iteration 2
created: 2026-03-20
exclude: false
---
Vi har gjort vores composite pattern generisk sådan at den ikke kun kan samle "vehicle" repositories men er åben for at kunne lave nye kompositter i fremtiden. Den overholder Open/Closed princippet. Denne beslutning medførte en udfordring med type sikkerheden. I vores domæne er visse domæne klasser relateret og andre ikke, derfor skulle vi sikre at kompositten ikke kunne lave en samling af (eksempelvist) Employee- og Car objekter. For at implementere denne begrænsning (business rule) har vi brugt generic covariance til at sikre at Car og Bike objekter kan samles da de begge implementere IVehicle, men ikke med Employee da den ikke er del af samme nedarvningstræ. Dette er muligt fordi covariance tillader kompileren at behandle Car og Bike som den samme type uden at bruge IVehicle objekter. 