# Wallet Api

Wallet Api contiene el servicio rest para la aplicación Wallet

## Getting Started

### Instalación

Al iniciar por primera vez, es necesario ejecutar los siguientes comandos
```sh
bundle install
rake db:create db:migrate db:seed
```

**Es necesario tener instalado Postgresql >= 6 **. (https://www.postgresql.org/download/) y Ruby on Rails >= 5. (http://rubyonrails.org/)

Posteriormente, debes configurar los datos de conexión a la base de datos en

*wallet_api/config/database.yml

### Iniciar el servidor de desarrollo
```sh
rails server
```

### Información

Las ganancias de las transacciones se van a la cuenta del administrador
```
email: 'admin@admin.com',
password: '123',
```

Si deseas probar las transferencias, puedes hacerlo a la cuenta 
```
12345
```
O a cualquier otra cuenta de un usuario registrado en Wallet. 