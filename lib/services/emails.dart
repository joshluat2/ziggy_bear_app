import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

final gmailSmtp = gmail(dotenv.env["GMAIL_MAIL"]!, dotenv.env["GMAIL_PASSWORD"]!);

sendMailfromGmail(String sender, sub, text)async{
  print("hello");


  final message = Message()
    ..from = Address(dotenv.env["GMAIL_MAIL"]!, "ziggy bear app")
    ..recipients.add(sender)
    ..subject = sub
    ..text = text;

  try{
    final sendReport = await send(message, gmailSmtp);
    print("messege sent : $sendReport");
  } on MailerException catch(e){
    print("messege not send");
  }

}
