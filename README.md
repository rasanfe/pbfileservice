# pbfileservice — Manejar ficheros y rutas con .NET desde PowerBuilder 📁

![PowerBuilder](https://img.shields.io/badge/PowerBuilder-2025-2D6CDF?style=flat-square)
![.NET](https://img.shields.io/badge/.NET-10-512BD4?style=flat-square&logo=dotnet&logoColor=white)
![System.IO](https://img.shields.io/badge/System.IO-Path%20%7C%20File%20%7C%20Directory-00A98F?style=flat-square)
![Blog](https://img.shields.io/badge/blog-rsrsystem-FF5722?style=flat-square&logo=blogger&logoColor=white)

## 📋 ¿Qué es esto?

Un ejemplo PowerBuilder para **trocear rutas y manejar ficheros** sin pelearos con la API Win32:
separar el nombre, la extensión o la carpeta de una ruta; renombrar y mover ficheros; copiar
árboles de directorios enteros; listar ficheros con un patrón... Todo eso que en PB acabas
reescribiendo a mano, aquí lo resuelve **.NET de serie**, que ya lo trae robusto y bien probado.

¿Y cómo lo hace? PowerBuilder se apoya en .NET: cargamos una pequeña librería .NET (`FileService`,
que por debajo usa **`System.IO.Path`**, **`System.IO.File`** y **`System.IO.Directory`**) como
`dotnetobject` con el **.NET DLL Importer** de PB. Eso nos genera un objeto proxy,
**`nvo_fileservice`**, que desde PowerScript se usa como si fuera nativo:

```powerscript
nvo_fileservice lnv_fs
lnv_fs = create nvo_fileservice
string ls_nombre, ls_ext, ls_carpeta
ls_nombre  = lnv_fs.of_getfilename("C:\datos\informe.pdf")          // informe.pdf
ls_ext     = lnv_fs.of_getextension("C:\datos\informe.pdf")          // .pdf
ls_carpeta = lnv_fs.of_getdirectoryname("C:\datos\informe.pdf")      // C:\datos
```

Lo que tenéis disponible en el proxy:

- **Trocear rutas** → `of_getfilename`, `of_getextension`, `of_getfilenamewithoutextension`,
  `of_getdirectoryname`, `of_changeextension`, `of_endsindirectoryseparator`.
- **Operar con ficheros** → `of_filerename` (renombra/mueve, sobrescribiendo si hace falta).
- **Operar con carpetas** → `of_copydirectory` (copia un árbol completo, con filtro `*.ext`
  opcional y recursividad) y `of_getdirectoryfiles` (lista los ficheros devolviendo rutas
  relativas, comodísimo para recorrer en PB).

Por dentro la librería lleva un patrón **GetLastError** y, además, lanza excepciones, así que
podéis envolver las llamadas en un `TRY...CATCH` de PowerBuilder y enteraros de cualquier fallo.

## 🔗 Motor .NET

El "motor" que hace el trabajo es la librería .NET **`FileService`** (clase `FileService`):

- Se **despliega** ya compilada en la carpeta `DotNet\FileService\` de este propio ejemplo, para
  que clones, compiles y funcione sin más.
- Se **consume** desde PowerBuilder como `dotnetobject` (el proxy `nvo_fileservice`).
- El **código fuente** vive en `Blog\Net10\FileService` (antes estaba en `Net8`) y se
  recompila/despliega con el script **`desplegar_dotnet.bat`** (hace `dotnet publish` y espeja las
  DLLs a la carpeta `DotNet` de cada ejemplo).
- Repo del proyecto .NET (Visual Studio 2022): <https://github.com/rasanfe/FileService>

## 🛠️ Requisitos

- **PowerBuilder 2025** para abrir y compilar la solución.
- **.NET 10 Runtime** instalado en la máquina → <https://dotnet.microsoft.com/en-us/download/dotnet/10.0>
- La carpeta `DotNet\FileService\` con las DLLs desplegadas (ya viene en el repo).

## ▶️ Cómo probarlo

1. Clona el repo y abre `pbfileservice.pbsln` con PowerBuilder 2025.
2. Compila (Full Build) y ejecuta.
3. Prueba a pasarle rutas y ver cómo extrae nombre, extensión y carpeta.
4. Lanza una copia de directorio o un listado de ficheros y observa los resultados.

🎬 **Vídeo demo en YouTube:** <https://youtu.be/theQ713zQ5s>

## 🔗 Repo PowerBuilder

<https://github.com/rasanfe/pbfileservice>

---

> ¡Nos vemos en el próximo artículo! Y recuerda: en PowerBuilder, los límites solo están en nuestra imaginación. 🚀

📨 **Blog:** <https://rsrsystem.blogspot.com/>
