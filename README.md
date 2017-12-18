# Wallet Api

Wallet Api contiene el servicio rest para la aplicación Wallet

## Getting Started

### Instalación

Al iniciar por primera vez, es necesario ejecutar los siguientes comandos
```sh
bundle install
db:create db:migrate db:seed
```

**Es necesario tener instalado Postgresql >= 6 **. (https://www.postgresql.org/download/) y Ruby on Rails >= 5. (http://rubyonrails.org/)

Posteriormente, debes configurar los datos de conexión a la base de datos en

*wallet_api/config/database.yml

### Iniciar el servidor de desarrollo
```sh
rails server
```

