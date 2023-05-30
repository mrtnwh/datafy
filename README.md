Para correr el codigo es necesario un token, para eso:

```
Hacer una consulta POST en https://accounts.spotify.com/api/token en headers el Content-Type tiene que ser: application/x-www-form-urlencoded y el body grant_type: client_credentials, client_id: 36f84c4388d241afa8cb4861cef58165, client_secret: 129274c5773d40088c564104aab1d9e7
```

```
Crear un archivo llamado "constants.dart", en el mismo crear un archivo final String TOKEN= ''; y dentro de la variable String hay que poner lo que devuelva la consulta "access_token"
```
