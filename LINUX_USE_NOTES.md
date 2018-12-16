# Общие заметки по Linux

## Терминал gnome

Чтобы работал стандартный терминал гнома

    sudo locale-gen
    localectl set-locale LANG="en_US.UTF-8"

А вообще лучше установить guake и запихнуть его в автозапуск следующим образом

    sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/


## Настройка времени

Устанавливаем пакет ntp:

    sudo pacman -S ntp

запускаем синхронизацию:

    sudo ntpd -qg

пишем в часы биоса:

    sudo hwclock --systohc


## Настройка скорости мыши

Для начала наужно избавится от пакета xf86-input-libinput чтобы икссервер использовал xf86-input-evdev

    sudo pacman -R xf86-input-libinput

Чтобы настройки не сбрасывались нужно создать файл с расширением .desktop в директории /etc/xdg/autostart/ со следующим содержанием:

    [Desktop Entry]
    Name=Disable mouse acceleration
    Exec=xset m 0/0 0
    Type=Application


## Интересные утилиты

Для скриншотов есть кайфовый пакетик

    sudo pacman -S deepin-screenshot

Так же необходим git для гихаба и wget для таскания файлов по хттп из консоли

    sudo pacman -S git wget


## Yaourt

Если при установке какого-либо пакета с помощью yaourt возникает ошибка

    (unknown public key <key>)
    ==> ERROR: One or more PGP signatures could not be verified!

Нужно обновить ключи:

    gpg --keyserver keys.gnupg.net --recv-keys <key>

А потом снова запускать установку этого пакета


## vmware

После добавления модулей в ядро может перестать работать vmware.
Тогда нужно пересобрать модули vmware следующей командой

    sudo vmware-modconfig --console --install-all


## Создание загрузочной флешки с win 7/10

Установить gparted:

    sudo pacman -S gparted

Установить ms-sys из AUR'а:

    yaourt -S ms-sys

Запускается gparted.
Форматируется /dev/sdx1 в ntfs.
Ставится флаг boot. далее загружается MBR и монтируется образ и флешка:

    sudo ms-sys -7 /dev/sdx
    sudo mount /dev/sdx1 /mnt/usb
    sudo mount -o loop ~/Documents/win.iso /mnt/iso

Копируется содержимое образа на флешку:

    sudo cp -av /mnt/iso /mnt/usb

Размонтируем флешку и готово:

    sudo umount /mnt/usb


## Автоперенос строк в nano

Чтобы его отключить:

    sudo nano /etc/nanorc

А потом раскомментировать там строку:

    # set nowrap


# i3

## Языки ввода

Чтобы установить раскладку клавиатуры на ctrl+shift надо писать в файл /etc/X11/xorg.conf.d/00-keyboard.conf следующие строки:

    Section "InputClass"
            Identifier "system-keyboard"

            MatchIsKeyboard "on"
            Option "XkbLayout" "us,ru"
            Option "XkbVariant" ","
        Option "XkbOptions" "grp:ctrl_shift_toggle"
    EndSection


## Logout

В конце файла ~/.i3/config дописываем

    bindsym Mod4+l exec i3lock


## Фокусировка на окне по мыши

Обычно мне это не нравится. Поэтому надо прописать в конфиг следующую строчку:

    focus_follows_mouse no


## Звук

Регулировка осуществляется медийными командами. Чтобы их активировать, в конфиг пропысываются следующие строчки:

    bindsym XF86AudioRaiseVolume exec amixer -q set Master 5%+ unmute
    bindsym XF86AudioLowerVolume exec amixer -q set Master 5%- unmute
    bindsym XF86AudioMute exec amixer -q set Master toggle

## Скриншоты

Чтобы производить скриншоты добавим на горячую клавишу Deepin Screenshot:

    bindsym Mod4+c exec deepin-screenshot

где Mod4 это клавиша win, которая должна по умолчанию так и установлена.

# WineHQ

Создаётся и используется `wineprefix` вот так:

    WINEPREFIX="$HOME/prefix32" WINEARCH=win32 wine wineboot

# wireshark-gtk

Чтобы слушать интерфейс не от рута нужно добавить пользователя в группу `wireshark` следующей командой (и потом перелогинться):

    usermod -aG wireshark <username>

# QEMU

Для проброса ssh порта из виртуалки можно добавить следующие опции при запуске:

    ...
    -net user,hostfwd=tcp::10022-:22 \
    -net nic \
    ...

А потом коннектится командой типа:

    ssh vmuser@localhost -p10022

Решение взято отсюда: https://unix.stackexchange.com/questions/124681/ssh-from-host-to-guest-using-qemu


# Docker

Чтобы пользоваться докером должен быть включён его демон и пользователь должен быть добавлен в группу `docker` (и потом перелогиниться):

    usermod -aG docker oxore

Список имеющихся собранных образов:

    docker images

Удалить образ любой из этих команд:

    docker image rm <image name or hash>
    docker rmi <image name or hash>

Список запущенных контейнеров:

    docker ps --all

Часто контейнер запущен, а ты об этом не знаешь.
Убить контейнер можно следующим образом:

    docker rm <container name>