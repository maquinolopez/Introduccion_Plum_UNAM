
# Introducción a rPlum para Fechado de Sedimentos con 210Pb

Este repositorio contiene recursos para aprender y trabajar con el paquete [`rPlum`](https://cran.r-project.org/web/packages/rplum/index.html), una herramienta en R para la modelización bayesiana de cronologías de sedimentos basada en datos de \( {}^{210}	ext{Pb} \). Aquí encontrarás un script detallado en R y una presentación en formato PDF que explican el funcionamiento y aplicaciones del modelo `Plum`.

## Contenido

### Archivos principales

- **[`Code/Introduccion_Plum_Espanol.R`](Introduccion_Plum_Espanol.R)**: Un script en R que muestra cómo:
  - Instalar y utilizar el paquete `rPlum`.
  - Ejecutar análisis de datos de \( {}^{210}	ext{Pb} \) con ejemplos prácticos.
  - Generar modelos de edad-profundidad.
  - Calcular y graficar tasas de acumulación para profundidades y edades específicas.

- **[`Plum_20012025.pdf`](Plum_20012025.pdf)**: Presentación en PDF que explica:
  - Los fundamentos de Plum como modelo bayesiano.
  - La estructura del modelo, incluyendo el modelo CRS y la integración de datos adicionales como \( {}^{137}	ext{Cs} \) y \( {}^{14}	ext{C} \).
  - Ejemplos visuales de resultados y comparación con métodos clásicos.

## Instalación

Para ejecutar el script en este repositorio, primero asegúrate de tener instalado R (versión 4.0 o superior) y el paquete `rPlum`. Puedes instalar el paquete con:

```R
install.packages("rplum")
```

## Uso del Script

1. Descarga el archivo `Introduccion_Plum_Espanol.R`.
2. Abre el archivo en RStudio o tu IDE preferido para R.
3. Sigue las instrucciones paso a paso dentro del script, que incluyen:
   - Cómo ejecutar el núcleo predeterminado del modelo Plum.
   - Cómo cargar y procesar tus propios datos.
   - Ejemplos para analizar tasas de acumulación y generar gráficos interpretativos.

## Ejecución del Modelo

### Modelo Predeterminado

Para ejecutar un análisis rápido usando el conjunto de datos predeterminado incluido en `rPlum`, ejecuta el siguiente código:

```R
library(rplum)
Plum(BCAD = TRUE)  # Generar un modelo con años en formato BC/AD.
```

### Análisis con Datos Personalizados

Para trabajar con tus propios datos, personaliza las entradas en el script:

```R
Plum("tu_archivo", thick = 1, otherdates = "fechamientos_adicionales")
```

Asegúrate de que tus datos estén formateados correctamente. Consulta la [documentación de rPlum](https://cran.r-project.org/web/packages/rplum/index.html) para más detalles.

## Descripción de la Presentación

La presentación `Plum_20012025.pdf` incluye:

- Una introducción a los fundamentos teóricos de Plum.
- Explicaciones detalladas de las distribuciones a priori y la estructura del modelo.
- Ejemplos de gráficos generados con datos simulados y reales.
- Comparaciones entre Plum y métodos tradicionales, como CRS.

## Artículo de Plum

Para una explicación más detallada del modelo Plum y su implementación, consulta el siguiente artículo:

**[Bayesian analysis of 210Pb dating](https://doi.org/10.1007/s13253-018-0328-7)**  
_Aquino-López, M. A., Blaauw, M., Christen, J. A., & Sanderson, N. (2018)._  
*Journal of Agricultural, Biological, and Environmental Statistics, 23*, 317–333.

## Referencias

- Aquino-López, M. A., Blaauw, M., Christen, J. A., & Sanderson, N. (2018). Bayesian analysis of 210Pb dating. *Journal of Agricultural, Biological, and Environmental Statistics, 23*, 317–333. [DOI](https://doi.org/10.1007/s13253-018-0328-7)


## Contribuciones

¡Contribuciones son bienvenidas! Si tienes sugerencias o mejoras para el script o la documentación, no dudes en abrir un [Issue](https://github.com/) o enviar un Pull Request.

## Licencia

Este repositorio está disponible bajo la licencia [MIT](LICENSE).

---

**Contacto**: Para preguntas o comentarios, contacta a Marco A. Aquino-López en [aquino@cimat.mx].
