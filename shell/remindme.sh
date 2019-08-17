#!/bin/bash

# remindme -- Searchs a data ile for matching lines or, if no
#   argument is specified, shows the entire contents of the data file

rememberfile="$HOME/.remember"

if [ ! -f ${rememberfile} ] ; then
  echo "$0: You don't seem to have a .remember file. " >&2
  echo "To remedy this, please use 'remember' to add reminders" >&2
  exit 1
fi

if [ $# -eq 0 ] ; then
  # Display the whole rememberfile when not given any search criteria.
  more ${rememberfile}
else
  # Otherwise, search through the file for the given terms, and display
  #   the results neatly.
  grep -i -- "$@" ${rememberfile} | ${PAGER:-more}
fi

exit 0