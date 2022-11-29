import 'package:flutter_improve_your_ball/model/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test de l\'API', () {
    test('Récupération du token',
        (() => expect(API.recupToken('morbleu', 'Papoune1'), 'matcher')));
  });
}
