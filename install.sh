#!/bin/sh

if test $1 && test $1 = '-n'; then
  DRY_RUN=true
  echo 'Dry run...'
else
  DRY_RUN=false
fi;

for FILE in $(find . -name *.symlink | grep -v '^./.git'); do
  DOTFILE=$(echo $FILE | sed 's/.*\/\([a-zA-Z0-9_.-]*\).symlink/\1/')
  RM_CMD="rm $HOME/$DOTFILE"
  BACKUP_CMD="mv $HOME/$DOTFILE $HOME/$DOTFILE.bak"
  LINK_CMD="ln -s $(pwd)/$FILE $HOME/$DOTFILE"
  if $DRY_RUN; then
    if test -h $HOME/$DOTFILE; then
      echo "$RM_CMD"
    elif test -e $HOME/$DOTFILE; then
      echo "$BACKUP_CMD"
    fi;
    echo "$LINK_CMD"
  else
    if test -h $HOME/$DOTFILE; then
      $RM_CMD
    elif test -e $HOME/$DOTFILE; then
      $BACKUP_CMD
    fi;
    $LINK_CMD
  fi;
done;

echo 'Done! Be sure to resource everything or start a new session.'
