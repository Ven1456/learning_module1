import 'package:local_auth/local_auth.dart';

class BioMetric {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBioMetric() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: "Please Authenticate First",
        options:  AuthenticationOptions(biometricOnly: true));
    return didAuthenticate;
  }
}
