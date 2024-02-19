import 'dart:io';

class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);

  double calcularMediaPonderada() {
    return (nota1 * 2 + nota2 * 3) / 5;
  }
}

void main() {
  List<Aluno> alunos = [];

  // Cadastro de 8 alunos
  for (int i = 0; i < 8; i++) {
    stdout.write("Digite o nome do aluno ${i + 1}: ");
    var nome = stdin.readLineSync()!;

    stdout.write("Digite a nota 1 do aluno ${i + 1}: ");
    var nota1 = double.parse(stdin.readLineSync()!);

    stdout.write("Digite a nota 2 do aluno ${i + 1}: ");
    var nota2 = double.parse(stdin.readLineSync()!);

    alunos.add(Aluno(nome, nota1, nota2));
  }

  // Ordenar alunos pela média ponderada
  alunos.sort((a, b) =>
      b.calcularMediaPonderada().compareTo(a.calcularMediaPonderada()));

  // Listar alunos ordenados pela média ponderada
  print("\nAlunos ordenados pela média ponderada:");
  for (var aluno in alunos) {
    print(
        "Nome: ${aluno.nome}, Média Ponderada: ${aluno.calcularMediaPonderada()}");
  }

  // Ordenar alunos pela nota 1
  alunos.sort((a, b) => a.nota1.compareTo(b.nota1));

  // Listar alunos ordenados pela nota 1
  print("\nAlunos ordenados pela nota 1:");
  for (var aluno in alunos) {
    print("Nome: ${aluno.nome}, Nota 1: ${aluno.nota1}");
  }

  // Listar alunos reprovados (média < 7) em ordem alfabética
  print("\nAlunos reprovados (média < 7) em ordem alfabética:");
  var alunosReprovados =
      alunos.where((aluno) => aluno.calcularMediaPonderada() < 7).toList();
  alunosReprovados.sort((a, b) => a.nome.compareTo(b.nome));

  for (var aluno in alunosReprovados) {
    print(
        "Nome: ${aluno.nome}, Média Ponderada: ${aluno.calcularMediaPonderada()}");
  }
}
