#!/bin/bash
#Purpose = Backup of ~/dev
# bz2 compression
#START
# --exlude-backups --exclude-vcs 
# voorwaarden zijn.. dialog, tar, bzip of whatever

backupset=$1
DIALOG=${DIALOG=dialog}

TIME=`date +"%Y%m%d%H%M"`
EXT=".tar.bz2"
DESDIR="/mnt/syn_backup/mark"

function backupdev {
SRCDIR="/home/kelp/dev"
#tar --exclude-vcs --exclude-from=/home/kelp/dev/stuff/backup/excludes_dev.txt -cvjf $DESDIR/dev$TIME$EXT $SRCDIR
echo ""
echo "Backed up ~/dev"
echo ""
}

function backupfpc {
SRCDIR="/home/kelp/dev/fpc"
#tar --exclude-vcs --exclude-from=/home/kelp/dev/stuff/backup/excludes_fpc.txt -cvjf $DESDIR/fpc$TIME$EXT $SRCDIR
echo ""
echo "Backed up ~/dev/fpc"
echo ""
}

function backupeclipse {
SRCDIR="/home/kelp/dev/eclipse"
#tar --exclude-vcs --exclude-from=/home/kelp/dev/stuff/backup/excludes_eclipse.txt -cvjf $DESDIR/eclipse$TIME$EXT $SRCDIR
echo ""
echo "Backed up ~/dev/eclipse"
echo ""
}

function backuphome {
SRCDIR1="/home/kelp/Desktop /home/kelp/Downloads /home/kelp/bin /etc/fstab"
SRCDIR2=" /home/kelp/.config /home/kelp/.worker /home/kelp/.lazarus"
#tar --exclude-vcs --exclude-from=/home/kelp/dev/stuff/backup/excludes_home.txt -cvjf $DESDIR/home$TIME$EXT $SRCDIR1$SRCDIR2
echo ""
echo "Backed up /home"
echo ""
}

rm -f temp # voor het geval dat die de vorige keer bleef staan.
$DIALOG --menu "Backup stuff.." 15 40 4 \
        "dev" "/home/dev" \
        "fpc" "/home/dev/fpc" \
        "eclipse" "/home/dev/eclipse" \
        "home" "/home/kelp + /etc/fstab (behalve /home/kelp/dev en alles eronder!)" 2>temp

# OK is pressed
if [ "$?" = "0" ]
then
  return=$(cat temp)
	case $return in
  dev)
    backupdev;;
  fpc)
    backupfpc;;
  eclipse)
    backupeclipse;;
  home)
    backuphome;;
	esac
else # Op de 1 of andere manier gecancelled.
  echo "Cancelled"
fi
# remove temp
rm -f temp

#END
