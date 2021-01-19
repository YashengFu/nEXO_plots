#!/bin/sh

git filter-branch --env-filter '

    OLD_EMAIL="fuyasheng@ihep.ac.cn"
    OLD_NAME="fuyasheng"
    CORRECT_NAME="YashengFu"
    CORRECT_EMAIL="fuyasheng@ihep.ac.cn"
    
    if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi' -- --all
