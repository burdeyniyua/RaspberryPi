#!/bin/bash
sudo apt-get update
clear
sudo echo "     @@   @@@   @@    @@@@  @@@@@@@@   @@@@@@   @@@   @@@     @@@@@@@     @@@@@@@     @@@@@@"
sudo echo "     @@   @@@  @@@   @@@@@     @@     @@5  @  @@@@@   @@@     @@@  @@@   @@@   @@5   @@@  @@@"
sudo echo "     @@@ @@ @  @@@   @@ @@@    @@    @@@   @@@  @@@   @@@     @@@   @@@  @@@   @@@   @@"
sudo echo "     @@@ @@ @@ @@   @@@ @@@    @@    @@@        @@@@@@@@@     @@@   @@@  @@    @@@  @@@"
sudo echo "       @@@@ @@@@   @@@@  @@@   @@   @@@@    @@   @@@@@@@@     @@@    @@  @@    @@@  @@@  @@@@"
sudo echo "       @@@@  @@@   @@@@@@@@@   @@   @@@@    @@   @@    @@     @@@    @@  @@    @@@   @@@  @@"
sudo echo "       @@@@  @@@   @@@   @@@   @@     @@    @@   @@    @@     @@@ @@@@@  @@   @@@@  @@@@  @@"
sudo echo "       @@    @@   @@     @@@   @@     @@@@@@@    @@    @@     @@@@@@@      @@@@@@    @@@@@@@"
sleep 2
echo
echo "Загружаем модуль в ядро"
echo
sudo modprobe bcm2708_wdog
sudo sh -c "echo 'bcm2708_wdog' >> /etc/modules"
#Кроме этого, необходимо добавить в начало файла /etc/init.d/mathkernel следующие строки
echo "Создание файла /etc/init.d/mathkernel"
sudo touch /etc/init.d/mathkernel
echo "Writing into /etc/init.d/mathkernel"
echo
sudo chmod 777 /etc/init.d/mathkernel
sleep 2
sudo echo "#!/bin/sh" >> "/etc/init.d/mathkernel"
echo "#!/bin/sh"
sudo echo "### BEGIN INIT INFO" >> "/etc/init.d/mathkernel"
echo "### BEGIN INIT INFO"
sudo echo "# Provides:          mathkernel" >> "/etc/init.d/mathkernel"
echo "# Provides:          mathkernel"
sudo echo "# Required-Start:    $syslog" >> "/etc/init.d/mathkernel"
echo "# Required-Start:    $syslog"
sudo echo "# Required-Stop:     $syslog" >> "/etc/init.d/mathkernel"
echo "# Required-Stop:     $syslog"
sudo echo "# Default-Start:     2 3 4 5" >> "/etc/init.d/mathkernel"
echo "# Default-Start:     2 3 4 5"
sudo echo "# Default-Stop:      0 1 6" >> "/etc/init.d/mathkernel"
echo "# Default-Stop:      0 1 6"
sudo echo "# Short-Description: mathkernel" >> "/etc/init.d/mathkernel"
echo "# Short-Description: mathkernel"
sudo echo "# Description:       This file should be used to construct scripts to be" >> "/etc/init.d/mathkernel"
echo "# Description:       This file should be used to construct scripts to be"
sudo echo "#                    placed in /etc/init.d." >> "/etc/init.d/mathkernel"
echo "#                    placed in /etc/init.d."
sudo echo "### END INIT INFO" >> "/etc/init.d/mathkernel"
echo "### END INIT INFO"
sudo echo "#" >> "/etc/init.d/mathkernel"
echo "#"
sudo echo "# rest of file here" >> "/etc/init.d/mathkernel"
echo "# rest of file here"
echo
sudo chmod 644 /etc/init.d/mathkernel
echo
echo "Установка необходимого софта"
sleep 2
echo
sudo apt-get install watchdog chkconfig
echonl
echo "Включаем Сторожевого пса в загрузку"
echo
sudo chkconfig watchdog on
echo
echo "Запуск сервиса Сторожевого пса"
echo
sudo service watchdog start
#Удаляем строку содержащую точку монтирования, что бы создать ее и разкоментировать
sudo sed -i '23d' /etc/watchdog.conf
#Запишем эту строчку - в итоге получается разкоментируем ее
sudo sed -i '22awatchdog-device	= /dev/watchdog' /etc/watchdog.conf
sudo sed -i '10d' /etc/watchdog.conf
sudo sed -i '22amax-load-1 = 24' /etc/watchdog.conf
echo
echo "Укажем параметры загрузки в ядро"
echo
echo "options bcm2708_wdog nowayout=1 heartbeat=13" | sudo tee /etc/modprobe.d/watchdog.conf
echo "Скрипт окончен"
echo
sudo echo "     @@   @@@   @@    @@@@  @@@@@@@@   @@@@@@   @@@   @@@     @@@@@@@     @@@@@@@     @@@@@@"
sudo echo "     @@   @@@  @@@   @@@@@     @@     @@5  @  @@@@@   @@@     @@@  @@@   @@@   @@5   @@@  @@@"
sudo echo "     @@@ @@ @  @@@   @@ @@@    @@    @@@   @@@  @@@   @@@     @@@   @@@  @@@   @@@   @@"
sudo echo "     @@@ @@ @@ @@   @@@ @@@    @@    @@@        @@@@@@@@@     @@@   @@@  @@    @@@  @@@"
sudo echo "       @@@@ @@@@   @@@@  @@@   @@   @@@@    @@   @@@@@@@@     @@@    @@  @@    @@@  @@@  @@@@"
sudo echo "       @@@@  @@@   @@@@@@@@@   @@   @@@@    @@   @@    @@     @@@    @@  @@    @@@   @@@  @@"
sudo echo "       @@@@  @@@   @@@   @@@   @@     @@    @@   @@    @@     @@@ @@@@@  @@   @@@@  @@@@  @@"
sudo echo "       @@    @@   @@     @@@   @@     @@@@@@@    @@    @@     @@@@@@@      @@@@@@    @@@@@@@"
echo
