import 'dart:io';

void main() {
  List<int> numeros = [];

  // Cadastro de 10 números
  for (var i = 0; i < 10; i++) {
    stdout.write("Digite o ${i + 1}º número: ");
    var numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  // Ordenação dos números
  numeros.sort();

  // Encontrar e mostrar o menor número e sua contagem
  var menorNumero = numeros.first;
  var contagemMenor = numeros.where((num) => num == menorNumero).length;

  print("Menor número: $menorNumero, Quantidade de vezes: $contagemMenor");

  // Encontrar e mostrar o maior número e sua contagem
  var maiorNumero = numeros.last;
  var contagemMaior = numeros.where((num) => num == maiorNumero).length;

  print("Maior número: $maiorNumero, Quantidade de vezes: $contagemMaior");
}
