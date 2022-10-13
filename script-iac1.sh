#!/bin/bash

echo "Criando grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando diretorios..."
mkdir /adm
mkdir /ven
mkdir /sec
mkdir /publico

echo "Criando usuários e atribuindo ao grupo GRP_ADM..."

useradd carlos -c "Carlos Silva" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_ADM
useradd maria -c "Maria Silva" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_ADM
useradd joao -c "Joao Silva" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_ADM

echo "Criando usuários e atribuindo ao grupo GRP_VEM..."

useradd debora -c "Debora Santos" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_VEN
useradd sebastiana -c "Sebastiana Santos" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_VEN
useradd roberto -c "Roberto Santos" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_VEN

echo "Criando usuários e atribuindo ao grupo GRP_SEC..."

useradd josefina -c "Josefina Leite" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_SEC
useradd amanda -c "Amanda Leite" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_SEC
useradd rogerio -c "Rogério Leite" -s /bin/bash -m -p $(openssl passwd -crypt 102030) -G GRP_SEC

echo "Liberando permissão para o arquivo adm para o grupo GRP_ADM ..."
chown root:GRP_ADM /adm/
chmod 770 /adm/

echo "Liberando permissão para o arquivo sec para o grupo GRP_SEC ..."
chown root:GRP_SEC /sec/
chmod 770 /sec/

echo "Liberando permissão para o arquivo sec para o grupo GRP_VEM ..."
chown root:GRP_VEN /ven/
chmod 770 /ven/

echo "Liberando permissão para o arquivo publico para os grupos GRP_SEC, GRP_SEC e GRP_ADM..."
chown root:root /publico/
chmod 777 /publico/

echo "Finalizando!!!"
