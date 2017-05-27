# Introdução:

Script para instalação e configuração de um servidor apache com versões versões do PHP 5.5, 5.6 e 7.1. O servidor é construído através de Dockers e das imagens ubuntu 16:04 e 14:04.

> O ubuntu foi utilizado para aproximar o ambiente de produção ao de desenvolvimento. 
# Dependências:

- openssl
- docker
- docker-compose
- sudo

### Ubuntu
Para instalar as dependências basta digitar o seguinte comando:

`sudo apt install openssl docker docker-compose`

# Primeiros passos
Primeiro é necessário gerar o certificado através do script *gerarCertificado.sh*

`sh gerarCertificado.sh`

Depois devemos instalar os dockers através do comando:
`sudo sh install.sh`

Para iniciar os serviços:
`sudo sh up.sh`


# Funcionamento
Existem 4 servidores apache, três são para as versões do php: 5.5, 5.6 e 7.1. Outro servidor apache configurado na porta 80 e 443 do sistema hospedeiro. Este servidor possibilita a comunicação com os servidores de cada versão através do módulo proxy do apache.
Os servidores php 

# Configurações

## Diretório www dos sistemas
O diretório www utilizado para armazenar os sistemas encontra-se em:
`/var/www/[PHP_VERSION]/`

Caso queira alterar este diretório modifique as variáveis **PATH_WWW_{VERSÃO}** em **up.sh** e execute novamente:
`sudo sh up.sh`

## Diretório de configuração do servidor
Cada versão do php é executado em um servidor apache, podendo ser configurado de acordo com a necessidade. 
Os arquivos de configuração do servidor podem ser encontrados no diretório: 
`/PHP{VERSÃO}/apache2/`

## Configurando Alias no servidor
Para a utilização de alias, a configuração deve ser feita no servidor apache da versão do PHP correspondente ao sistema.
Além disso é necessário indicar qual a versão do PHP será utilizada pelo sistema. 
No arquivo */apache/apache2/sites-enabled/000-default.conf* existem alguns exemplos de como utilizar uma versão do php. Por exemplo:

`ProxyPass /php55 ${HOSTPHP55}`
`ProxyPassReverse /php55 ${HOSTPHP55}`

Neste exemplo o endereço http://localhost/php55 apontará para a raiz do servidor apache do php5.5. Um exemplo mais real seria:

`ProxyPass /sistemaA ${HOSTPHP55}/sistemaA`
`ProxyPassReverse /sistemaA ${HOSTPHP55}/sistemaA`

> Outra possibilidade seria a não necessidade de configurar os alias no servidor apache da versão do php por exemplo: 
> `ProxyPass /sistemaA ${HOSTPHP55}/sistemaA/public`
> `ProxyPassReverse /sistemaA ${HOSTPHP55}/sistemaA/public`

## Configurando SSL
O ssl (https) já vem ativo em todas versões. A configuração do https no servidor apache principal se encontra no arquivo */apache/apache2/sites-enabled/000-default.conf* e nas versões contendo o PHP encontra-se na em */PHP{VERSÃO}/apache2/sites-enabled/default-ssl.conf* 
Em */apache/apache2/sites-enabled/000-default.conf* um sistema pode ser adicionado utilizando a seguinte configuração:
`ProxyPass /sistemaA ${HOSTPHP55_SSL}/sistemaA`
`ProxyPassReverse /sistemaA ${HOSTPHP55_SSL}/sistemaA`

## Variáveis

### Variáveis de ambiente
/install.sh
> \$http_proxy = Se o proxy necessita usuário e senha. A mesma deve ser definida



### Variáveis de configuração
/apache/apache2/envvars

> \$HOSTPHP55 = Host para o docker localizar a versão do php internamente
> \$HOSTPHP56 = ...
> \$HOSTPHP71 = ...
> \$HOSTPHP55_SSL = Host para o docker localizar a versão https do php internamente
> \$HOSTPHP56_SSL = ...
> \$HOSTPHP71_SSL = ...

/up.sh
>PATH_WWW_PHP55 = Local dos sistemas que usaram a versão php 5.5
>PATH_WWW_PHP56 = ... versão php5.6
>PATH_WWW_PHP71 = ... versão php7.1
