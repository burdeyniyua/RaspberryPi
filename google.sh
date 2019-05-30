#!/bin/bash
clear
echo
echo "Прежде чем выполнять данный скрипт необходимо зарегестрироваться на сайте  http://dav-pocket.appspot.com/"
echo "Необходимо зарегестрироваться и нажать на кнопочку  \"Authorize DAV-pocket service\""
echo "Это действие запросит у Вас доступ к аккаунту гугла."
echo "Это очень важно"
echo "так как именно логин и пароль с этого сайта нужны для подключения диска гугла к малинке..."
echo
read -n 1 -p "Ты уверен, что хочешь запустить скрипт, который присоеденит GoogleDrive к твоей Малине (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2
sudo apt-get update
clear
echo
echo "                                          @@@@H@@@@@     @@@@9@@@@@@  "
echo "                                        @H**********h@  @***********@  "                                      
echo "                                        @@****@******H@@*******9****@ "                                       
echo "                                         @*******@****@@***9@******@@ "                                       
echo "                                         @@********@3@@@@@&*******@@ "                                        
echo "                                           @*******@@@@@@@*******@@  "                                        
echo "                                            @@@*@@@@@@@@@@@@@**@@    "                                        
echo "                                            @@   h@       @    @@    "                                        
echo "                                          @@    @@@        @@    @@  "                                        
echo "                                          @   @@@@@@@@  @@@@@@@   @  "                                        
echo "                                          @G@@@      @@@h     A@@ @  "                                        
echo "                                        @@ @@@        @@         @@ @@"                                        
echo "                                       @@  @@         @@        @@  B@"                                       
echo "                                       @   @@        @@@        @@   @"                                       
echo "                                       @   @@@      @@@@@      h@@   @"                                       
echo "                                       @@  @@@@@@@@@      @@@@@@@@A @@"                                       
echo "                                        @@@   @@@@h        @@@@    @@ "                                       
echo "                                         @      @@         @@       @"                                         
echo "                                         @@      @         @       @ "                                        
echo "                                          @      @@@      @@      @@ "                                        
echo "                                           @@    @@@@@@@@@@@    @@  "                                         
echo "                                             @@@@@@        @@@@@ "                                            
echo "                                                @@@       @@@ "                                               
echo "                                                   @@@@@@@@ "
echo
#echo "Название Wi-fi сети по-умолчанию \"$ssid\""
#echo -e "Ввдедите название для будущей сети wifi.  Ssid:= \c "
#read ssid
#echo
#echo "Введите полный путь и имя папки для GooleDrive:"
echo "default /home/\"$USER\"/GDrv"
echo -e "Введите полный путь и имя папки для GooleDrive:= \c"
read folder
echo
echo -e "Введите Логин на сайте http://dav-pocket.appspot.com/ Login:= \c"
read davlogin
echo
echo -e "Введите пароль для \"$davlogin\" на сайте http://dav-pocket.appspot.com/ Password:= \c"
read davpass
echo
#Установим davfs2:
echo "Установим davfs2:"
echo
sudo apt-get install davfs2
#Перенастроим пакет davfs2
echo "Перенастроим пакет davfs2"
echo "Нажми ДА"
sleep 3
sudo dpkg-reconfigure davfs2
echo
#Добавим нашего пользователя в группу davfs2
echo "Добавляем пользователя \"$USER\" в группу davfs2"
sudo usermod -aG davfs2 $USER
echo
#Создадим папку, куда будет монтироваться наше облако.
#echo "Создадим папку, куда будет монтироваться наш ГуглДрайв."
echo "Создается папка \"$folder\""
#Delete folder if alredy exist
sudo rm -r $folder
sudo mkdir $folder
echo
#Настроим параметры авторизации.
echo "Настроим параметры авторизации."
sudo chmod 777 /etc/davfs2/secrets
sudo echo "https://dav-pocket.appspot.com/docso \"$davlogin\" \"$davpass\"" >> "/etc/davfs2/secrets"
sudo echo "https://dav-pocket.appspot.com/docso \"$davlogin\" \"$davpass\""
sudo chmod 644 /etc/davfs2/secrets
echo
#Настраиваем автоматическое монтирование.
echo "Настраиваем автоматическое монтирование."
sudo chmod 777 /etc/fstab
sudo echo "https://dav-pocket.appspot.com/docso \"$folder\" davfs uid=1000,user,rw,_netdev 0 0" >> "/etc/fstab"
sudo chmod 644 /etc/fstab
echo
echo "                                                                                ,252h5                    
             r5X2:  .i3X5SS                                                       hGA
           s5S           339                                                      hG&
         SSX             h;                                                       G&&
        S5X                                                                       G&A
       ;5XX                       :5X, ,325S        rS.  ;iss        SX2X5SSX3.   G&A      S2. iX52
       55Xr                      i3       9X3     ;i       Siii    iX     X2X     &&A    i2      X3h
       22X5                     iX         933   rsS        5iSi  S2i      XXX    &&A   S5X     3G5
       222X                    253         h39h .rii         SS2  223      2X3    &&A   523.33r
       .X22.          :25Si5XS XX3,         9hG ,iiS         SSX  322      X9:    &&A   X23
        3X22             i33h  ;3X3         9G   5iS.        iX5   X3XX  .5X      &&A   33XX
         X3X2X           S339   S933       9G:    25S       sXS         52S       &&A    99XX
           93322         i9hh     &h9;   ih9       rX2S   :5X           XX2X     5HHA5.   ,Gh93XX292
             ;h993XX22X39hi.         ,;;                            s223993X2X               .rs;
                                                                 sS9       S3X3
                                                                55X          33
                                                                XXX          32
                                                                 93XX      i3;
                                                                   ,9999hX:
 
You mast restart your Device.
После перезагрузки папка \"$folder\" должна быть примонтирована как GoogleDrive
Скрипт закончен"
