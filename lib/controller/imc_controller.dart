import '../models/imc_model.dart';

class ImcController {
  String calcularIMC(String pesoText, String alturaText) {
    final peso = double.tryParse(pesoText);
    final altura = double.tryParse(alturaText);

    if (peso == null || altura == null || altura == 0) {
      return 'Valores inválidos!';
    }

    final imc = ImcModel(peso: peso, altura: altura);
    return 'IMC: ${imc.calcular().toStringAsFixed(2)}\nClassificação: ${imc.classificar()}';
  }
}
