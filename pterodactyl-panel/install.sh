echo "Welcome to Pterodactyl Panel [VOX EDITION]"
echo "If you want to dont have a copyright in the footer of pterodactyl panel join into my discord server and gave access pterodactyl files :)"
sleep 4
echo "Lets upgrade the packages a little"
sleep 4
apt update -y && apt upgrade -y
sleep 4
clear
echo "Now lets add some additional packages"
echo "Installing NPM & NODEjs"
sleep 5
apt install npm -y
clear
sleep 4
echo "Installing Neofetch/Htop"
sleep 3
apt install neofetch -y
clear
apt install htop -y
clear
sleep 4
echo "Installing TMATE for temporary terminal acces for other members of the vps"
sleep 2
apt install tmate -y
clear
echo "Lets install pterodactyl panel"
sleep 3
bash <(curl -s https://pterodactyl-installer.se)
sleep 4
clear
echo "Nice work"
echo "Lets add a theme :)"
sleep 4
cd /var/www/pterodactyl
php artisan down
curl -L https://github.com/Nookure/NookTheme/releases/latest/download/panel.tar.gz | tar -xzv
chmod -R 755 storage/* bootstrap/cache
composer install --no-dev --optimize-autoloader
php artisan view:clear
php artisan config:clear
php artisan migrate --seed --force
chown -R www-data:www-data /var/www/pterodactyl/*
php artisan queue:restart
php artisan up
sleep 4
clear
sleep 4
echo "Lets install ngrok"
sleep 4
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
sleep 4
clear
sleep 5
echo "Hmm lets add PM2 and SCREEN packages"
apt install screen -y
npm install pm2 -g && pm2 install pm2-logrotate
sleep 4
pm2 save && pm2 startup
clear
sleep 5
echo "Nice both Pterodactyl and Ngrok its installed, now you add the ngrok token and create a edge"
echo "Good Luck"
echo "--------------------------------------------------------------------"
echo "  You can support me if you invite more members. Thanks :)"
echo "  Discord : https://discord.gg/dMbPukcGjP"
