class Debtor {
  int _idUserDebtor;
  String _userName;
  String _userContact;
  String _debitDate;
  String _reason;
  String _imageURL;

  Debtor(
      {int idUserDebtor,
      String userName,
      String userContact,
      String debitDate,
      String reason,
      String imageURL}) {
    this._idUserDebtor = idUserDebtor;
    this._userName = userName;
    this._userContact = userContact;
    this._debitDate = debitDate;
    this._reason = reason;
    this._imageURL = imageURL;
  }

  int get idUserDebtor => _idUserDebtor;
  set idUserDebtor(int idUserDebtor) => _idUserDebtor = idUserDebtor;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get userContact => _userContact;
  set userContact(String userContact) => _userContact = userContact;
  String get debitDate => _debitDate;
  set debitDate(String debitDate) => _debitDate = debitDate;
  String get reason => _reason;
  set reason(String reason) => _reason = reason;
  String get imageURL => _imageURL;
  set imageURL(String imageURL) => _imageURL = imageURL;

  Debtor.fromJson(Map<String, dynamic> json) {
    _idUserDebtor = json['idUserDebtor'];
    _userName = json['userName'];
    _userContact = json['userContact'];
    _debitDate = json['debitDate'];
    _reason = json['reason'];
    _imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUserDebtor'] = this._idUserDebtor;
    data['userName'] = this._userName;
    data['userContact'] = this._userContact;
    data['debitDate'] = this._debitDate;
    data['reason'] = this._reason;
    data['imageURL'] = this._imageURL;
    return data;
  }
}