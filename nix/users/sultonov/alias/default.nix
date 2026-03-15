[
  # navigation
  "..=cd .."
  "...=cd ../.."
  "....=cd ../../.."
  "bk=cd -"

  # file listing
  "la=ls -A"
  "ll=ls -lh"
  "lt=ls -ltr"

  # disk usage
  "du=du -h"
  "df=df -h"
  "du1=du -h --max-depth=1"
  "dus=du -sh"

  # search
  "rg=rg --smart-case"
  "ff=fd"
  "rgi=rg -i"

  # git
  "g=git"
  "gs=git status"
  "ga=git add"
  "gc=git commit"
  "gp=git push"
  "gl=git log --oneline --graph --decorate"
  "gd=git diff"
  "gdc=git diff --cached"
  "gco=git checkout"
  "gb=git branch"
  "gm=git merge"
  "gr=git rebase"
  "gst=git stash"
  "gsp=git stash pop"
  "glast=git log -1 --oneline"
  "gundo=git reset --soft HEAD~1"

  # nix
  "n=nix"
  "ni=nix develop"
  "ns=nix-shell"
  "nr=nix run"
  "nb=nix build"
  "nl=nix flake metadata"
  "no=nix flake show"
  "nf=nix fmt"
  "ng=nix-collect-garbage -d"
  "ndc=nix derivation show"
  "niv=niv"

  # system monitoring
  "ht=htop"
  "ps=ps aux"
  "pm=procs"

  # networking
  "ping=ping -c 5"
  "curl=curl -sL"
  "wget=wget -q"
  "ip=ip -color=auto"
  "ss=ss -tunp"

  # docker
  "d=docker"
  "dc=docker compose"
  "di=docker images"
  "dps=docker ps"
  "dpa=docker ps -a"
  "dex=docker exec -it"
  "dl=docker logs -f"
  "dpull=docker pull"
  "dprune=docker system prune -af"
  "dstop=docker stop (docker ps -q)"

  # node/bun
  "nr=npm run"
  "nx=npx"
  "br=bun run"
  "bi=bun install"
  "ba=bun add"
  "bt=bun test"

  # json
  "j=jq"
  "jp=jq ."
  "jc=jq -c"
  "js=jq -r ."

  # archive
  "tarx=tar -xf"
  "tarc=tar -czf"
  "untargz=tar -xzf"
  "untarbz2=tar -xjf"

  # clipboard
  "c=xclip -selection clipboard"
  "v=xclip -selection clipboard -o"

  # safe cleanup
  "cleannix=nix-collect-garbage -d"
  "cleanpod=docker system prune -af"

  # developer qol
  "e=exit"
  "mkd=mkdir -p"
  "tailf=tail -f"
  "watch=watch -n 1"
  "copy=cp -i"
  "move=mv -i"
  "diff=diff -u"
]
