Det här är en fil för programmet Docker, som används för att automatiskt bygga virtuella maskiner. Tanken är att den med hjälp av robotar o.s.v. ska bygga färdiga virtuella maskiner att använda för hemläxor i IOOP/M HT 2015 där alla Batterier Ingår™.

För att kunna köra den behöver du först installera och komma igång med Docker. Hur du gör det kan du läsa om [i deras manual](https://docs.docker.com/windows/started/). I instruktionerna ingår instruktioner för hur man bygger en Docker-avbild. Samma metod fungerar för att bygga den här koden:  `docker build -t ioopm-docker .`.

Sedan kör du med `docker run -v "%HOMEPATH%/Work":/home/ioopm-user/Work -it ioopm-docker`. Det kommandot fungerar bara på Windows. Argumentet -v sätter upp en delad volym. Om du inte kör det kommer Docker att kasta bort allt du skriver mellan varven! Mappen Work delas mellan din dator och Docker-instansen.

Om du kör Unix redan kan du byta ut `%HOMEPATH%/Work` mot `$USER/Work`. I båda fallen förutsätter detta förstås att den mappen (på Windows C:\Users\dittnamn\Work) finns. Om mappen inte finns kommer Docker att skapa den -- men som fel användare (beroende på konfiguration).

**DÖDSBLODSVARNING! Allt som du lägger någon annanstans än i Work-mappen i /home/ioopm-user kommer att försvinna när du stänger av Docker!**

Saker som ingår:
- Zsh (som standard)
- Kursrepot från Git
- Git
- Emacs 24 med standardkonfigurationen [emacs-live](https://github.com/overtone/emacs-live).
- En vanlig Ubuntu-konfiguration
- Make, GCC etc.
- Valgrind, cflow och GDB
