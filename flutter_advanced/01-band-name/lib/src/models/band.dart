class Band {
  String id;
  String name;
  int votes;

  Band({required this.id, required this.name, required this.votes});

  //el factory contructor regresa una nueva instancia de la clase pero returnando un tipo de dato distinto  al que entra, en este caso recibe un objeto de tipo Map
  factory Band.fromMap(Map<String, dynamic> obj) =>
      Band(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
