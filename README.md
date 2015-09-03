## Översikt ##
Jag ser fem alternativ:
1. Sätt upp [MinGW](http://www.mingw.org/wiki/howto_install_the_mingw_gcc_compiler_suite) och Emacs på Windows.
2. Dual-boota med en Unix på din egen dator eller SSH:a in till skolan
3. Installera en egen virtuell maskin, t.ex. m.h.a. VirtualBox.
4. Använd det här repots Vagrant-fil för att bygga en virtuell maskin.
5. Använd det här repots Docker-fil för att bygga en virtuell maskin.

Det absolut enklaste är antagligen alt. 2 eller 3. Tyvärr har både Docker och Vagrant viktiga begränsningar som gör att de inte fungerar så bra för den här typen av lösningar. I Dockers fall är de strukturella, i Vagrants fall verkar det bero på att utvecklarna är sämst.

## Alt. 3: Egen virtuell maskin ##
Det är inte en guide för att sätta upp en virtuell maskin, men när du väl har lyckats så kan du köra alla apt-get-kommandona i filen `bootstrap.sh` för att installera rätt saker. Du kan också kopiera in konfigurationsfilen för zsh (zshrc) till din hemmapp men med namnet .zshrc och sedan byta skal till zsh med `chsh --shell /usr/bin/zsh dinanvändare`.
## Alt. 4: Vagrant ##
Först måste du installera Vagrant och VirtualBox. **Observera att Vagrant har en bugg på windows som gör att det inte fungerar om sökvägen eller maskinen innehåller ett svenskt tecken.**

1. Ladda ner det här repot som zip (eller klona det).
2. I en kommandoprompt (cmd.exe eller PowerShell), ställ dig i mappen du hämtade Vagrantfile (och de andra) i och kör `vagrant init` följt av `vagrant up` (när den är klar).
3. Se [den här guiden](http://www.sitepoint.com/getting-started-vagrant-windows/) för hur man loggar in.
## Alt. 5: Docker ##
För att kunna köra den behöver du först installera och komma igång med Docker. Hur du gör det kan du läsa om [i deras manual](https://docs.docker.com/windows/started/). I instruktionerna ingår instruktioner för hur man bygger en Docker-avbild. Samma metod fungerar för att bygga den här koden:  `docker build -t ioopm-docker .`.

Sedan kör du med `docker run -v "%HOMEPATH%/Work":/home/ioopm-user/Work -it ioopm-docker`. Det kommandot fungerar bara på Windows. Argumentet -v sätter upp en delad volym. Om du inte kör det kommer Docker att kasta bort allt du skriver mellan varven! Mappen Work delas mellan din dator och Docker-instansen.

Om du kör Unix redan kan du byta ut `%HOMEPATH%/Work` mot `$USER/Work`. I båda fallen förutsätter detta förstås att den mappen (på Windows C:\Users\dittnamn\Work) finns. Om mappen inte finns kommer Docker att skapa den -- men som fel användare (beroende på konfiguration).

**DÖDSBLODSVARNING! Allt som du lägger någon annanstans än i Work-mappen i /home/ioopm-user kommer att försvinna när du stänger av Docker!**

Standardlösenordet för den nya användaren är alohomora. Om du tänker nätverka din Docker-maskin, *BYT DET*!

Saker som ingår:
- Zsh (som standard)
- Kursrepot från Git
- Git
- Emacs 24 med standardkonfigurationen [emacs-live](https://github.com/overtone/emacs-live).
- En vanlig Ubuntu-konfiguration
- Make, GCC etc.
- Valgrind, cflow och GDB
- Manualsidor

Saker att testa
- gdb i Emacs! Kör M-x gdb följt av M-x gdb-many-windows!
- yasnippet! prova att skriva mai och trycka tabb i en C-fil!

Errata/Att fixa:
- smidigt sätt att ha en beständig egen Emacs-conf
- möjlighet att plugga in sin egen kurs-repo/redovisningsgit och få den hämtad vid uppstart
- lämpliga förinställningar för att bygga C-program i Emacs
