class Curriculo {
  final int id;
  final String name;
  final String description;
  final String age;
  final String nationality;
  final String email;
  final String telephone;
  final String adress;
  final String professionalObjectives;
  final String skills;
  final String certifications;
  final String languages;

  Curriculo(
    this.id,
    this.name,
    this.description,
    this.age,
    this.nationality,
    this.email,
    this.telephone,
    this.adress,
    this.professionalObjectives,
    this.skills,
    this.certifications,
    this.languages,
  );

  @override
  String toString() {
    return 'Curriculo{ID: $id, nome: $name, description: $description, idade: $age, nacionalidade: $nationality, email: $email , telephone: $telephone, adress: $adress, objetivos: $professionalObjectives, skills: $skills, certifications: $certifications , languages: $languages}';
  }
}
