// lib/models/pet_manager.dart

import 'pet.dart';

class PetManager {
  // Implementação do Singleton
  static final PetManager _instance = PetManager._internal();

  factory PetManager() {
    return _instance;
  }

  PetManager._internal();

  // Lista privada de pets
  final List<Pet> _pets = [
    Pet(
      nome: 'Bidu',
      descricao: 'Cachorro amigável e brincalhão.',
      imagem: 'assets/bidu.jpg',
    ),
    Pet(
      nome: 'Mia',
      descricao: 'Gata carinhosa e curiosa.',
      imagem: 'assets/mia.jpg',
    ),
    // Adicione mais pets iniciais conforme necessário
  ];

  // Getter para acessar a lista de pets
  List<Pet> get pets => _pets;

  // Método para adicionar um novo pet
  void adicionarPet(Pet pet) {
    _pets.add(pet);
  }

  // Método para remover um pet
  void removerPet(Pet pet) {
    _pets.remove(pet);
  }

  // Método para buscar pets por nome (opcional)
  List<Pet> buscarPetsPorNome(String nome) {
    return _pets
        .where((pet) => pet.nome.toLowerCase().contains(nome.toLowerCase()))
        .toList();
  }

  // Você pode adicionar mais métodos conforme a necessidade
}
