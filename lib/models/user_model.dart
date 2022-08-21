class UserModel {
  final String id;
  final String name;
  final String email;
  final int temperature;
  final double ph;
  final int turbidity;
  final int ppm;

  UserModel(
    this.id,
    this.email, {
    this.name,
    this.temperature,
    this.ph,
    this.turbidity,
    this.ppm,
  });
}
