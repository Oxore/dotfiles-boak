# Общие заметки по Linux

## Терминал gnome

Чтобы работал стандартный терминал гнома

    sudo locale-gen
    localectl set-locale LANG="en_US.UTF-8"

А вообще лучше установить guake и запихнуть его в автозапуск следующим образом

    sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/


## Терминал st

Если `st` падает со следующей ошибкой:

    X Error of failed request:  BadValue (integer parameter out of range for operation)
      Major opcode of failed request:  18 (X_ChangeProperty)
      Value in failed request:  0x1c
      Serial number of failed request:  431
      Current serial number in output stream:  437

то это значит, что установлена локаль `C.utf8`. Нужно установить `en_US.utf8`.

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

Скопипащено по сути [отсюда](https://wycd.net/posts/2015-03-10-creating-a-bootable-windows-10-usb-drive-on-linux.html) но последний раз это сделать не получалось.

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

## Создание загрузочной флешки с win 7/10 способ 2

Нужен `woeusb`.

    sudo woeusb --target-filesystem NTFS --device ~/Win10-Enterprise2015-LTSB-N-Privacy-x64-en-US.iso /dev/sda

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


## Прочее

Применить новые группы без перелогинивания (только для данной сессии шелла):

    sudo su -l <user>

Прокси сервер с помощью ssh:

    ssh -fTCND "*:8841" proxie@172.104.226.227

# WineHQ

Создаётся и используется `wineprefix` вот так:

    WINEPREFIX="$HOME/prefix32" WINEARCH=win32 wine wineboot


# wireshark-gtk

Чтобы слушать интерфейс от обычного пользователя нужно добавить его в группу `wireshark` следующей командой (и потом перелогиниться):

    usermod -aG wireshark <username>


# QEMU

Для проброса `ssh` порта из виртуалки можно добавить следующие опции при запуске:

    ...
    -net user,hostfwd=tcp::10022-:22 \
    -net nic \
    ...

А потом коннектится командой типа:

    ssh vmuser@localhost -p10022

Решение взято [отсюда](https://unix.stackexchange.com/questions/124681/ssh-from-host-to-guest-using-qemu).


# Docker

Чтобы пользоваться докером должен быть включён его демон и пользователь должен быть добавлен в группу `docker` (и потом перелогиниться):

    usermod -aG docker <username>

Необходимо различать две концепции в докере - это образ и контейнер.
Образ - это построенная из `Dockerfile` система в определённом состоянии.
Образ можно некоторым образом изменять (через `Dockerfile` )и изменения будут сохранены.
Контейнер - это запущенный экземпляр образа.
Запущенный образ можно просто так изменять как угодно, но изменения не попадают в образ и сохраняются лишь до тех пор, пока существует контейнер (экземпляр образа).

Список имеющихся собранных образов:

    docker images [--all|-a]

Удалить образ любой из этих команд:

    docker image rm <image name or hash>
    docker rmi <image name or hash>

Список запущенных контейнеров:

    docker ps [--all|-a]

Часто контейнер запущен, а ты об этом не знаешь.
Убить контейнер можно следующим образом:

    docker rm <container name>

Если контейнер запущен, то можно его остановить мгновенно, указав таймаут в 0 секунд `-t0` (по-умолчанию 10 секунд):

    docker stop -t0 <container name>

Можно остановить и убить все контейнеры:

    docker ps -aq | xargs docker stop -t0 | xargs docker rm

Флаг `-q` у команды `docker ps` позволяет вывести только хэш контейнера.
Если контейнер был запущен с флагом `--rm` то `docker rm` вернёт ошибку при попытке его убить, потому что он уже удалён.

Если имеется `Dockerfile`, то собрать по нему образ можно следующей командой:

    docker build [--tag=|-t] <tag> <directory with Dockerfile>

Запуск контейнера с графическим (Xorg) приложением
(перед этим стоит выполнить команду `xhost +`):

    docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       <tag> [<command>]

Пояснения:
- `--tty=true|false`, `-t` - Проброс консоли.
- `--rm` - Автоматически убрать контейнер, после того как он завершился.
- `--interactive=true|false`, `-i` - Оставить STDIN даже в отсоединённом состоянии.
- `--env=[]`, `-e` - Проброс переменных окружения.
- `-v|--volume[=[[HOST-DIR:]CONTAINER-DIR[:OPTIONS]]]` - Примонтировать директорию.
- `<tag>` - Тэг (имя) запускаемого образа
- `[<command>]` - команда, запускаемая в контейнере, помимо всего прочего. (Опционально)

Показать осиротевшие образы:

    docker images -f dangling=true

Удалить все осиротевшие образы

    docker image prune


# Git

Можно изменить remote url для субмодуля. В том числе иметь разные url для
одного субмодуля в разных ветках. Для этого нужно изменить url нужного
субмодуля в `.gitmodules` и выполнить следующие команды:

```
  git submodule sync
  git submodule update --init --recursive --remote
```

При переключении между ветками, на которых один и тот же субмодуль имеет разные remote url так же нужно выполнять эти команды.

# CGit на nginx

Для установки cgit портребуются следующие пакеты:

    sudo emerge -a cgit nginx fcgiwrap spawn-fcgi

Пояснения по списку:
  - `nginx` - Собственно веб сервер. Как оказалось он куда проще чем `lighttpd`.
  - `fcgiwrap` - создаёт сокет, к которому подключается `nginx`, в нашем случае
  это будет `/run/fcgiwrap.sock-1`. Зачем нужен не понятно.
  - `spawn-fcgi` - это спаунер для процесса `fcgiwrap`. Нужен чтобы
  демонизировать процесс через openrc.
  - `cgit` - Собственно `cgi` скрипт самого приложения.

Чтобы всё работало нужно
1. Сконфигурировать `spawn-fcgi` и закинуть в автозапуск.
2. Сконфигурировать `nginx` и закинуть в автозапуск.
3. Сконфигурировать `cgit`.

Так же не уверен, что нужно но возможно необходимо. В файле
`/etc/vhosts/webapp-config` нужно установить следующую переменную:

    vhost_server="nginx"


## 1. FCGIwrap

Чтобы сконфигурировать `spawn-fcgi` нужно сделать следующее:

    sudo ln -s spawn-fcgi /etc/init.d/spawn-fcgi.trac
    sudo cp /etc/conf.d/spawn-fcgi /etc/conf.d/spawn-fcgi.trac
    sudo nvim /etc/conf.d/spawn-fcgi.trac

В открывшемся файле `/etc/conf.d/spawn-fcgi.trac` нужно выставить следующие
переменные как показано ниже:

    FCGI_SOCKET=/run/fcgiwrap.sock
    FCGI_ADDRESS=
    FCGI_PORT=
    FCGI_PORT=
    FCGI_USER=nginx
    FCGI_GROUP=nginx

Теперь можно добавить в автозапуск.

    sudo rc-update add spawn-fcgi.trac

Создастся файл `/run/fcgiwrap.sock-1`. От суффикса `-1` я не заню как избавится,
да и не нужно это.

## 2. Nginx

Настройку следует производить через файл `/etc/nginx/nginx.conf` (см.
[Archwiki](https://wiki.archlinux.org/index.php/Cgit#Nginx)):

```
user nginx;
worker_processes          1;

events {
  worker_connections      1024;
}

http {
  include                 mime.types;
  default_type            application/octet-stream;
  sendfile                on;
  keepalive_timeout       65;
  gzip                    on;

  # Cgit
  server {
    listen                80;
    server_name           localhost;
    root                  /var/www/localhost/htdocs/cgit;
    try_files             $uri @cgit;

    location @cgit {
      include             fastcgi_params;
      fastcgi_param       SCRIPT_FILENAME $document_root/../../cgi-bin/cgit.cgi;
      fastcgi_param       PATH_INFO       $uri;
      fastcgi_param       QUERY_STRING    $args;
      fastcgi_param       HTTP_HOST       $server_name;
      fastcgi_pass        unix:/run/fcgiwrap.sock-1;
    }
  }
}
```

ОБратите внимаение, что в Gentoo "документы" `cgit` находятся в
`/var/www/localhost/htdocs/cgit`, CGI бинарь находится относительно этого пути в
`../../cgi-bin`.

Теперь можно добавить в автозапуск.

    sudo rc-update add nginx

## 3. CGit

Открыть файл `/etc/cgitrc` и раскомментровать и изменить переменные следующим
образом:

    css=/cgit.css
    favicon=/favicon.ico
    logo=/cgit.png
    virtual-root=/

Переменная `virtual-root=/` особенно интересна тем, что без неё `cgit` будет за
базовый адрес брать не хост, а уже имеющийся URL и тогда например вместо
`http://oxore.tk/tetris-csfml.git/commit/` будет
`http://oxore.tk/tetris-csfml.git/tetris-csfml.git/commit/`. Потратил на это
часа три наверно, но об этом написано на арчвики.


## 4. Запуск

    sudo rc-service nginx start
    sudo rc-service spawn-fcgi.trac start

CGit должен быть доступен по адресу [http://localhost/](http://localhost/)

Всё.

# Аппаратура

## Bluetooth

Надо включить в ядре `CONFIG_BT_ATH3K=m` - обязательно модуль, а то волшебства
не произойдёт.

# Wireguard

Помню что сначала создал дефолтный роут

    sudo route add -net 172.104.226.227 netmask 255.255.255.255 gw 192.168.88.1

таким образом обеспечив доступ к хосту эндпоинта. Потом запустил wireguard

    nmcli connection up wg0

В таком порядке заработало.

# PXE Boot with dnsmasq

Отлаживаться можно с помощью wireshark

Ниже представлен конфиг dnsmasq, который работает при тестировании на qemu.
Здесь DHCP сервер является основным, чтобы выдавать виртуальной машине IP
адрес. DHCP сервер должен быть проксирующим или отсутствовать вовсе, если
основной уже имеется.

```
# PXE Boot settings follow
interface=bridge0
## DHCP server must be a proxy when not main one
##dhcp-range=192.168.88.1,proxy
dhcp-range=192.168.167.5,192.168.167.50,12h
dhcp-boot=/pxelinux.0
pxe-service=x86PC,"Network Boot",pxelinux
enable-tftp
tftp-root=/tftpboot
```
Конфиг виртуальной машины qemu:

```
#!/bin/sh
mac="00:00:FF:FF:FF:01"
exec qemu-system-x86_64 \
    -machine type=q35,accel=kvm \
    -cpu host \
    -smp 1 \
    -enable-kvm \
    -netdev bridge,id=net0,br=bridge0  \
    -device e1000,netdev=net0,mac=$mac \
    -option-rom /usr/share/qemu/pxe-rtl8139.rom \
    -m 1G \
    -name pxe \
    -boot n \
    -vga std \
    "$@"
```

Перед запуском нужно поднять мост bridge0:

    ip link add name bridge0 type bridge
    ip link set bridge0 up

Убрать мост можно так:

    ip link del bridge0

## PXELINUX

Ссылки:
- [Ненмого про настройку меню](https://docs.oracle.com/cd/E50245_01/E50247/html/vmiug-install-pxe-pxelinux.html)
- [Хороший пример конфига меню](https://github.com/gojun077/pxe-config/blob/master/pxelinux.cfg/default)
- [Подробнее про параметры в конфиге меню](https://wiki.centos.org/HowTos/PXE/PXE_Setup/Menus)

Нужно поставить пакет sys-boot/syslinux - в нём будут все нужный файлы
компонента PXELINUX, расположенные в `/usr/share/syslinux/`

Создать директорию со всеми необходимыми для загрузки через PXE файлами. В
данном случае `/tftpboot`.

В директорию `/tftpboot` нужно переместить некоторые файлы:

    cp -r /usr/share/syslinux/{com32,pxelinux.0,{ldlinux,libcom32,libutil,mboot,vesamenu}.c32} /tftpboot

Создать директорию `pxelinux.cfg` для конфигов и `gentoo` для ядра и initramfs

    mkdir -p /tftpboot/{pxelinux.cfg,gentoo}

Создать файл `/tftpboot/pxelinux.cfg/pxe.conf` со следующим содержимым:

```
MENU TITLE  PXE Server
NOESCAPE 1
ALLOWOPTIONS 1
PROMPT 0
menu width 80
menu rows 14
MENU TABMSGROW 24
MENU MARGIN 10
menu color border               30;44      #ffffffff #00000000 std
```

Создать файл `/tftpboot/pxelinux.cfg/default` со следующим содержимым:

```
DEFAULT vesamenu.c32
TIMEOUT 800
ONTIMEOUT BootLocal
PROMPT 0
MENU INCLUDE pxelinux.cfg/pxe.conf
NOESCAPE 1
LABEL BootLocal
        localboot 0
        TEXT HELP
        Boot to local hard disk
        ENDTEXT

LABEL Gentoo
        MENU LABEL Boot Gentoo Minimal LiveCD
        KERNEL gentoo/gentoo
        INITRD gentoo/gentoo.igz
        APPEND ip=dhcp root=/dev/ram0 init=/linuxrc dokeymap looptype=squashfs loop=/gentoo/image.squashfs cdroot
```

Положить файл ядра `/tftpboot/gentoo/gentoo` и файл initramfs `/tftpboot/gentoo/gentoo.igz`.

Перезапустить `dnsmasq`:

    rc-service dnsmasq restart

Должно работать, но rootfs пока нет. Тут есть пара способов:

- [Приклеить rootfs к initramfs](https://wiki.gentoo.org/wiki/Installation_alternatives)
- [Скачивать через http](https://wiki.alpinelinux.org/wiki/PXE_boot)

Приклеить rootfs получилось, но патч по ссылке тухловат, пришлось немного
почитать init скрипт и сделать самому.
