Para correr el codigo es necesario un token, para eso:

```
Crear una carpeta en la carpeta lib llamado constants archivo llamado 
"constants.dart", en el mismo  copiar y pegar lo siguiente:
import '../services/token_bearer.dart';
Future<String> obtenerToken() async {
  Future<String> futureString = enviarSolicitudPost();
  String TOKEN = await futureString;
  return TOKEN;
}
```

El proyecto fue probado en Start Pixel 3 XL API 33 y Start Pixel 6 Pro API 33 y funcionaron correctamente.
