class MidtransModel {
  final TransactionDetails transactionDetails;
  final String paymentType;
  final CustomerDetails customerDetails;
  final CStore? cstore;
  final BankTransfer? bankTransfer;
  final List<ItemDetails>? itemDetails;

  MidtransModel({
    required this.transactionDetails,
    required this.paymentType,
    required this.customerDetails,
    this.cstore,
    this.bankTransfer,
    this.itemDetails,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      "transaction_details": transactionDetails.toJson(),
      "payment_type": paymentType,
      "customer_details": customerDetails.toJson(),
    };

    if (paymentType == "bank_transfer" && bankTransfer != null) {
      json["bank_transfer"] = bankTransfer!.toJson();
    } else if (paymentType == "cstore" && cstore != null) {
      json["cstore"] = cstore!.toJson();
    }

    if (itemDetails != null) {
      json["item_details"] = itemDetails!.map((e) => e.toJson()).toList();
    }

    return json;
  }
}

class TransactionDetails {
  final String orderId;
  final int grossAmount;

  TransactionDetails({
    required this.orderId,
    required this.grossAmount,
  });

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "gross_amount": grossAmount,
      };
}

class CustomerDetails {
  final String? firstName;
  final String? lastName;
  final String email;
  final String? phone;

  CustomerDetails({
    this.firstName,
    this.lastName,
    required this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}

class BankTransfer {
  final String bank;

  BankTransfer({required this.bank});

  Map<String, dynamic> toJson() => {
        "bank": bank,
      };
}

class CStore {
  final String store;
  final String? message;

  CStore({
    required this.store,
    this.message,
  });

  Map<String, dynamic> toJson() {
    final json = {
      "store": store,
      "message": message,
    };
    return json;
  }
}

class ItemDetails {
  final String id;
  final int price;
  final int quantity;
  final String name;

  ItemDetails({
    required this.id,
    required this.price,
    required this.quantity,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "quantity": quantity,
        "name": name,
      };
}
