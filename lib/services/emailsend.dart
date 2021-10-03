import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class EmailSend {
  static const api =
      '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';
  static const toEmailAddress = 'shaypk057@gmail.com';

  static void sendemail(
      {required String emailcontent, required String emailSubject}) {
    final mailer = Mailer(api);
    final toAddress = Address(toEmailAddress);
    final fromAddress = Address(toEmailAddress);
    final content = Content('text/plain', emailcontent);
    final personalization = Personalization([toAddress]);

      final email = Email([personalization], fromAddress, emailSubject,
          content: [content]);
      mailer.send(email).then((result) {
        print(result.isError);
      });
  }
}
