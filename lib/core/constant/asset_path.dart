class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();

  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/images/svg/$name.svg';

  //*Svg
  String get arrowLeft => _toSVG('arrow_left');
  String get arrowRightiOS => _toSVG('arrow_right_ios');
  String get chart => _toSVG('chart');
  String get close => _toSVG('close');
  String get copy => _toSVG('copy');
  String get wallet => _toSVG('wallet');
}
