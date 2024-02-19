import 'dart:io';

class Produto {
  int codigo;
  String descricao;
  double preco;

  Produto(this.codigo, this.descricao, this.preco);
}

List<Produto> ordenarProdutosPorCodigo(List<Produto> produtos) {
  return produtos..sort((a, b) => a.codigo.compareTo(b.codigo));
}

int buscaSequencial(List<Produto> produtos, int codigoAlvo) {
  for (int i = 0; i < produtos.length; i++) {
    if (produtos[i].codigo == codigoAlvo) {
      return i + 1; // Retornar o número de comparações
    }
  }
  return produtos
      .length; // Se não encontrar, retorna o número total de elementos
}

int buscaBinaria(List<Produto> produtos, int codigoAlvo) {
  int inicio = 0;
  int fim = produtos.length - 1;
  int comparacoes = 0;

  while (inicio <= fim) {
    int meio = (inicio + fim) ~/ 2;
    comparacoes++;

    if (produtos[meio].codigo == codigoAlvo) {
      return comparacoes;
    } else if (produtos[meio].codigo < codigoAlvo) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }

  return comparacoes;
}

void main() {
  List<Produto> produtos = [];

  // Cadastro de 12 produtos
  for (int i = 0; i < 12; i++) {
    stdout.write("Digite o código do produto ${i + 1}: ");
    var codigo = int.parse(stdin.readLineSync()!);

    stdout.write("Digite a descrição do produto ${i + 1}: ");
    var descricao = stdin.readLineSync()!;

    stdout.write("Digite o preço do produto ${i + 1}: ");
    var preco = double.parse(stdin.readLineSync()!);

    produtos.add(Produto(codigo, descricao, preco));
  }

  // Ordenação dos produtos por código
  produtos = ordenarProdutosPorCodigo(produtos);

  // Busca sequencial
  stdout.write("Digite o código para busca sequencial: ");
  var codigoBuscaSequencial = int.parse(stdin.readLineSync()!);
  var comparacoesSequencial = buscaSequencial(produtos, codigoBuscaSequencial);
  print("Busca sequencial - Número de comparações: $comparacoesSequencial");

  // Busca binária
  stdout.write("Digite o código para busca binária: ");
  var codigoBuscaBinaria = int.parse(stdin.readLineSync()!);
  var comparacoesBinaria = buscaBinaria(produtos, codigoBuscaBinaria);
  print("Busca binária - Número de comparações: $comparacoesBinaria");
}
