enum AuthProvider { GOOGLE, FACEBOOK, EMAIL }

extension AuthProviderStringX on String {
  AuthProvider get toAuthProvider {
    final provider = this.split('.').last;
    switch (provider) {
      case 'GOOGLE':
        return AuthProvider.GOOGLE;
      case 'FACEBOOK':
        return AuthProvider.FACEBOOK;
      default:
        return AuthProvider.EMAIL;
    }
  }
}
