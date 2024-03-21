# Análisis de Bordes

## Original 

Enfoque original para el análisis de bordes, que comienza con la segmentación de color utilizando el algoritmo k-means. Luego, se aplica un filtro de Butterworth para suavizar la imagen. Posteriormente, se emplea el método de Otsu para realizar una binarización, seguida de la inversión de los valores con el fin de facilitar la comparación con el Ground Truth.

Las imágenes necesarias para probar los métodos se encuentran en el directorio 'Images', el cual está dividido en tres subdirectorios: 'Good', 'Bad' e 'Intermediate'. Estas categorías se basan en evaluaciones subjetivas del desempeño de la propuesta. Cada uno de estos subdirectorios contiene cinco imágenes diferentes, junto con su correspondiente imagen binaria de Ground Truth.

El archivo principal que contiene este proceso se denomina **border_analysis.m**.

## Propuesta 01

La primera propuesta para el análisis de bordes consiste en aplicar un filtro promedio ponderado utilizando una máscara de 5x5. Luego, se realiza una transformación a tonos de gris, seguida por una binarización utilizando el método de Otsu. El archivo principal que contiene este proceso se denomina **border_analysis.m**.

Las imágenes necesarias para probar los métodos se encuentran en el directorio 'Images', el cual está dividido en tres subdirectorios: 'Good', 'Bad' e 'Intermediate'. Estas categorías se basan en evaluaciones subjetivas del desempeño de la propuesta. Cada uno de estos subdirectorios contiene cinco imágenes diferentes, junto con su correspondiente imagen binaria de Ground Truth.