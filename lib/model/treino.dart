class Treino{
  int? id;
  String? perna;
  String? costas;
  String? biceps;
  String? triceps;
  String? ombro;
  String? gluteos;
  String? peito;

  Treino({ this.id, required this.perna, required this.costas, required this.biceps, required this.triceps, required this.ombro, required this.gluteos, required this.peito});



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'perna': perna,
      'costas': costas,
      'biceps': biceps,
      'triceps': triceps,
      'ombro': ombro,
      'gluteos': gluteos,
      'peito': peito,
      // Adicione mais chaves e valores conforme necessário
    };
  }
}