#!/bin/bash

version="0.1.0"
author="Kevin Gimbel"
author_url="<http://kevingimbel.com>"
github_url="https://github.com/kevingimbel/bump"
github_issues="$github_url/issues"
program_name="$(basename "$0")"
# Print out version information
version() {
  printf "%s\n" "Version $version" \
  "by $author $author_url" \
  "" \
  "Report Issues on $github_issues"
  exit
}

# Print out usage information
usage() {
  printf "%s\n" \
  "Usage: $program_name [options] Message" \
  "Write a bump text to bump.txt" \
  "" \
  "Options:" \

  echo "
    -u,--usage  & Show usage message
    -h,--help   & Show help 
    -v,--version & Show version and author info
  " | column -s\& -t
  
  exit
}

help() {
  printf "%s\n" \
  "Run $program_name 'message' to write a bump message to the bump.txt file" \
  "in the current directory."
  exit
}


write_bump() {
  if [ "$1" == "" ]; then
    echo "Empty text. See $program_name --usage"
    exit
  fi

  if [ ! -f "./bump.txt" ]; then
    echo "Creating bump.txt file"
    touch "./bump.txt"
  fi

  echo "[$(date +%x)] $1" >> ./bump.txt && echo "Bump text written to bump.txt"
  exit
}


case "$1" in 
  '-u' | '--usage')
    usage
  ;;

  '-h' | '--help')
    help
  ;;

  '-v' | '--version')
    version
  ;;
esac

write_bump "$1"
