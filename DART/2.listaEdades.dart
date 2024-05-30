void main(){

// 1. LISTA DE EDADES
  
  int mayores = 0,
      menores = 0;

  List <int> edades = [7, 12, 15, 23, 31, 27];

  edades.add(5); //Agregar a una lista

  for (var element in edades) {
    if (element >= 18) {
      mayores++;
    }else{
      menores++;
    }
  }
  print("\n Hay $mayores personas mayores de edad y $menores menores de edad \n");

}


