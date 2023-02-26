fd --color=always --search-path /home/chilly -t f --exclude node_modules -I -l -F -H |awk '{print $NF}' > /home/chilly/Scripts/data/filepaths.txt
fd --color=always --search-path /home/chilly -t d --exclude node_modules -I -l -F -H |awk '{print $NF}' > /home/chilly/Scripts/data/dirpaths.txt

dunstify -a "Filesystem Reloaded!" "Your filesystem has been reloaded."
