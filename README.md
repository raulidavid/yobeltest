## TEST RAUL FLORES YOBEL®

Sistema base de un CRUD de pedidos

## DEPENDENCIES AND LIBRARIES

Tecnologías usadas en el software

| DEPENDENCY | LINK |
| ------ | ------ |
| PHP >= 8.1 | [PHP](https://www.php.net/manual/es/intro-whatis.php) |
| MARIADB >= 10.0 | [MARIADB](https://www.mariadb.org/)  |
| DOCKER >= 20.10.10 | [DOCKER](https://www.docker.com/) |
| AUTHOR | [JIBAN DEVELOPER](https://github.com/raulidavid/)|

## DEVELOP

```sh
git clone https://github.com/raulidavid/yobeltest.git
copy .env in the root path yobeltest
CUSTOMUID=$(id -u) CUSTOMGID=$(id -g) docker-compose -f docker-compose.yml up --build -d --remove-orphans
check backend http://localhost:8081
check frontend http://localhost:8082
```

## License

El uso de este software sin autorización previa esta penada por la ley software licensed under the [MIT license](http://opensource.org/licenses/MIT).
