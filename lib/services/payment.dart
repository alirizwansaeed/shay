import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class Payment{

static mobilepay() async {
    String ppLanguage = 'EN';
    String ppmerchintID = 'MC24659'; // set id here
    String ppPassword = 'tgwyw3uaze'; // set password here
    String pptransectionReferencenumber =
        "T${DateFormat("yyyyMMddHHmmss").format(DateTime.now()).toString()}";
    String ppAmount = '1000'; //enter amount here
    String ppTxnCurrency = "PKR";
    String ppTxnDateTime =
        DateFormat("yyyyMMddHHmmss").format(DateTime.now()).toString();
    String ppBillReference = "billRef";
    String ppDescription = "Description of transaction";
    String ppTxnExpiryDateTime = DateFormat("yyyyMMddHHmmss")
        .format(DateTime.now().add(Duration(days: 1)))
        .toString();
    String ppMobileNumber = "03123456789";
    String ppCNIC = "345678";

    //additional data
    String integeritySalt = "v2v39124h5";
    String and = '&';
    // superdata for hash
    String superdata = integeritySalt +
        and +
        ppAmount +
        and +
        ppBillReference +
        and +
        ppCNIC +
        and +
        ppDescription +
        and +
        ppLanguage +
        and +
        ppmerchintID +
        and +
        ppMobileNumber +
        and +
        ppPassword +
        and +
        ppTxnCurrency +
        and +
        ppTxnDateTime +
        and +
        ppTxnExpiryDateTime +
        and +
        pptransectionReferencenumber;
    var key = utf8.encode(integeritySalt);
    var bytes = utf8.encode(superdata);
    var hmacSha256 = Hmac(sha256, key);
    Digest sha256Result = hmacSha256.convert(bytes);
    String ppsecurehash = sha256Result.toString();
    //
    //
    //
    //
    //
    //
    var url =
        'https://sandbox.jazzcash.com.pk/ApplicationAPI/API/2.0/Purchase/DoMWalletTransaction';

    var responce = await http.post(Uri.parse(url), body: {
      "pp_Language": ppLanguage,
      "pp_MerchantID": ppmerchintID,
      "pp_SubMerchantID": "",
      "pp_Password": ppPassword,
      "pp_BankID": "",
      "pp_ProductID": "",
      "pp_TxnRefNo": pptransectionReferencenumber,
      "pp_Amount": ppAmount,
      "pp_TxnCurrency": ppTxnCurrency,
      "pp_TxnDateTime": ppTxnDateTime,
      "pp_BillReference": "billRef",
      "pp_Description": "Description of transaction",
      "pp_TxnExpiryDateTime": ppTxnExpiryDateTime,
      "pp_SecureHash": ppsecurehash,
      "ppmpf_1": "",
      "ppmpf_2": "",
      "ppmpf_3": "",
      "ppmpf_4": "",
      "ppmpf_5": "",
      "pp_MobileNumber": ppMobileNumber,
      "pp_CNIC": ppCNIC
    });
    print('this is responce');
    print(responce.body);
  }
}