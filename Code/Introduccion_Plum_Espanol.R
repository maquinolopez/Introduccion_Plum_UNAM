######################################
# Autor: Marco A. Aquino-López
# Script: Introducción a Plum
# Propósito: Demostrar cómo utilizar el paquete rPlum para fechar sedimentos usando 210Pb
######################################

# Introducción a rPlum
# ----------------------
# Este script ofrece una introducción al uso del paquete `rPlum` para el fechado de sedimentos.
# Incluye ejemplos para ejecutar modelos con conjuntos de datos predeterminados y personalizados,
# así como para calcular y visualizar tasas de acumulación.

# Limpiar el entorno de R
rm(list = ls())

# Instalar el paquete `rplum` (si no está instalado)
if (!requireNamespace("rplum", quietly = TRUE)) {
  install.packages("rplum")
}

# Cargar la librería `rplum`
library(rplum)

# Ejecutar el núcleo predeterminado de Plum (proporcionado por la Dra. Nicole Sanderson)
# -------------------------------------------------------------------------------------
# Este utiliza un conjunto de datos de ejemplo integrado.
# Plum pedirá confirmación para el número de secciones a modelar.
Plum(BCAD = TRUE)  # Usar años calendario BC/AD en lugar de BP.

# Ejecución de Núcleos Personalizados
# ------------------------------------
# 1. Núcleo con datos proxy soportados para 210Pb
Plum("Sim01")

# 2. Núcleo con solo mediciones de 210Pb
Plum("Sim02")

# 3. Núcleo con mediciones de 210Pb y otras mediciones de fechado
# Especificar el grosor de las secciones y la información adicional de fechado.
Plum("HP1C", thick = 1, otherdates = "HP1C_C")

# Tasas de Acumulación
# ---------------------
# Para simular un inicio limpio, limpiar nuevamente el entorno.
rm(list = ls())

# Ejecutar el núcleo sin ejecutar el modelo completo inmediatamente (`run = FALSE`)
Plum("HP1C", otherdates = "HP1C_C", run = FALSE)

# Visualizar el modelo edad-profundidad
agedepth()
dev.off()  # Cerrar el dispositivo gráfico (si está abierto)

# Graficar Tasas de Acumulación a Profundidades Específicas
# ----------------------------------------------------------
# Ejemplo: Tasa de acumulación a 10 cm de profundidad
accrate_d10 <- accrate.depth(d = 10)
head(accrate_d10)
mean(accrate_d10); var(accrate_d10)
plot(density(accrate_d10), main = "Tasa de Acumulación a 10 cm de Profundidad", 
     xlab = "años/cm", ylab = "")

# Ejemplo: Tasa de acumulación a 25 cm de profundidad (convertida a cm/año)
accrate_d25 <- accrate.depth(d = 25, cmyr = TRUE)
head(accrate_d25)
mean(accrate_d25); var(accrate_d25)
summary(accrate_d25)
plot(density(accrate_d25), main = "Tasa de Acumulación a 25 cm de Profundidad", 
     xlab = "cm/año", ylab = "")

# Graficar Tasas de Acumulación para Edades Específicas
# ------------------------------------------------------
# Ejemplo: Tasa de acumulación a 300 años BP
accrate_a300 <- accrate.age(age = 300)
head(accrate_a300)
mean(accrate_a300); var(accrate_a300)
summary(accrate_a300)
plot(density(accrate_a300), main = "Tasa de Acumulación a 300 años BP", 
     xlab = "años/cm", ylab = "")
hist(accrate_a300, breaks = 100)

# Ejemplo: Tasa de acumulación a -10 años BP (convertida a cm/año)
acc_rate_10 <- accrate.age(age = -10, cmyr = TRUE)
head(acc_rate_10)
mean(acc_rate_10); var(acc_rate_10)
plot(density(acc_rate_10), main = "Tasa de Acumulación a -10 años BP", 
     xlab = "cm/año", ylab = "")

# Graficar Tasas de Acumulación para Todo el Modelo
# --------------------------------------------------
# Por Profundidad
accrate.depth.ghost(cmyr = TRUE, acc.lim = c(0, 1.5))
accrate.depth.ghost(acc.lim = c(0, 5), d.lim = c(0, 10))

# Por Edad
accrate.age.ghost(acc.lim = c(0, 40))
accrate.age.ghost(cmyr = TRUE, age.lim = c(-20, 50), acc.lim = c(0, 0.28))

# Notas Adicionales:
# -------------------
# - La función `Plum` pedirá automáticamente confirmación sobre el número de secciones
#   a menos que se proporcione explícitamente en el conjunto de datos.
# - Los usuarios pueden explorar otros parámetros en las funciones `Plum` y `agedepth` 
#   para personalizar más los análisis.
# - Asegúrese siempre de que el conjunto de datos esté correctamente formateado para su uso con `rplum`. 
#   Consulte la documentación del paquete para los requisitos y ejemplos.

# Fin del Script