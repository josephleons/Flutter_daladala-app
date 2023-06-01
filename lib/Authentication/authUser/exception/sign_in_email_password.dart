class SignWithEmailPasswordFailure {
  final String message;
  const SignWithEmailPasswordFailure(
      [this.message = 'an Unknown error occurred .']);

  factory SignWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'Weak Password':
        return const SignWithEmailPasswordFailure('Please enter strong password');
      case 'Invalid-email':
        return const SignWithEmailPasswordFailure('Email is not valid of bady formatted');
      case 'email-alread-in-use':
        return const SignWithEmailPasswordFailure('An account already exist for that email');
      case 'user-desable':
        return const SignWithEmailPasswordFailure(
            'This user has been disabled.Please contact support for help.');
      default:
        return const SignWithEmailPasswordFailure();
    }
  }
}
