# Análisis de Bordes

## Original 

Enfoque original para el análisis de bordes, que comienza con la segmentación de color utilizando el algoritmo k-means. Luego, se aplica un filtro de Butterworth para suavizar la imagen. Posteriormente, se emplea el método de Otsu para realizar una binarización, seguida de la inversión de los valores con el fin de facilitar la comparación con el Ground Truth.

Las imágenes necesarias para probar los métodos se encuentran en el directorio 'Images', el cual está dividido en tres subdirectorios: 'Good', 'Bad' e 'Intermediate'. Estas categorías se basan en evaluaciones subjetivas del desempeño de la propuesta. Cada uno de estos subdirectorios contiene cinco imágenes diferentes, junto con su correspondiente imagen binaria de Ground Truth.

El archivo principal que contiene este proceso se denomina **border_analysis.m**.

## Propuesta 01

La primera propuesta para el análisis de bordes consiste en aplicar un filtro promedio ponderado utilizando una máscara de 5x5. Luego, se realiza una transformación a tonos de gris, seguida por una binarización utilizando el método de Otsu. El archivo principal que contiene este proceso se denomina **border_analysis.m**.

Las imágenes necesarias para probar los métodos se encuentran en el directorio 'Images', el cual está dividido en tres subdirectorios: 'Good', 'Bad' e 'Intermediate'. Estas categorías se basan en evaluaciones subjetivas del desempeño de la propuesta. Cada uno de estos subdirectorios contiene cinco imágenes diferentes, junto con su correspondiente imagen binaria de Ground Truth.

## Propuesta 02

La segunda propuesta para el análisis de bordes consiste en primero realizar una mejora en el contraste de la imagen a color. Luego, se aplica un filtro Butterworth Paso Bajas de orden 2 y frecuencia de corte 20 con el objetivo de suavizar/emborronar la imagen y así mejorar los resultados al momento de extraer los bordes de la binarización. Después se aplica una binarización utilizando el método de Otsu y se invierten los valores con el objetivo de resaltar el tumor en color blanco. Se realiza un mejoramiento de la imagen mediante morfología matemática, “Imfill hole” nos permite rellenar toda la región de la lesión y mediante bwmorph eliminamos las pequeñas filtraciones alrededor del área de interés y las sombras provocadas por el dermatoscopio presentes en algunas imagenes de muestra.

Se anexa el archivo Dermastocope_Test.m para ver el comportamiento de la función encargada de limpiar la sombra generada con el dermatoscopio así como un directorio DermatoscopeShadow con seis imágenes de muestra que cumplen esta característica.

Las imágenes necesarias para probar los métodos se encuentran en el directorio 'Images', el cual está dividido en tres subdirectorios: 'Good', 'Bad' e 'Intermediate'.
