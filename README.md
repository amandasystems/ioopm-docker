Det här är en fil för programmet Docker, som används för att automatiskt bygga virtuella maskiner. Tanken är att den med hjälp av robotar o.s.v. ska bygga färdiga virtuella maskiner att använda för hemläxor i IOOP/M HT 2015 där alla Batterier Ingår™.

För att kunna köra den behöver du först installera och komma igång med Docker. Hur du gör det kan du läsa om [i deras manual](https://docs.docker.com/windows/started/). I instruktionerna ingår instruktioner för hur man bygger en Docker-avbild. Samma metod fungerar för att bygga den här koden:  `docker build -t ioopm-docker .`.

Sedan kör du med docker `run -it ioopm-docker`.

Saker som ingår:
- Zsh (som standard)
- Kursrepot från Git
- Git
- Emacs 24 med standardkonfigurationen [emacs-live](https://github.com/overtone/emacs-live).
- En vanlig Ubuntu-konfiguration
- Make, GCC etc.
- Valgrind, cflow och GDB
