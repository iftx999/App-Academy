class Refeicao{
  int? id;
  String? CafeManha;
  String? IntraAlmoco;
  String? Almoco;
  String? CafeTarde;
  String? Jantar;
  String? Ceia;

  Refeicao({ this.id, required this.CafeManha, required this.IntraAlmoco, required this.Almoco, required this.CafeTarde, required this.Jantar, required this.Ceia});

  Map<String, dynamic> toMap() {
    return {
      'cafeManha': CafeManha,
      'intraAlmoco': IntraAlmoco,
      'almoco': Almoco,
      'cafeTarde': CafeTarde,
      'jantar': Jantar,
      'ceia': Ceia,
      // Adicione mais chaves e valores conforme necessário
    };
  }
}

