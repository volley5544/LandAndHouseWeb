// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SaveTopupDataModelStruct extends FFFirebaseStruct {
  SaveTopupDataModelStruct({
    String? lifeInsureAmt,
    String? transno,
    String? dbName,
    String? hashThaiId,
    String? contractNo,
    String? marketingConsent,
    String? sensitiveConsent,
    String? latitude,
    String? longitude,
    int? loanAmount,
    int? topupFee,
    int? feeAmount,
    int? transferAmount,
    int? interestRate,
    int? interestAmount,
    int? totalAmount,
    int? creditLimit,
    int? termPeriod,
    int? regularPeriod,
    int? lastPeriod,
    int? lastPeriodPromo,
    String? actImage,
    String? propertyImage,
    String? topupRequestFile,
    String? topupArgeementFile,
    String? topupReceiptFile,
    SavePdfDataModelStruct? savePdf,
    String? customerImage2,
    String? customerImage3,
    String? carImageFront,
    String? carImageBack,
    String? carImageLeft,
    String? carImageRight,
    String? carImageMile,
    String? source,
    String? referId,
    ProductsStruct? products,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lifeInsureAmt = lifeInsureAmt,
        _transno = transno,
        _dbName = dbName,
        _hashThaiId = hashThaiId,
        _contractNo = contractNo,
        _marketingConsent = marketingConsent,
        _sensitiveConsent = sensitiveConsent,
        _latitude = latitude,
        _longitude = longitude,
        _loanAmount = loanAmount,
        _topupFee = topupFee,
        _feeAmount = feeAmount,
        _transferAmount = transferAmount,
        _interestRate = interestRate,
        _interestAmount = interestAmount,
        _totalAmount = totalAmount,
        _creditLimit = creditLimit,
        _termPeriod = termPeriod,
        _regularPeriod = regularPeriod,
        _lastPeriod = lastPeriod,
        _lastPeriodPromo = lastPeriodPromo,
        _actImage = actImage,
        _propertyImage = propertyImage,
        _topupRequestFile = topupRequestFile,
        _topupArgeementFile = topupArgeementFile,
        _topupReceiptFile = topupReceiptFile,
        _savePdf = savePdf,
        _customerImage2 = customerImage2,
        _customerImage3 = customerImage3,
        _carImageFront = carImageFront,
        _carImageBack = carImageBack,
        _carImageLeft = carImageLeft,
        _carImageRight = carImageRight,
        _carImageMile = carImageMile,
        _source = source,
        _referId = referId,
        _products = products,
        super(firestoreUtilData);

  // "life_insure_amt" field.
  String? _lifeInsureAmt;
  String get lifeInsureAmt => _lifeInsureAmt ?? '';
  set lifeInsureAmt(String? val) => _lifeInsureAmt = val;

  bool hasLifeInsureAmt() => _lifeInsureAmt != null;

  // "transno" field.
  String? _transno;
  String get transno => _transno ?? '';
  set transno(String? val) => _transno = val;

  bool hasTransno() => _transno != null;

  // "db_name" field.
  String? _dbName;
  String get dbName => _dbName ?? '';
  set dbName(String? val) => _dbName = val;

  bool hasDbName() => _dbName != null;

  // "hash_thai_id" field.
  String? _hashThaiId;
  String get hashThaiId => _hashThaiId ?? '';
  set hashThaiId(String? val) => _hashThaiId = val;

  bool hasHashThaiId() => _hashThaiId != null;

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "marketing_consent" field.
  String? _marketingConsent;
  String get marketingConsent => _marketingConsent ?? '';
  set marketingConsent(String? val) => _marketingConsent = val;

  bool hasMarketingConsent() => _marketingConsent != null;

  // "sensitive_consent" field.
  String? _sensitiveConsent;
  String get sensitiveConsent => _sensitiveConsent ?? '';
  set sensitiveConsent(String? val) => _sensitiveConsent = val;

  bool hasSensitiveConsent() => _sensitiveConsent != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "loan_amount" field.
  int? _loanAmount;
  int get loanAmount => _loanAmount ?? 0;
  set loanAmount(int? val) => _loanAmount = val;

  void incrementLoanAmount(int amount) => loanAmount = loanAmount + amount;

  bool hasLoanAmount() => _loanAmount != null;

  // "topup_fee" field.
  int? _topupFee;
  int get topupFee => _topupFee ?? 0;
  set topupFee(int? val) => _topupFee = val;

  void incrementTopupFee(int amount) => topupFee = topupFee + amount;

  bool hasTopupFee() => _topupFee != null;

  // "fee_amount" field.
  int? _feeAmount;
  int get feeAmount => _feeAmount ?? 0;
  set feeAmount(int? val) => _feeAmount = val;

  void incrementFeeAmount(int amount) => feeAmount = feeAmount + amount;

  bool hasFeeAmount() => _feeAmount != null;

  // "transfer_amount" field.
  int? _transferAmount;
  int get transferAmount => _transferAmount ?? 0;
  set transferAmount(int? val) => _transferAmount = val;

  void incrementTransferAmount(int amount) =>
      transferAmount = transferAmount + amount;

  bool hasTransferAmount() => _transferAmount != null;

  // "interest_rate" field.
  int? _interestRate;
  int get interestRate => _interestRate ?? 0;
  set interestRate(int? val) => _interestRate = val;

  void incrementInterestRate(int amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "interest_amount" field.
  int? _interestAmount;
  int get interestAmount => _interestAmount ?? 0;
  set interestAmount(int? val) => _interestAmount = val;

  void incrementInterestAmount(int amount) =>
      interestAmount = interestAmount + amount;

  bool hasInterestAmount() => _interestAmount != null;

  // "total_amount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  set totalAmount(int? val) => _totalAmount = val;

  void incrementTotalAmount(int amount) => totalAmount = totalAmount + amount;

  bool hasTotalAmount() => _totalAmount != null;

  // "credit_limit" field.
  int? _creditLimit;
  int get creditLimit => _creditLimit ?? 0;
  set creditLimit(int? val) => _creditLimit = val;

  void incrementCreditLimit(int amount) => creditLimit = creditLimit + amount;

  bool hasCreditLimit() => _creditLimit != null;

  // "term_period" field.
  int? _termPeriod;
  int get termPeriod => _termPeriod ?? 0;
  set termPeriod(int? val) => _termPeriod = val;

  void incrementTermPeriod(int amount) => termPeriod = termPeriod + amount;

  bool hasTermPeriod() => _termPeriod != null;

  // "regular_period" field.
  int? _regularPeriod;
  int get regularPeriod => _regularPeriod ?? 0;
  set regularPeriod(int? val) => _regularPeriod = val;

  void incrementRegularPeriod(int amount) =>
      regularPeriod = regularPeriod + amount;

  bool hasRegularPeriod() => _regularPeriod != null;

  // "last_period" field.
  int? _lastPeriod;
  int get lastPeriod => _lastPeriod ?? 0;
  set lastPeriod(int? val) => _lastPeriod = val;

  void incrementLastPeriod(int amount) => lastPeriod = lastPeriod + amount;

  bool hasLastPeriod() => _lastPeriod != null;

  // "last_period_promo" field.
  int? _lastPeriodPromo;
  int get lastPeriodPromo => _lastPeriodPromo ?? 0;
  set lastPeriodPromo(int? val) => _lastPeriodPromo = val;

  void incrementLastPeriodPromo(int amount) =>
      lastPeriodPromo = lastPeriodPromo + amount;

  bool hasLastPeriodPromo() => _lastPeriodPromo != null;

  // "act_image" field.
  String? _actImage;
  String get actImage => _actImage ?? '';
  set actImage(String? val) => _actImage = val;

  bool hasActImage() => _actImage != null;

  // "property_image" field.
  String? _propertyImage;
  String get propertyImage => _propertyImage ?? '';
  set propertyImage(String? val) => _propertyImage = val;

  bool hasPropertyImage() => _propertyImage != null;

  // "topup_request_file" field.
  String? _topupRequestFile;
  String get topupRequestFile => _topupRequestFile ?? '';
  set topupRequestFile(String? val) => _topupRequestFile = val;

  bool hasTopupRequestFile() => _topupRequestFile != null;

  // "topup_argeement_file" field.
  String? _topupArgeementFile;
  String get topupArgeementFile => _topupArgeementFile ?? '';
  set topupArgeementFile(String? val) => _topupArgeementFile = val;

  bool hasTopupArgeementFile() => _topupArgeementFile != null;

  // "topup_receipt_file" field.
  String? _topupReceiptFile;
  String get topupReceiptFile => _topupReceiptFile ?? '';
  set topupReceiptFile(String? val) => _topupReceiptFile = val;

  bool hasTopupReceiptFile() => _topupReceiptFile != null;

  // "save_pdf" field.
  SavePdfDataModelStruct? _savePdf;
  SavePdfDataModelStruct get savePdf => _savePdf ?? SavePdfDataModelStruct();
  set savePdf(SavePdfDataModelStruct? val) => _savePdf = val;

  void updateSavePdf(Function(SavePdfDataModelStruct) updateFn) {
    updateFn(_savePdf ??= SavePdfDataModelStruct());
  }

  bool hasSavePdf() => _savePdf != null;

  // "customer_image_2" field.
  String? _customerImage2;
  String get customerImage2 => _customerImage2 ?? '';
  set customerImage2(String? val) => _customerImage2 = val;

  bool hasCustomerImage2() => _customerImage2 != null;

  // "customer_image_3" field.
  String? _customerImage3;
  String get customerImage3 => _customerImage3 ?? '';
  set customerImage3(String? val) => _customerImage3 = val;

  bool hasCustomerImage3() => _customerImage3 != null;

  // "car_image_front" field.
  String? _carImageFront;
  String get carImageFront => _carImageFront ?? '';
  set carImageFront(String? val) => _carImageFront = val;

  bool hasCarImageFront() => _carImageFront != null;

  // "car_image_back" field.
  String? _carImageBack;
  String get carImageBack => _carImageBack ?? '';
  set carImageBack(String? val) => _carImageBack = val;

  bool hasCarImageBack() => _carImageBack != null;

  // "car_image_left" field.
  String? _carImageLeft;
  String get carImageLeft => _carImageLeft ?? '';
  set carImageLeft(String? val) => _carImageLeft = val;

  bool hasCarImageLeft() => _carImageLeft != null;

  // "car_image_right" field.
  String? _carImageRight;
  String get carImageRight => _carImageRight ?? '';
  set carImageRight(String? val) => _carImageRight = val;

  bool hasCarImageRight() => _carImageRight != null;

  // "car_image_mile" field.
  String? _carImageMile;
  String get carImageMile => _carImageMile ?? '';
  set carImageMile(String? val) => _carImageMile = val;

  bool hasCarImageMile() => _carImageMile != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "refer_id" field.
  String? _referId;
  String get referId => _referId ?? '';
  set referId(String? val) => _referId = val;

  bool hasReferId() => _referId != null;

  // "products" field.
  ProductsStruct? _products;
  ProductsStruct get products => _products ?? ProductsStruct();
  set products(ProductsStruct? val) => _products = val;

  void updateProducts(Function(ProductsStruct) updateFn) {
    updateFn(_products ??= ProductsStruct());
  }

  bool hasProducts() => _products != null;

  static SaveTopupDataModelStruct fromMap(Map<String, dynamic> data) =>
      SaveTopupDataModelStruct(
        lifeInsureAmt: data['life_insure_amt'] as String?,
        transno: data['transno'] as String?,
        dbName: data['db_name'] as String?,
        hashThaiId: data['hash_thai_id'] as String?,
        contractNo: data['contract_no'] as String?,
        marketingConsent: data['marketing_consent'] as String?,
        sensitiveConsent: data['sensitive_consent'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        loanAmount: castToType<int>(data['loan_amount']),
        topupFee: castToType<int>(data['topup_fee']),
        feeAmount: castToType<int>(data['fee_amount']),
        transferAmount: castToType<int>(data['transfer_amount']),
        interestRate: castToType<int>(data['interest_rate']),
        interestAmount: castToType<int>(data['interest_amount']),
        totalAmount: castToType<int>(data['total_amount']),
        creditLimit: castToType<int>(data['credit_limit']),
        termPeriod: castToType<int>(data['term_period']),
        regularPeriod: castToType<int>(data['regular_period']),
        lastPeriod: castToType<int>(data['last_period']),
        lastPeriodPromo: castToType<int>(data['last_period_promo']),
        actImage: data['act_image'] as String?,
        propertyImage: data['property_image'] as String?,
        topupRequestFile: data['topup_request_file'] as String?,
        topupArgeementFile: data['topup_argeement_file'] as String?,
        topupReceiptFile: data['topup_receipt_file'] as String?,
        savePdf: data['save_pdf'] is SavePdfDataModelStruct
            ? data['save_pdf']
            : SavePdfDataModelStruct.maybeFromMap(data['save_pdf']),
        customerImage2: data['customer_image_2'] as String?,
        customerImage3: data['customer_image_3'] as String?,
        carImageFront: data['car_image_front'] as String?,
        carImageBack: data['car_image_back'] as String?,
        carImageLeft: data['car_image_left'] as String?,
        carImageRight: data['car_image_right'] as String?,
        carImageMile: data['car_image_mile'] as String?,
        source: data['source'] as String?,
        referId: data['refer_id'] as String?,
        products: data['products'] is ProductsStruct
            ? data['products']
            : ProductsStruct.maybeFromMap(data['products']),
      );

  static SaveTopupDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SaveTopupDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'life_insure_amt': _lifeInsureAmt,
        'transno': _transno,
        'db_name': _dbName,
        'hash_thai_id': _hashThaiId,
        'contract_no': _contractNo,
        'marketing_consent': _marketingConsent,
        'sensitive_consent': _sensitiveConsent,
        'latitude': _latitude,
        'longitude': _longitude,
        'loan_amount': _loanAmount,
        'topup_fee': _topupFee,
        'fee_amount': _feeAmount,
        'transfer_amount': _transferAmount,
        'interest_rate': _interestRate,
        'interest_amount': _interestAmount,
        'total_amount': _totalAmount,
        'credit_limit': _creditLimit,
        'term_period': _termPeriod,
        'regular_period': _regularPeriod,
        'last_period': _lastPeriod,
        'last_period_promo': _lastPeriodPromo,
        'act_image': _actImage,
        'property_image': _propertyImage,
        'topup_request_file': _topupRequestFile,
        'topup_argeement_file': _topupArgeementFile,
        'topup_receipt_file': _topupReceiptFile,
        'save_pdf': _savePdf?.toMap(),
        'customer_image_2': _customerImage2,
        'customer_image_3': _customerImage3,
        'car_image_front': _carImageFront,
        'car_image_back': _carImageBack,
        'car_image_left': _carImageLeft,
        'car_image_right': _carImageRight,
        'car_image_mile': _carImageMile,
        'source': _source,
        'refer_id': _referId,
        'products': _products?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'life_insure_amt': serializeParam(
          _lifeInsureAmt,
          ParamType.String,
        ),
        'transno': serializeParam(
          _transno,
          ParamType.String,
        ),
        'db_name': serializeParam(
          _dbName,
          ParamType.String,
        ),
        'hash_thai_id': serializeParam(
          _hashThaiId,
          ParamType.String,
        ),
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'marketing_consent': serializeParam(
          _marketingConsent,
          ParamType.String,
        ),
        'sensitive_consent': serializeParam(
          _sensitiveConsent,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'loan_amount': serializeParam(
          _loanAmount,
          ParamType.int,
        ),
        'topup_fee': serializeParam(
          _topupFee,
          ParamType.int,
        ),
        'fee_amount': serializeParam(
          _feeAmount,
          ParamType.int,
        ),
        'transfer_amount': serializeParam(
          _transferAmount,
          ParamType.int,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.int,
        ),
        'interest_amount': serializeParam(
          _interestAmount,
          ParamType.int,
        ),
        'total_amount': serializeParam(
          _totalAmount,
          ParamType.int,
        ),
        'credit_limit': serializeParam(
          _creditLimit,
          ParamType.int,
        ),
        'term_period': serializeParam(
          _termPeriod,
          ParamType.int,
        ),
        'regular_period': serializeParam(
          _regularPeriod,
          ParamType.int,
        ),
        'last_period': serializeParam(
          _lastPeriod,
          ParamType.int,
        ),
        'last_period_promo': serializeParam(
          _lastPeriodPromo,
          ParamType.int,
        ),
        'act_image': serializeParam(
          _actImage,
          ParamType.String,
        ),
        'property_image': serializeParam(
          _propertyImage,
          ParamType.String,
        ),
        'topup_request_file': serializeParam(
          _topupRequestFile,
          ParamType.String,
        ),
        'topup_argeement_file': serializeParam(
          _topupArgeementFile,
          ParamType.String,
        ),
        'topup_receipt_file': serializeParam(
          _topupReceiptFile,
          ParamType.String,
        ),
        'save_pdf': serializeParam(
          _savePdf,
          ParamType.DataStruct,
        ),
        'customer_image_2': serializeParam(
          _customerImage2,
          ParamType.String,
        ),
        'customer_image_3': serializeParam(
          _customerImage3,
          ParamType.String,
        ),
        'car_image_front': serializeParam(
          _carImageFront,
          ParamType.String,
        ),
        'car_image_back': serializeParam(
          _carImageBack,
          ParamType.String,
        ),
        'car_image_left': serializeParam(
          _carImageLeft,
          ParamType.String,
        ),
        'car_image_right': serializeParam(
          _carImageRight,
          ParamType.String,
        ),
        'car_image_mile': serializeParam(
          _carImageMile,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'refer_id': serializeParam(
          _referId,
          ParamType.String,
        ),
        'products': serializeParam(
          _products,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SaveTopupDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SaveTopupDataModelStruct(
        lifeInsureAmt: deserializeParam(
          data['life_insure_amt'],
          ParamType.String,
          false,
        ),
        transno: deserializeParam(
          data['transno'],
          ParamType.String,
          false,
        ),
        dbName: deserializeParam(
          data['db_name'],
          ParamType.String,
          false,
        ),
        hashThaiId: deserializeParam(
          data['hash_thai_id'],
          ParamType.String,
          false,
        ),
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        marketingConsent: deserializeParam(
          data['marketing_consent'],
          ParamType.String,
          false,
        ),
        sensitiveConsent: deserializeParam(
          data['sensitive_consent'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        loanAmount: deserializeParam(
          data['loan_amount'],
          ParamType.int,
          false,
        ),
        topupFee: deserializeParam(
          data['topup_fee'],
          ParamType.int,
          false,
        ),
        feeAmount: deserializeParam(
          data['fee_amount'],
          ParamType.int,
          false,
        ),
        transferAmount: deserializeParam(
          data['transfer_amount'],
          ParamType.int,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.int,
          false,
        ),
        interestAmount: deserializeParam(
          data['interest_amount'],
          ParamType.int,
          false,
        ),
        totalAmount: deserializeParam(
          data['total_amount'],
          ParamType.int,
          false,
        ),
        creditLimit: deserializeParam(
          data['credit_limit'],
          ParamType.int,
          false,
        ),
        termPeriod: deserializeParam(
          data['term_period'],
          ParamType.int,
          false,
        ),
        regularPeriod: deserializeParam(
          data['regular_period'],
          ParamType.int,
          false,
        ),
        lastPeriod: deserializeParam(
          data['last_period'],
          ParamType.int,
          false,
        ),
        lastPeriodPromo: deserializeParam(
          data['last_period_promo'],
          ParamType.int,
          false,
        ),
        actImage: deserializeParam(
          data['act_image'],
          ParamType.String,
          false,
        ),
        propertyImage: deserializeParam(
          data['property_image'],
          ParamType.String,
          false,
        ),
        topupRequestFile: deserializeParam(
          data['topup_request_file'],
          ParamType.String,
          false,
        ),
        topupArgeementFile: deserializeParam(
          data['topup_argeement_file'],
          ParamType.String,
          false,
        ),
        topupReceiptFile: deserializeParam(
          data['topup_receipt_file'],
          ParamType.String,
          false,
        ),
        savePdf: deserializeStructParam(
          data['save_pdf'],
          ParamType.DataStruct,
          false,
          structBuilder: SavePdfDataModelStruct.fromSerializableMap,
        ),
        customerImage2: deserializeParam(
          data['customer_image_2'],
          ParamType.String,
          false,
        ),
        customerImage3: deserializeParam(
          data['customer_image_3'],
          ParamType.String,
          false,
        ),
        carImageFront: deserializeParam(
          data['car_image_front'],
          ParamType.String,
          false,
        ),
        carImageBack: deserializeParam(
          data['car_image_back'],
          ParamType.String,
          false,
        ),
        carImageLeft: deserializeParam(
          data['car_image_left'],
          ParamType.String,
          false,
        ),
        carImageRight: deserializeParam(
          data['car_image_right'],
          ParamType.String,
          false,
        ),
        carImageMile: deserializeParam(
          data['car_image_mile'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        referId: deserializeParam(
          data['refer_id'],
          ParamType.String,
          false,
        ),
        products: deserializeStructParam(
          data['products'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SaveTopupDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaveTopupDataModelStruct &&
        lifeInsureAmt == other.lifeInsureAmt &&
        transno == other.transno &&
        dbName == other.dbName &&
        hashThaiId == other.hashThaiId &&
        contractNo == other.contractNo &&
        marketingConsent == other.marketingConsent &&
        sensitiveConsent == other.sensitiveConsent &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        loanAmount == other.loanAmount &&
        topupFee == other.topupFee &&
        feeAmount == other.feeAmount &&
        transferAmount == other.transferAmount &&
        interestRate == other.interestRate &&
        interestAmount == other.interestAmount &&
        totalAmount == other.totalAmount &&
        creditLimit == other.creditLimit &&
        termPeriod == other.termPeriod &&
        regularPeriod == other.regularPeriod &&
        lastPeriod == other.lastPeriod &&
        lastPeriodPromo == other.lastPeriodPromo &&
        actImage == other.actImage &&
        propertyImage == other.propertyImage &&
        topupRequestFile == other.topupRequestFile &&
        topupArgeementFile == other.topupArgeementFile &&
        topupReceiptFile == other.topupReceiptFile &&
        savePdf == other.savePdf &&
        customerImage2 == other.customerImage2 &&
        customerImage3 == other.customerImage3 &&
        carImageFront == other.carImageFront &&
        carImageBack == other.carImageBack &&
        carImageLeft == other.carImageLeft &&
        carImageRight == other.carImageRight &&
        carImageMile == other.carImageMile &&
        source == other.source &&
        referId == other.referId &&
        products == other.products;
  }

  @override
  int get hashCode => const ListEquality().hash([
        lifeInsureAmt,
        transno,
        dbName,
        hashThaiId,
        contractNo,
        marketingConsent,
        sensitiveConsent,
        latitude,
        longitude,
        loanAmount,
        topupFee,
        feeAmount,
        transferAmount,
        interestRate,
        interestAmount,
        totalAmount,
        creditLimit,
        termPeriod,
        regularPeriod,
        lastPeriod,
        lastPeriodPromo,
        actImage,
        propertyImage,
        topupRequestFile,
        topupArgeementFile,
        topupReceiptFile,
        savePdf,
        customerImage2,
        customerImage3,
        carImageFront,
        carImageBack,
        carImageLeft,
        carImageRight,
        carImageMile,
        source,
        referId,
        products
      ]);
}

SaveTopupDataModelStruct createSaveTopupDataModelStruct({
  String? lifeInsureAmt,
  String? transno,
  String? dbName,
  String? hashThaiId,
  String? contractNo,
  String? marketingConsent,
  String? sensitiveConsent,
  String? latitude,
  String? longitude,
  int? loanAmount,
  int? topupFee,
  int? feeAmount,
  int? transferAmount,
  int? interestRate,
  int? interestAmount,
  int? totalAmount,
  int? creditLimit,
  int? termPeriod,
  int? regularPeriod,
  int? lastPeriod,
  int? lastPeriodPromo,
  String? actImage,
  String? propertyImage,
  String? topupRequestFile,
  String? topupArgeementFile,
  String? topupReceiptFile,
  SavePdfDataModelStruct? savePdf,
  String? customerImage2,
  String? customerImage3,
  String? carImageFront,
  String? carImageBack,
  String? carImageLeft,
  String? carImageRight,
  String? carImageMile,
  String? source,
  String? referId,
  ProductsStruct? products,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaveTopupDataModelStruct(
      lifeInsureAmt: lifeInsureAmt,
      transno: transno,
      dbName: dbName,
      hashThaiId: hashThaiId,
      contractNo: contractNo,
      marketingConsent: marketingConsent,
      sensitiveConsent: sensitiveConsent,
      latitude: latitude,
      longitude: longitude,
      loanAmount: loanAmount,
      topupFee: topupFee,
      feeAmount: feeAmount,
      transferAmount: transferAmount,
      interestRate: interestRate,
      interestAmount: interestAmount,
      totalAmount: totalAmount,
      creditLimit: creditLimit,
      termPeriod: termPeriod,
      regularPeriod: regularPeriod,
      lastPeriod: lastPeriod,
      lastPeriodPromo: lastPeriodPromo,
      actImage: actImage,
      propertyImage: propertyImage,
      topupRequestFile: topupRequestFile,
      topupArgeementFile: topupArgeementFile,
      topupReceiptFile: topupReceiptFile,
      savePdf: savePdf ?? (clearUnsetFields ? SavePdfDataModelStruct() : null),
      customerImage2: customerImage2,
      customerImage3: customerImage3,
      carImageFront: carImageFront,
      carImageBack: carImageBack,
      carImageLeft: carImageLeft,
      carImageRight: carImageRight,
      carImageMile: carImageMile,
      source: source,
      referId: referId,
      products: products ?? (clearUnsetFields ? ProductsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaveTopupDataModelStruct? updateSaveTopupDataModelStruct(
  SaveTopupDataModelStruct? saveTopupDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saveTopupDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaveTopupDataModelStructData(
  Map<String, dynamic> firestoreData,
  SaveTopupDataModelStruct? saveTopupDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saveTopupDataModel == null) {
    return;
  }
  if (saveTopupDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saveTopupDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saveTopupDataModelData =
      getSaveTopupDataModelFirestoreData(saveTopupDataModel, forFieldValue);
  final nestedData =
      saveTopupDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      saveTopupDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaveTopupDataModelFirestoreData(
  SaveTopupDataModelStruct? saveTopupDataModel, [
  bool forFieldValue = false,
]) {
  if (saveTopupDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saveTopupDataModel.toMap());

  // Handle nested data for "save_pdf" field.
  addSavePdfDataModelStructData(
    firestoreData,
    saveTopupDataModel.hasSavePdf() ? saveTopupDataModel.savePdf : null,
    'save_pdf',
    forFieldValue,
  );

  // Handle nested data for "products" field.
  addProductsStructData(
    firestoreData,
    saveTopupDataModel.hasProducts() ? saveTopupDataModel.products : null,
    'products',
    forFieldValue,
  );

  // Add any Firestore field values
  saveTopupDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaveTopupDataModelListFirestoreData(
  List<SaveTopupDataModelStruct>? saveTopupDataModels,
) =>
    saveTopupDataModels
        ?.map((e) => getSaveTopupDataModelFirestoreData(e, true))
        .toList() ??
    [];
