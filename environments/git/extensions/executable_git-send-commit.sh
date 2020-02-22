#!/usr/bin/env bash

message="NO-MESSAGE"
branch=$(git rev-parse --abbrev-ref HEAD)
head="develop"
no_verify=""
yes=0
pr=0
partial=0;
reviewers=""

while [ "$1" != "" ]; do
    case $1 in
        -m | --message )        shift
                                message=$1
                                ;;
        -b | --branch )         shift
                                branch=$1
                                ;;
        -h | --head )           shift
                                head=$1
                                ;;
        --reviewers )           shift
                                reviewers=$1
                                ;;
        --pr )                  pr=1
                                ;;
        --no-verify )           no_verify="--no-verify"
                                ;;
        -y | --yes )            yes=1
                                ;;
        --partial )             partial=1
                                ;;
        * )                     exit 1
    esac
    shift
done

if [[ $message == "NO-MESSAGE" ]]; then
  echo "Missing message"
  exit 1
fi

if [[ $branch == "develop" ]]; then
  echo "Missing branch name"
  exit 1
fi

branch_exists=$(git branch --list | grep $branch | wc -l)

if [[ $branch_exists -eq 1 ]]; then
  if [[ yes -eq 0 ]]; then
    read -p "'$branch' already exists, do you want to use it? (Y/n) " -n1 reuse_branch
    
    if [ $reuse_branch == 'n' ]; then
      exit 1
    fi
  fi
else
  git checkout -b $branch origin/$head
fi

if [[ partial -eq 0 ]]; then
  git add --all
fi

git commit $no_verify -m "$message"

git push $no_verify -u origin $branch

if [[ pr -eq 1 ]]; then
  hub pull-request -b $head -r $reviewers | pbcopy
fi
