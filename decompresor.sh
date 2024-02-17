#!/bin/bash

clear

echo -e "\n\n"
echo -e "\t\t\tEEEEEEEEEEEEEEEEEEEEEElllllll      MMMMMMMM               MMMMMMMM                  lllllll   iiii                                                         "
echo -e "\t\t\tE::::::::::::::::::::El:::::l      M:::::::M             M:::::::M                  l:::::l  i::::i                                                        "
echo -e "\t\t\tE::::::::::::::::::::El:::::l      M::::::::M           M::::::::M                  l:::::l   iiii                                                         "
echo -e "\t\t\tEE::::::EEEEEEEEE::::El:::::l      M:::::::::M         M:::::::::M                  l:::::l                                                                "
echo -e "\t\t\t  E:::::E       EEEEEE l::::l      M::::::::::M       M::::::::::M  aaaaaaaaaaaaa    l::::l iiiiiii    ggggggggg   gggggnnnn  nnnnnnnn       ooooooooooo   "
echo -e "\t\t\t  E:::::E              l::::l      M:::::::::::M     M:::::::::::M  a::::::::::::a   l::::l i:::::i   g:::::::::ggg::::gn:::nn::::::::nn   oo:::::::::::oo "
echo -e "\t\t\t  E::::::EEEEEEEEEE    l::::l      M:::::::M::::M   M::::M:::::::M  aaaaaaaaa:::::a  l::::l  i::::i  g:::::::::::::::::gn::::::::::::::nn o:::::::::::::::o"
echo -e "\t\t\t  E:::::::::::::::E    l::::l      M::::::M M::::M M::::M M::::::M           a::::a  l::::l  i::::i g::::::ggggg::::::ggnn:::::::::::::::no:::::ooooo:::::o"
echo -e "\t\t\t  E:::::::::::::::E    l::::l      M::::::M  M::::M::::M  M::::::M    aaaaaaa:::::a  l::::l  i::::i g:::::g     g:::::g   n:::::nnnn:::::no::::o     o::::o"
echo -e "\t\t\t  E::::::EEEEEEEEEE    l::::l      M::::::M   M:::::::M   M::::::M  aa::::::::::::a  l::::l  i::::i g:::::g     g:::::g   n::::n    n::::no::::o     o::::o"
echo -e "\t\t\t  E:::::E              l::::l      M::::::M    M:::::M    M::::::M a::::aaaa::::::a  l::::l  i::::i g:::::g     g:::::g   n::::n    n::::no::::o     o::::o"
echo -e "\t\t\t  E:::::E       EEEEEE l::::l      M::::::M     MMMMM     M::::::Ma::::a    a:::::a  l::::l  i::::i g::::::g    g:::::g   n::::n    n::::no::::o     o::::o"
echo -e "\t\t\tEE::::::EEEEEEEE:::::El::::::l     M::::::M               M::::::Ma::::a    a:::::a l::::::li::::::ig:::::::ggggg:::::g   n::::n    n::::no:::::ooooo:::::o"
echo -e "\t\t\tE::::::::::::::::::::El::::::l     M::::::M               M::::::Ma:::::aaaa::::::a l::::::li::::::i g::::::::::::::::g   n::::n    n::::no:::::::::::::::o"
echo -e "\t\t\tE::::::::::::::::::::El::::::l     M::::::M               M::::::M a::::::::::aa:::al::::::li::::::i  gg::::::::::::::g   n::::n    n::::n oo:::::::::::oo "
echo -e "\t\t\tEEEEEEEEEEEEEEEEEEEEEEllllllll     MMMMMMMM               MMMMMMMM  aaaaaaaaaa  aaaalllllllliiiiiiii    gggggggg::::::g   nnnnnn    nnnnnn   ooooooooooo   "
echo -e "\t\t\t                                                                                                                g:::::g                                    "
echo -e "\t\t\t                                                                                                    gggggg      g:::::g   Bash Script:                     "
echo -e "\t\t\t                                                                                                    g:::::gg   gg:::::g                 Decompresor        "
echo -e "\t\t\t                                                                                                     g::::::ggg:::::::g                                    "
echo -e "\t\t\t                                                                                                      gg:::::::::::::g                                     "
echo -e "\t\t\t                                                                                                        ggg::::::ggg                                       "
echo -e "\t\t\t                                                                                                           gggggg                                          "

read -p "Ingresa el nombre del archivo: " file

if [ -f $file ]; then
	while true; do
		7z l $file >/dev/null 2>&1 
		if [ "$(echo $?)" == "0" ]; then
			file_des=$(7z l $file | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
			echo "Archivo a Descomprimir:"
			echo "[*] $file_des"
			sleep 2
			7z x $file

			#Cambiar nombre con la extension correcta
			'''
			file_name=$(file $file_des | tr "." " " | tr ":" " " | awk '{print $1}')
			file_ext=$(file $file_des | tr "." " " | awk '{print $3}')
			mv $file_des "$file_name.$file_ext"
			file_new_name="$file_name.$file_ext"
			'''
			file=$file_des
		else
			echo -e "\nTodos los archivos fueron descomprimidos" 
			echo "Ultimo archivo descomprimido:"
			echo "[*] $file_des"
			exit 1;	
		fi
	done
else
	echo "El archivo no existe"
	exit 1;
fi
