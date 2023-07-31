// To parse this JSON data, do
//
//     final walletBalance = walletBalanceFromJson(jsonString);

import 'dart:convert';

WalletBalance walletBalanceFromJson(String str) => WalletBalance.fromJson(json.decode(str));

String walletBalanceToJson(WalletBalance data) => json.encode(data.toJson());

class WalletBalance {
    WalletBalance({
         this.status,
         this.balance,
    });

    String status;
    String balance;

    factory WalletBalance.fromJson(Map<String, dynamic> json) => WalletBalance(
        status: json["status"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "balance": balance,
    };
}



VoucherCheck voucherCheckFromJson(String str) => VoucherCheck.fromJson(json.decode(str));

String voucherCheckToJson(VoucherCheck data) => json.encode(data.toJson());

class VoucherCheck {
    VoucherCheck({
        this.status,
        this.balance,
    });

    String status;
    int balance;

    factory VoucherCheck.fromJson(Map<String, dynamic> json) => VoucherCheck(
        status: json["status"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "balance": balance,
    };
}


// To parse this JSON data, do
//
//     final kaitModal = kaitModalFromJson(jsonString);


KaitModal kaitModalFromJson(String str) => KaitModal.fromJson(json.decode(str));

String kaitModalToJson(KaitModal data) => json.encode(data.toJson());

class KaitModal {
    String status;
    int code;
    String message;
    List<Market> markets;

    KaitModal({
         this.status,
         this.code,
         this.message,
         this.markets,
    });

    factory KaitModal.fromJson(Map<String, dynamic> json) => KaitModal(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        markets: List<Market>.from(json["markets"].map((x) => Market.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "markets": List<dynamic>.from(markets.map((x) => x.toJson())),
    };
}

class Market {
    String tradePairs;
    double lastPrice;
    double lowestAsk;
    double highestBid;
    double baseVolume;
    double quoteVolume;
    double priceChange24H;
    double highestPrice24H;
    double lowestPrice24H;

    Market({
         this.tradePairs,
         this.lastPrice,
         this.lowestAsk,
         this.highestBid,
         this.baseVolume,
         this.quoteVolume,
         this.priceChange24H,
         this.highestPrice24H,
         this.lowestPrice24H,
    });

    factory Market.fromJson(Map<String, dynamic> json) => Market(
        tradePairs: json["trade_pairs"],
        lastPrice: json["last_price"]?.toDouble(),
        lowestAsk: json["lowest_ask"]?.toDouble(),
        highestBid: json["highest_bid"]?.toDouble(),
        baseVolume: json["base_volume"]?.toDouble(),
        quoteVolume: json["quote_volume"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        highestPrice24H: json["highest_price_24h"]?.toDouble(),
        lowestPrice24H: json["lowest_price_24h"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "trade_pairs": tradePairs,
        "last_price": lastPrice,
        "lowest_ask": lowestAsk,
        "highest_bid": highestBid,
        "base_volume": baseVolume,
        "quote_volume": quoteVolume,
        "price_change_24h": priceChange24H,
        "highest_price_24h": highestPrice24H,
        "lowest_price_24h": lowestPrice24H,
    };
}
