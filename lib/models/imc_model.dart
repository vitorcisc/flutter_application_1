class ImcModel {
  final double peso;
  final double altura;

  ImcModel({required this.peso, required this.altura});

  double calcular() => peso / (altura * altura);

  String classificar() {
    final imc = calcular();

    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }
}