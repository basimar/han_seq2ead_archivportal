#!/bin/bash
cd output/validation
rm -r swa
rm -r gosteli

zip Basel-UB.zip *Basel-UB_*

mkdir swa
mv *Basel-UB-Wirtschaft* swa/
cd swa
grep -lP 'corpname.*Aktenbildner' *.xml | xargs -r zip Basel-SWA-CORP.zip
grep -lP 'corpname.*Aktenbildner' *.xml | xargs -r rm 
grep -lP 'persname.*Aktenbildner' *.xml | xargs -r zip Basel-SWA-PERS.zip
grep -lP 'persname.*Aktenbildner' *.xml | xargs -r rm 
zip Basel-SWA-REST.zip *.xml
rm *.xml
cd ..

mkdir gosteli
mv *Bern-Gosteli* gosteli/
cd gosteli
zip Bern-Gosteli-BIO.zip ead_CH-001880-7_Bern-Gosteli-Archiv_biografische_notizen.xml
rm ead_CH-001880-7_Bern-Gosteli-Archiv_biografische_notizen.xml
grep -lP 'corpname.*Aktenbildner' *.xml | xargs -r zip Bern-Gosteli-CORP.zip
grep -lP 'corpname.*Aktenbildner' *.xml | xargs -r rm 
grep -lP 'persname.*Aktenbildner' *.xml | xargs -r zip Bern-Gosteli-PERS.zip
grep -lP 'persname.*Aktenbildner' *.xml | xargs -r rm 
zip Bern-Gosteli-REST.zip *.xml
rm *.xml
cd ..

zip Bern-UB-Medizing.zip *Bern-UB-Me*

zip Bern-UB-SOB.zip *Bern-UB-Schwe*

zip Bern-UB-MGA.zip *Bern-UB-Bibliothek-M*

zip Aargau-KB.zip *KB-Aargau*

zip Thurgau-KB.zip *KB-Thurgau*

zip Appenzell-KB.zip *KB-Appen*

zip Luzern-ZHB.zip *Luzern-ZHB*

zip Solothurn-ZB.zip *Solothurn-ZB*

zip StGallen-SB.zip *St-Gallen-Stif*

zip StGallen-KB.zip *St-Gallen-KB*

zip Zofingen-SB.zip *Zofingen-SB*

