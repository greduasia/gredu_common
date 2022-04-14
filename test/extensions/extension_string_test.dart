// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/src/extensions/extension_date.dart';
import 'package:gredu_common/src/extensions/extension_string.dart';

void main() {
  group('Misc Extension String Test.', () {
    group('Get first word from a string', () {
      test('a string', () {
        const mockData = 'Gredu 123 321 123 321';
        final expected = mockData.firstWord;
        expect('Gredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.firstWord;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.firstWord;
        expect(null, expected);
      });
    });
    
    group('Get initial name from a string', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.initialName;
        expect('GA', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.initialName;
        expect('-', expected);
      });
    });

    group('Checks if the length of the String is more than s.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData > 'Gredu';
        expect(true, expected);
      });
      test('check if the length of string more or equal to. (2)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData > 'Gredu Asia Gredu Asia';
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData > 'Gredu';
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData > 'Gredu';
        expect(null, expected);
      });
    });

    group('Checks if the length of the String is more or equal to.', () {
      test('check if the length of string more or equal to. (1)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData >= 'Gredu';
        expect(true, expected);
      });
      test('check if the length of string more or equal to. (2)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData >= 'Gredu Asia Gredu Asia';
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData >= 'Gredu';
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData >= 'Gredu';
        expect(null, expected);
      });
    });

    group('Checks if the length of the String is less than s.', () {
      test('check if the length of string less than. (1)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData < 'Gredu';
        expect(false, expected);
      });
      test('check if the length of string less than. (2)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData < 'Gredu Asia Gredu Asia';
        expect(true, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData < 'Gredu';
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData < 'Gredu';
        expect(null, expected);
      });
    });

    group('Checks if the length of the String is less or equal to s.', () {
      test('check if the length of string less or equal to (1)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData <= 'Gredu Asia Gredu Asia';
        expect(true, expected);
      });
      test('check if the length of string less or equal to (2)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData <= '123';
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData <= 'Gredu';
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData <= 'Gredu';
        expect(null, expected);
      });
    });

    group('Subtracts-removes a text from a `String`.', () {
      test('subtract/remove a character', () {
        const mockData = 'Gredu Asia';
        final expected = mockData - 'Gredu ';
        expect('Asia', expected);
      });
      test('subtract/remove a character that not found', () {
        const mockData = 'Gredu Asia';
        final expected = mockData - '123';
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData - 'Gredu';
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData - 'Gredu';
        expect(null, expected);
      });
    });

    group('Returns the average read time duration of the given String in seconds.', () {
      test('with default param', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.readTime();
        expect(1, expected);
      });
      test('with wordPerMinute 100', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.readTime(wordsPerMinute: 100);
        expect(2, expected);
      });
      test('with wordPerMinute 50', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.readTime(wordsPerMinute: 50);
        expect(4, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.readTime();
        expect(0, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.readTime();
        expect(null, expected);
      });
    });

    group('Capitalizes the string in normal form.', () {
      test('a string.', () {
        const mockData = 'gReDU AsIA';
        final expected = mockData.capitalize;
        expect('Gredu asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.capitalize;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.capitalize;
        expect(null, expected);
      });
    });

    group('Returns the word count in the given string.', () {
      test('latin', () {
        const mockData = 'Gredu Asia Gredu Asia Gredu Asia Gredu Asia Gredu Asia';
        final expected = mockData.countWords;
        expect(10, expected);
      });
      test('greek.', () {
        const mockData = 'Τα αγαθά κόποις κτώνται';
        final expected = mockData.countWords;
        expect(0, expected);
      });
      test('number', () {
        const mockData = '123 456 789';
        final expected = mockData.countWords;
        expect(0, expected);
      });
      test('symbol.', () {
        const mockData = '!@# %^& *(()';
        final expected = mockData.countWords;
        expect(0, expected);
      });
      test('latin, greek, number and symbol', () {
        const mockData = 'Gredu αγαθά 123 Asia κτώνται !@# Gredu 456 κόποις Asia Gredu Asia 789 κόποις Gredu Asia %^& Gredu Τα Asia *()';
        final expected = mockData.countWords;
        expect(10, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.countWords;
        expect(0, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.countWords;
        expect(null, expected);
      });
    });

    group('Removes only the numbers from the String.', () {
      test('a string.', () {
        const mockData = 'Gre3du As4ia G3redu 2Asi23a G3r23edu5 As5i7a 7Gre76du A76si4a45 Gr454edu As343ia';
        final expected = mockData.removeNumbers;
        expect('Gredu Asia Gredu Asia Gredu Asia Gredu Asia Gredu Asia', expected);
      });
      test('all number.', () {
        const mockData = '1234567890';
        final expected = mockData.removeNumbers;
        expect('', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.removeNumbers;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.removeNumbers;
        expect(null, expected);
      });
    });

    group('Returns only the Latin characters from the String.', () {
      test('only latin .', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.onlyLatin;
        expect('Gredu Asia', expected);
      });
      test('latin and greek.', () {
        const mockData = 'Greduκτώνται Asia';
        final expected = mockData.onlyLatin;
        expect('Gredu Asia', expected);
      });
      test('latin, greek and numbers.', () {
        const mockData = '789Gredu 456κτώνται123Asia';
        final expected = mockData.onlyLatin;
        expect('Gredu Asia', expected);
      });
      test('latin, greek, numbers and symbols', () {
        const mockData = '789)(*Gredu !!456κτώνται123Asia!@#';
        final expected = mockData.onlyLatin;
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.onlyLatin;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.onlyLatin;
        expect(null, expected);
      });
    });

    group('Returns only the Greek characters from the String.', () {
      test('only greek.', () {
        const mockData = 'Τα αγαθά κόποις κτώνται';
        final expected = mockData.onlyGreek;
        expect('Τα αγαθά κόποις κτώνται', expected);
      });
      test('greek with numbers.', () {
        const mockData = 'Τα 123αγαθά 456κόποις 789κτώνται';
        final expected = mockData.onlyGreek;
        expect('Τα αγαθά κόποις κτώνται', expected);
      });
      test('greek with symbols', () {
        const mockData = '@#Τα α!γ^αθά κ)(&όποις *&^κτώνται';
        final expected = mockData.onlyGreek;
        expect('Τα αγαθά κόποις κτώνται', expected);
      });
      test('greek with numbers and symbols', () {
        const mockData = 'Τα@# αγα123θά κόπ1!@()121οις κ4343τώ56675ντα&*^ι';
        final expected = mockData.onlyGreek;
        expect('Τα αγαθά κόποις κτώνται', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.onlyGreek;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.onlyGreek;
        expect(null, expected);
      });
    });

    group('Check whether the string is null.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.isNull;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isNull;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isNull;
        expect(true, expected);
      });
    });

    group('Check whether the string is valid ipv4.', () {
      test('valid ipv4', () {
        const mockData = '192.168.1.1';
        final expected = mockData.isIpv4;
        expect(true, expected);
      });
      test('invalid ipv4 (1)', () {
        const mockData = '684D:1111:222:3333:4444:5555:6:77';
        final expected = mockData.isIpv4;
        expect(false, expected);
      });
      test('invalid ipv4 (2)', () {
        const mockData = '192.1.2.3.4.5.6.7';
        final expected = mockData.isIpv4;
        expect(false, expected);
      });
      test('invalid ipv4 (3)', () {
        const mockData = '192.1.2.3.4.5:6:7';
        final expected = mockData.isIpv4;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isIpv4;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isIpv4;
        expect(null, expected);
      });
    });
    
    group('Check whether the string is valid ipv6.', () {
      test('valid ipv6', () {
        const mockData = '684D:1111:222:3333:4444:5555:6:77';
        final expected = mockData.isIpv6;
        expect(true, expected);
      });
      test('invalid ipv6 (1)', () {
        const mockData = '8:8:8:8:8:6:5';
        final expected = mockData.isIpv6;
        expect(false, expected);
      });
      test('invalid ipv6 (2)', () {
        const mockData = '192.1.2.3.4.5.6.7';
        final expected = mockData.isIpv6;
        expect(false, expected);
      });
      test('invalid ipv6 (3)', () {
        const mockData = '192.1.2.3.4.5:6:7';
        final expected = mockData.isIpv6;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isIpv6;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isIpv6;
        expect(null, expected);
      });
    });

    group('Check whether the string is valid url.', () {
      test('valid url', () {
        const mockData = 'www.google.com';
        final expected = mockData.isUrl;
        expect(true, expected);
      });
      test('valid url too', () {
        const mockData = 'google.com';
        final expected = mockData.isUrl;
        expect(true, expected);
      });
      test('valid url with http', () {
        const mockData = 'http://www.google.com';
        final expected = mockData.isUrl;
        expect(true, expected);
      });
      test('invalid url', () {
        const mockData = '.google.';
        final expected = mockData.isUrl;
        expect(false , expected);
      });
      test('valid mail:to url', () {
        const mockData = 'mailto:somebody@google.com';
        final expected = mockData.isUrl;
        expect(true , expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isUrl;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isUrl;
        expect(null, expected);
      });
    });

    group('Check whether the string is valid date (ISO 8601 patterns).', () {
      test('dd/mm/yyyy', () {
        const mockData = '01/01/2022';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('dd-mm-yyyy', () {
        const mockData = '01-01-2022';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('dd.mm.yyyy', () {
        const mockData = '01.01.2022';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('yyyy-mm-dd', () {
        const mockData = '2022-01-01';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('yyyy-mm-dd hrs', () {
        const mockData = '2022-01-01 20';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('yyyyMMdd', () {
        const mockData = '19990322';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test("yyyy-MM-dd'T'HH:mm:ss.SSS", () {
        const mockData = '1999-03-22T05:06:07.000';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test("yyyy-MM-dd'T'HH:mm:ss", () {
        const mockData = '1999-03-22T05:06:07';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", () {
        const mockData = '1999-03-22T05:06:07.000Z';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test("yyyy-MM-dd'T'HH:mm:ss.SSSXXX", () {
        const mockData = '1999-03-22T05:06:07.000+01:00';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test("yyyy-MM-dd'T'HH:mm:ssXXX", () {
        const mockData = '1999-03-22T05:06:07+01:00';
        final expected = mockData.isDate;
        expect(true, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isDate;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isDate;
        expect(null, expected);
      });
    });

    group('Check whether the string is valid mail.', () {
      test('valid email', () {
        const mockData = 'gredu@asia.com';
        final expected = mockData.isMail;
        expect(true, expected);
      });
      test('invalid email without @', () {
        const mockData = 'greduasia.com';
        final expected = mockData.isMail;
        expect(false, expected);
      });
      test('invalid email .com', () {
        const mockData = 'gredu@asia';
        final expected = mockData.isMail;
        expect(false, expected);
      });
      test('invalid email only with @.com', () {
        const mockData = '@.com';
        final expected = mockData.isMail;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isMail;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isMail;
        expect(null, expected);
      });
    });

    group('Check whether the string is a number.', () {
      test('interger', () {
        const mockData = '2022';
        final expected = mockData.isNumber;
        expect(true, expected);
      });
      test('double (.)', () {
        const mockData = '20.22';
        final expected = mockData.isNumber;
        expect(true, expected);
      });
      test('double (,)', () {
        const mockData = '20,22';
        final expected = mockData.isNumber;
        expect(false, expected);
      });
      test('with equation', () {
        final mockData = pow(2, 32).toString();
        final expected = mockData.isNumber;
        expect(true, expected);
      });
      test('with equation too', () {
        const mockData = ((8000 / (5 * 10)) - 32) ~/ (29 % 5);
        final expected = mockData.toString().isNumber;
        expect(true, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isNumber;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isNumber;
        expect(null, expected);
      });
    });

    group('Check whether the string is a strong password.', () {
      test('only letter', () {
        const mockData = 'Gredu';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('only numbers', () {
        const mockData = '123';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('only symbols', () {
        const mockData = '@!#';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('only letter and numbers', () {
        const mockData = 'Gredu123';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('only letter and symbol', () {
        const mockData = '@Gredu';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('only numbers and symbol', () {
        const mockData = '@!#123';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('with letter, numbers and symbol', () {
        const mockData = '@Gredu123';
        final expected = mockData.isStrongPassword;
        expect(true, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isStrongPassword;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isStrongPassword;
        expect(null, expected);
      });
    });

    group('Check whether the string is a valid guid.', () {
      test('string with valid guid', () {
        const mockData = '123e4567-e89b-12d3-a456-9AC7CBDCEE52';
        final expected = mockData.isGuid;
        expect(true, expected);
      });
      test('string with invalid guid', () {
        const mockData = 'e89b-123e4567-12d3-a456-9AC7CBDCEE52';
        final expected = mockData.isGuid;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isGuid;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isGuid;
        expect(null, expected);
      });
    });

    group('check whether the string exists in given iterable string.', () {
      test('an array contain data that needed', () {
        const mockData = ['abcd', 'efgh', 'ijkl'];
        const lookingFor = 'abcd';
        final expected = lookingFor.isIn(mockData);
        expect(true, expected);
      });
      test('an array doesnt contain data that needed', () {
        const mockData = ['abcd', 'efgh', 'ijkl'];
        const lookingFor = 'xxxx';
        final expected = lookingFor.isIn(mockData);
        expect(false, expected);
      });
      test('an object contain data that needed', () {
        const mockData = {'abcd', 'efgh', 'ijkl'};
        const lookingFor = 'abcd';
        final expected = lookingFor.isIn(mockData);
        expect(true, expected);
      });
      test('an object doesnt contain data that needed', () {
        const mockData = {'abcd', 'efgh', 'ijkl'};
        const lookingFor = 'xxxx';
        final expected = lookingFor.isIn(mockData);
        expect(false, expected);
      });
      test('empty string with array', () {
        const mockData = ['abcd', 'efgh', 'ijkl'];
        const lookingFor = '';
        final expected = lookingFor.isIn(mockData);
        expect(null, expected);
      });
      test('empty string with object', () {
        const mockData = {'abcd', 'efgh', 'ijkl'};
        const lookingFor = '';
        final expected = lookingFor.isIn(mockData);
        expect(null, expected);
      });
      test('null string with empty array', () {
        const Iterable<String> mockData = [];
        const String? lookingFor = null;
        final expected = lookingFor.isIn(mockData);
        expect(null, expected);
      });
      test('null string with object', () {
        const Iterable<String> mockData = [];
        const String? lookingFor = null;
        final expected = lookingFor.isIn(mockData);
        expect(null, expected);
      });
    });

    group('Check if the string has only Latin characters.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.isLatin;
        expect(true, expected);
      });
      test('a string with numbers', () {
        const mockData = 'Gredu Asia 123';
        final expected = mockData.isLatin;
        expect(false, expected);
      });
      test('a string with greek', () {
        const mockData = 'Gredu Asia Τα αγαθά κόποις κτώνται';
        final expected = mockData.isLatin;
        expect(false, expected);
      });
      test('a string with symbols', () {
        const mockData = 'Gredu Asia 2022';
        final expected = mockData.isLatin;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isLatin;
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isLatin;
        expect(null, expected);
      });
    });

    group('Check if the string has only Greek characters.', () {
      test('a string with all greek', () {
        const mockData = 'Τα αγαθά κόποις κτώνται';
        final expected = mockData.isGreek;
        expect(true, expected);
      });
      test('a string with greek and numbers', () {
        const mockData = 'Τα 123  αγαθά κόποις κτώνται';
        final expected = mockData.isGreek;
        expect(false, expected);
      });
      test('a string with greek and symbols', () {
        const mockData = 'Τα !@#  αγαθά κόποις κτώνται';
        final expected = mockData.isGreek;
        expect(false, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.isGreek;
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.isGreek;
        expect(null, expected);
      });
    });

    group('Returns only the numbers from the String.', () {
      test('a string', () {
        const mockData = 'Τα Gredu123 αγαθά4 Asia5 κόποις6 7κτώνται';
        final expected = mockData.onlyNumbers;
        expect('1234567', expected);
      });
      test('a string with greek word, numbers and symbols', () {
        const mockData = '*Τα G**r!!ed**u!A1s!i2a!3!';
        final expected = mockData.onlyNumbers;
        expect('123', expected);
      });
      test('a string without numbers', () {
        const mockData = '*Τα G**r!!ed**u!As!ia!!';
        final expected = mockData.onlyNumbers;
        expect('', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.onlyNumbers;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.onlyNumbers;
        expect(null, expected);
      });
    });

    group('Removes only the letters from the String.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.removeLetters;
        expect(' ', expected);
      });
      test('a string with greek word, numbers and symbols', () {
        const mockData = '*Τα G**r!!ed**u!A1s!i2a!3!';
        final expected = mockData.removeLetters;
        expect('*Τα **!!**!1!2!3!', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.removeLetters;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.removeLetters;
        expect(null, expected);
      });
    });

    group('Finds all character ooccurences and returns count as.', () {
      test('a string', () {
        const mockData = 'Gredu Asia Gredu';
        final expected = mockData.charOccurences;
        expect([{' ': 2}, {'A': 1}, {'G': 2}, {'a': 1}, {'d': 2}, {'e': 2}, {'i': 1}, {'r': 2}, {'s': 1}, {'u': 2}], expected);
      });
      test('a string with numbers and symbols', () {
        const mockData = '1!2G@3(#r#45%6e!@^7&d&*%8*9(0u)';
        final expected = mockData.charOccurences;
        expect([{'!': 2}, {'#': 2}, {'%': 2}, {'&': 2}, {'(': 2}, {')': 1}, {'*': 2}, {'0': 1}, {'1': 1}, {'2': 1}, {'3': 1}, {'4': 1}, {'5': 1}, {'6': 1}, {'7': 1}, {'8': 1}, {'9': 1}, {'@': 2}, {'G': 1}, {'^': 1}, {'d': 1}, {'e': 1}, {'r': 1}], expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.charOccurences;
        expect([], expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.charOccurences;
        expect(null, expected);
      });
    });

    group('Finds a specifics character occurence in a string.', () {
      test('a string', () {
        const mockData = 'Where’s the peck of pickled peppers Peter Piper picked?';
        final expected = mockData.charCount('e');
        expect(11, expected);
      });
      test('a string too', () {
        const mockData = 'Where’s the peck of pickled peppers Peter Piper picked?';
        final expected = mockData.charCount('x');
        expect(0, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.charCount('');
        expect(0, expected);
      });
      test('empty too', () {
        const mockData = '';
        final expected = mockData.charCount('x');
        expect(0, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.charCount('x');
        expect(null, expected);
      });
    });

    group('Finds the most frequent character in the String.', () {
      test('a string', () {
        const mockData = 'Where’s the peck of pickled peppers Peter Piper picked?';
        final expected = mockData.mostFrequent;
        expect('e', expected);
      });
      test('a string too', () {
        const mockData = 'Where’s 11 the 111 peck 1 of 1 pickled 11 peppers 11 Peter 111 Piper 1 picked 1?';
        final expected = mockData.mostFrequent;
        expect(' ', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.mostFrequent;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.mostFrequent;
        expect(null, expected);
      });
    });

    group('Returns the String reversed.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.reverse;
        expect('aisA uderG', expected);
      });
      test('a string with numbers', () {
        const mockData = 'Gredu 123 Asia 456';
        final expected = mockData.reverse;
        expect('654 aisA 321 uderG', expected);
      });
      test('a string with numbers and symbol', () {
        const mockData = 'Gredu 123 #%^ Asia )*( 456';
        final expected = mockData.reverse;
        expect('654 (*) aisA ^%# 321 uderG', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.reverse;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.reverse;
        expect(null, expected);
      });
    });

    group('Returns the first [n] characters of the string.', () {
      test('first character in string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.first();
        expect('G', expected);
      });
      test('second first character in string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.first(n:2);
        expect('Gr', expected);
      });
      test('character in string with n more than string length (positif value)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.first(n:99);
        expect('Gredu Asia', expected);
      });
      test('character in string with n more than string length (negatif value)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.first(n:-99);
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.first();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.first();
        expect(null, expected);
      });
    });

    group('Returns the last [n] characters of the string.', () {
      test('last character in string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.last();
        expect('a', expected);
      });
      test('second last character in string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.last(n:2);
        expect('ia', expected);
      });
      test('character in string with n more than string length (positif value)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.last(n:99);
        expect('Gredu Asia', expected);
      });
      test('character in string with n more than string length (negatif value)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.last(n:-99);
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.last();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.last();
        expect(null, expected);
      });
    });

    group('Returns the string to slug case.', () {
      test('3 word', () {
        const mockData = 'Gredu Asia Indonesia';
        final expected = mockData.toSlug;
        expect('Gredu_Asia_Indonesia', expected);
      });
      test('2 word', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.toSlug;
        expect('Gredu_Asia', expected);
      });
      test('a word', () {
        const mockData = 'Gredu';
        final expected = mockData.toSlug;
        expect('Gredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toSlug;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toSlug;
        expect(null, expected);
      });
    });

    group('Returns the String in camelcase.', () {
      test('3 word', () {
        const mockData = 'Gredu Asia Indonesia';
        final expected = mockData.toCamelCase;
        expect('greduAsiaIndonesia', expected);
      });
      test('2 word', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.toCamelCase;
        expect('greduAsia', expected);
      });
      test('a word', () {
        const mockData = 'Gredu';
        final expected = mockData.toCamelCase;
        expect('gredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toCamelCase;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toCamelCase;
        expect(null, expected);
      });
    });

    group('Returns the word title cased.', () {
      test('a string', () {
        const mockData = 'Gredu asia gRedu aSia GredU aSiA';
        final expected = mockData.toTitleCase;
        expect('Gredu Asia Gredu Asia Gredu Asia', expected);
      });
      test('a string with numbers in front of word and end of word', () {
        const mockData = 'Gredu 123 asia456 gRedu 789aSia GredU 000aSiA';
        final expected = mockData.toTitleCase;
        expect('Gredu 123 Asia456 Gredu 789asia Gredu 000asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toTitleCase;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toTitleCase;
        expect(null, expected);
      });
    });

    group('Returns a list of the strings characters.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.toArray;
        expect(['G','r','e','d','u',' ','A','s','i','a'], expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toArray;
        expect([], expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toArray;
        expect(null, expected);
      });
    });

    group('Converts a string to a numeric value if possible.', () {
      test('string to number parse a word that have number', () {
        const mockData = '20Gredu22';
        final expected = mockData.toNum();
        expect(null, expected);
      });
      test('string to number parse a word that have number with onlyNumbers', () {
        const mockData = '20Gredu22';
        final expected = mockData.onlyNumbers.toNum();
        expect(2022, expected);
      });
      test('string to number parse a word', () {
        const mockData = 'Gredu';
        final expected = mockData.toNum();
        expect(null, expected);
      });
      test('string to number with valid number', () {
        const mockData = '2022';
        final expected = mockData.toNum();
        expect(2022, expected);
      });
      test('string to number with with symbol (.)', () {
        const mockData = '20.22';
        final expected = mockData.toNum();
        expect(20.22, expected);
      });
      test('string to number with with symbol (,)', () {
        const mockData = '20,22';
        final expected = mockData.toNum();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toNum();
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toNum();
        expect(null, expected);
      });
    });

    group('Converts a string to int if possible.', () {
      test('string to int parse a word that have number', () {
        const mockData = '20Gredu22';
        final expected = mockData.toInt();
        expect(null, expected);
      });
      test('string to int parse a word that have number with onlyNumbers', () {
        const mockData = '20Gredu22';
        final expected = mockData.onlyNumbers.toInt();
        expect(2022, expected);
      });
      test('string to int parse a word', () {
        const mockData = 'Gredu';
        final expected = mockData.toInt();
        expect(null, expected);
      });
      test('string to int with valid number', () {
        const mockData = '2022';
        final expected = mockData.toInt();
        expect(2022, expected);
      });
      test('string to int with with symbol (.)', () {
        const mockData = '20.22';
        final expected = mockData.toInt();
        expect(20, expected);
      });
      test('string to int with with symbol (,)', () {
        const mockData = '20,22';
        final expected = mockData.toInt();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toInt();
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toInt();
        expect(null, expected);
      });
    });

    group('Converts a string to double if possible.', () {
      test('string to double parse a word that have number', () {
        const mockData = '20Gredu22';
        final expected = mockData.toDouble();
        expect(null, expected);
      });
      test('string to double parse a word that have number with onlyNumbers', () {
        const mockData = '20Gredu22';
        final expected = mockData.onlyNumbers.toDouble();
        expect(2022.0, expected);
      });
      test('string to double parse a word', () {
        const mockData = 'Gredu';
        final expected = mockData.toDouble();
        expect(null, expected);
      });
      test('string to double with valid number', () {
        const mockData = '2022';
        final expected = mockData.toDouble();
        expect(2022.0, expected);
      });
      test('string to double with with symbol (.)', () {
        const mockData = '20.22';
        final expected = mockData.toDouble();
        expect(20.22, expected);
      });
      test('string to double with with symbol (,)', () {
        const mockData = '20,22';
        final expected = mockData.toDouble();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.toDouble();
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.toDouble();
        expect(null, expected);
      });
    });

    group('Replaces all greek words with latin. Comes handy when you want to normalize text for search.', () {
      test('greek sentence', () {
        const mockData = 'μην τεμπελιάζεις να μελετάς';
        final expected = mockData.replaceGreek;
        expect('miν tempeliazeis νa meletas', expected);
      });
      test('compound greek sentence', () {
        const mockData = 'please τεμπελιάζεις dont να replace μελετάς this';
        final expected = mockData.replaceGreek;
        expect('please tempeliazeis dont νa replace meletas this', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.replaceGreek;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.replaceGreek;
        expect(null, expected);
      });
    });

    group('Given a pattern returns the starting indices of all occurences of the pattern in the string.', () {
      test('a string', () {
        const mockData = 'Peter Piper picked a peck of pickled peppers';
        final expected = mockData.findPattern(pattern: 'e');
        expect([1, 3, 9, 16, 22, 34, 38, 41], expected);
      });
      test('a string with pattern not found', () {
        const mockData = 'Peter Piper picked a peck of pickled peppers';
        final expected = mockData.findPattern(pattern: 'x');
        expect([], expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.findPattern(pattern: 'x');
        expect([], expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.findPattern(pattern: 'x');
        expect(null, expected);
      });
    });

    group('Strips all HTML code from String.', () {
      test('valid html code in string', () {
        const mockData = '<p>My cat is <strong>very</strong> grumpy.</p>';
        final expected = mockData.stripHtml;
        expect('My cat is very grumpy.', expected);
      });
      test('invalid html code in string', () {
        const mockData = '<noscript>h1>What is this doing here??</h1></noscript';
        final expected = mockData.stripHtml;
        expect('h1>What is this doing here??</noscript', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.stripHtml;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.stripHtml;
        expect(null, expected);
      });
    });

    group('If the provided string is empty do something.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        // ignore: avoid_print
        final expected = mockData.ifEmpty(() => print('empty so do something'));
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        // ignore: avoid_print
        final expected = mockData.ifEmpty(() => print('empty so do something'));
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        // ignore: avoid_print
        final expected = mockData.ifEmpty(() => print('empty so do something'));
        expect(null, expected);
      });
    });

    group('If the provided string is null do something.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        // ignore: avoid_print
        final expected = mockData.ifNull(() => print('null so do something'));
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        // ignore: avoid_print
        final expected = mockData.ifNull(() => print('null so do something'));
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        // ignore: avoid_print
        final expected = mockData.ifNull(() => print('null so do something'));
        expect(null, expected);
      });
    });

    group('Provide default value if the String is null.', () {
      test('a string', () {
        const mockData = 'Gredu';
        final expected = mockData.defaultValue('-');
        expect('Gredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.defaultValue('-');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.defaultValue('-');
        expect('-', expected);
      });
    });

    group('Repeats a string [count] times.', () {
      test('a string.', () {
        const mockData = 'Gredu';
        final expected = mockData.repeat(3);
        expect('GreduGreduGredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.repeat(3);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.repeat(3);
        expect(null, expected);
      });
    });

    group('Squeezes the string by removing repeats of a given character.', () {
      test('squeeze `u`', () {
        const mockData = 'Greduuuuuuuuuuuuuuuuuuuuuuuuuuu';
        final expected = mockData.squeeze('u');
        expect('Gredu', expected);
      });
      test('squeeze `a` that not found', () {
        const mockData = 'Greduuuuuuuuuuuuuuuuuuuuuuuuuuu';
        final expected = mockData.squeeze('a');
        expect('Greduuuuuuuuuuuuuuuuuuuuuuuuuuu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.squeeze('a');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.squeeze('a');
        expect(null, expected);
      });
    });

    group('Checks if the string is consisted of same characters (ignores cases).', () {
      test('a string', () {
        const mockData = 'its a string its a string';
        final expected = mockData.hasSameCharacters;
        expect(false, expected);
      });
      test('all charater same', () {
        const mockData = 'aaaaaa';
        final expected = mockData.hasSameCharacters;
        expect(true, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.hasSameCharacters;
        expect(false, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.hasSameCharacters;
        expect(null, expected);
      });
    });
    
    group('Shuffles the given string characters.', () {
      test('this case return unpredictable order, will never match, unless you are god level lucky', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.shuffle;
        expect('unpredictable order', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.shuffle;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.shuffle;
        expect(null, expected);
      });
    });

    group('The Levenshtein distance between two words is the minimum number of single-character.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.getLevenshtein('Asia');
        expect(6, expected);
      });
      test('not in a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.getLevenshtein('Qwerty');
        expect(9, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.getLevenshtein('Qwerty');
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.getLevenshtein('Qwerty');
        expect(null, expected);
      });
    });

    group('Formats a String with a specific mask.', ()  {
      test('masking a string with symbol `#` and correct length of mock data', () {
        const mockData = 'GreduatorsIndonesia';
        const mask = 'Hello We Are ########## from #########';
        final expected = mockData.formatWithMask(mask);
        expect('Hello We Are Greduators from Indonesia', expected);
      });
      test('masking a string with symbol `#` and incorrect length of mock data', () {
        const mockData = 'GreduatorsIndonesia';
        const mask = 'Hello We Are ######## from #######';
        final expected = mockData.formatWithMask(mask);
        expect('Hello We Are Greduato from rsIndon', expected);
      });
      test('masking a string with incorrect symbol `@` and correct length of mock data', () {
        const mockData = 'GreduatorsIndonesia';
        const mask = 'Hello We Are @@@@@@@@@@@ from @@@@@@@@@';
        final expected = mockData.formatWithMask(mask);
        expect('Hello We Are @@@@@@@@@@@ from @@@@@@@@@', expected);
      });
      test('masking a string with incorrect symbol `@` and incorrect length of mock data', () {
        const mockData = 'GreduatorsIndonesia';
        const mask = 'Hello We Are @@@@@@@@ from @@@@@@@@';
        final expected = mockData.formatWithMask(mask);
        expect('Hello We Are @@@@@@@@ from @@@@@@@@', expected);
      });
      test('empty', () {
        const mockData = '';
        const mask = 'Hello We Are @@@@@@@@ from @@@@@@@@';
        final expected = mockData.formatWithMask(mask);
        expect(null, expected);
      });
      test('null', () {
        const String? mockData = null;
        const mask = 'Hello We Are @@@@@@@@ from @@@@@@@@';
        final expected = mockData.formatWithMask(mask);
        expect(null, expected);
      });
    });

    group('Removes the first [n] characters of the string.', () {
      test('a string', () {
        const mockData = 'aaaGredu';
        final expected = mockData.removeFirst(3);
        expect('Gredu', expected);
      });
      test('with index more than string length (positif valueinteger)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.removeFirst(99);
        expect('', expected);
      });
      test('with index more than string length (negatif value)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.removeFirst(-99);
        expect('Greduaaa', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.removeFirst(5);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.removeFirst(5);
        expect(null, expected);
      });
    });
    
    group('Removes the last [n] characters of the string.', () {
      test('a string', () {
        const mockData = 'Greduaaa';
        final expected = mockData.removeLast(3);
        expect('Gredu', expected);
      });
      test('with index more than string length (positif valueinteger)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.removeLast(99);
        expect('', expected);
      });
      test('with index more than string length (negatif value)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.removeLast(-99);
        expect('Greduaaa', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.removeLast(5);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.removeLast(5);
        expect(null, expected);
      });
    });

    group('Trims the `String` to have maximum [n] characters.', () {
      test('a string', () {
        const mockData = 'Greduaaa';
        final expected = mockData.maxChars(5);
        expect('Gredu', expected);
      });
      test('with index more than string length (positif valueinteger)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.maxChars(99);
        expect('Greduaaa', expected);
      });
      test('with index more than string length (negatif value)', () {
        const mockData = 'Greduaaa';
        final expected = mockData.maxChars(-99);
        expect('', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.maxChars(5);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.maxChars(5);
        expect(null, expected);
      });
    });

    group('Reverses slash by providing [direction].', () {
      // ignore: use_raw_strings
      test('Reverses / with direction `0`', () {
        // ignore: use_raw_strings
        const mockData = 'D:/Work/GREDU';
        final expected = mockData.reverseSlash(0);
        // ignore: use_raw_strings
        expect('D:\\Work\\GREDU', expected);
      });
      test('Reverses / with direction `1`', () {
        // ignore: use_raw_strings
        const mockData = 'D:/Work/GREDU';
        final expected = mockData.reverseSlash(1);
        // ignore: use_raw_strings
        expect('D:/Work/GREDU', expected);
      });
      // ignore: use_raw_strings
      test('Reverses \\ with direction `0`', () {
        // ignore: use_raw_strings
        const mockData = 'D:\\Work\\GREDU';
        final expected = mockData.reverseSlash(0);
        // ignore: use_raw_strings
        expect('D:\\Work\\GREDU', expected);
      });
      // ignore: use_raw_strings
      test('Reverses \\ with direction `1`', () {
        // ignore: use_raw_strings
        const mockData = 'D:\\Work\\GREDU';
        final expected = mockData.reverseSlash(1);
        expect('D:/Work/GREDU', expected);
      });
      test('empty with direction `0`', () {
        const mockData = '';
        final expected = mockData.reverseSlash(0);
        expect('', expected);
      });
      test('empty with direction `1`', () {
        const mockData = '';
        final expected = mockData.reverseSlash(1);
        expect('', expected);
      });
      test('null with direction `0`', () {
        const String?mockData = null;
        final expected = mockData.reverseSlash(0);
        expect(null, expected);
      });
      test('null with direction `1`', () {
        const String?mockData = null;
        final expected = mockData.reverseSlash(1);
        expect(null, expected);
      });
    });
    
    group('Returns the character at [index].', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.charAt(1);
        expect('r', expected);
      });
      test('select index more than string length (positif valueinteger)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.charAt(99);
        expect(null, expected);
      });
      test('select index more than string length (negatif value)', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.charAt(-99);
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.charAt(1);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.charAt(1);
        expect(null, expected);
      });
    });
    
    group('Appends a [suffix] to the `String`.', () {
      test('a string', () {
        const mockData = 'Asia';
        final expected = mockData.append(' Gredu');
        expect('Asia Gredu', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.append('Gredu');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.append('Gredu');
        expect(null, expected);
      });
    });
    
    group('Prepends a [prefix] to the `String`.', () {
      test('a string', () {
        const mockData = 'Asia';
        final expected = mockData.prepend('Gredu ');
        expect('Gredu Asia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.prepend('Gredu');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.prepend('Gredu');
        expect(null, expected);
      });
    });
    
    group('Tries to format the current `String` to price amount.', () {
      test('int to string then format with currencySymbol `Rp`', () {
        final mockData = 20000000.toString();
        final expected = mockData.toPriceAmount(currencySymbol: 'Rp');
        expect('Rp 20.000.000,00', expected);
      });
      test('format with currencySymbol `Rp`', () {
        const mockData = '20000000';
        final expected = mockData.toPriceAmount(currencySymbol: 'Rp');
        expect('Rp 20.000.000,00', expected);
      });
      test('format with currencySymbol `Rp` and symbol position on rear', () {
        const mockData = '20000000';
        final expected = mockData.toPriceAmount(currencySymbol: 'Rp', symbolPosition: 'rear');
        expect('20.000.000,00 Rp', expected);
      });
      // ignore: use_raw_strings
      test('format with currencySymbol `\$`, locale `en_EN` and remove default symbol', () {
        const mockData = '20000000';
        // ignore: use_raw_strings
        final expected = mockData.toPriceAmount(currencySymbol: '\$', locale: 'en_EN', removeDefaultSymbol: 'USD');
        // ignore: use_raw_strings
        expect('\$ 20,000,000.00', expected);
      });
      // ignore: use_raw_strings
      test('format with currencySymbol `\$`, locale `en_EN`, symbol position on rear and remove default symbol', () {
        const mockData = '20000000';
        // ignore: use_raw_strings
        final expected = mockData.toPriceAmount(currencySymbol: '\$', locale: 'en_EN', removeDefaultSymbol: 'USD', symbolPosition: 'rear');
        // ignore: use_raw_strings
        expect('20,000,000.00 \$', expected);
      });
      test('empty', () {
        const mockData = '';
        // ignore: use_raw_strings
        final expected = mockData.toPriceAmount(currencySymbol: '\$', locale: 'en_EN', removeDefaultSymbol: 'USD', symbolPosition: 'rear');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        // ignore: use_raw_strings
        final expected = mockData.toPriceAmount(currencySymbol: '\$', locale: 'en_EN', removeDefaultSymbol: 'USD', symbolPosition: 'rear');
        expect(null, expected);
      });
    });
    
    group('Returns the day name of the date provided.', () {
      test('a string', () {
        const mockData = '2022-01-01';
        final expected = mockData.getDayFromDate();
        expect('Saturday', expected);
      });
      test('convert from DateTime to a string', () {
        final mockData = DateTime(2022, 12, 20).toString();
        final expected = mockData.getDayFromDate();
        expect('Tuesday', expected);
      });
      test('convert from extention date to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toString();
        final expected = mockData.getDayFromDate();
        expect('Monday', expected);
      });
      test('convert from extention date with format (dd MMM yyyy) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'dd MMM yyyy');
        final expected = mockData.getDayFromDate();
        expect(null, expected);
      });
      test('convert from extention date with format (yyyy MMMM dd) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'yyyy MMMM dd');
        final expected = mockData.getDayFromDate();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.getDayFromDate();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.getDayFromDate();
        expect(null, expected);
      });
    });
    
    group('Returns the month name of the date provided.', () {
      test('a string', () {
        const mockData = '2022-01-01';
        final expected = mockData.getMonthFromDate();
        expect('January', expected);
      });
      test('convert from DateTime to a string', () {
        final mockData = DateTime(2022, 12, 20).toString();
        final expected = mockData.getMonthFromDate();
        expect('December', expected);
      });
      test('convert from extention date to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toString();
        final expected = mockData.getMonthFromDate();
        expect('January', expected);
      });
      test('convert from extention date with format (dd MMM yyyy) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'dd MMM yyyy');
        final expected = mockData.getMonthFromDate();
        expect(null, expected);
      });
      test('convert from extention date with format (yyyy MMMM dd) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'yyyy MMMM dd');
        final expected = mockData.getMonthFromDate();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.getMonthFromDate();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.getMonthFromDate();
        expect(null, expected);
      });
    });
    
    group('Returns the first day of the month from the provided `DateTime`.', () {
      test('a string', () {
        const mockData = '2022-01-01';
        final expected = mockData.firstDayOfMonth();
        expect('Saturday', expected);
      });
      test('convert from DateTime to a string', () {
        final mockData = DateTime(2022, 12, 20).toString();
        final expected = mockData.firstDayOfMonth();
        expect('Thursday', expected);
      });
      test('convert from extention date to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toString();
        final expected = mockData.firstDayOfMonth();
        expect('Saturday', expected);
      });
      test('convert from extention date with format (dd MMM yyyy) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'dd MMM yyyy');
        final expected = mockData.firstDayOfMonth();
        expect(null, expected);
      });
      test('convert from extention date with format (yyyy MMMM dd) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'yyyy MMMM dd');
        final expected = mockData.firstDayOfMonth();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.firstDayOfMonth();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.firstDayOfMonth();
        expect(null, expected);
      });
    });
    
    group('Returns the last day of the month from the provided `DateTime`.', () {
      test('a string', () {
        const mockData = '2022-01-01';
        final expected = mockData.lastDayOfMonth();
        expect('Monday', expected);
      });
      test('convert from DateTime to a string', () {
        final mockData = DateTime(2022, 12, 20).toString();
        final expected = mockData.lastDayOfMonth();
        expect('Saturday', expected);
      });
      test('convert from extention date to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toString();
        final expected = mockData.lastDayOfMonth();
        expect('Monday', expected);
      });
      test('convert from extention date with format (dd MMM yyyy) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'dd MMM yyyy');
        final expected = mockData.lastDayOfMonth();
        expect(null, expected);
      });
      test('convert from extention date with format (yyyy MMMM dd) to a string', () {
        final mockData = '2022-01-10T05:20:34Z'.toDateEx().toStringEx(format: 'yyyy MMMM dd');
        final expected = mockData.lastDayOfMonth();
        expect(null, expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.lastDayOfMonth();
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.lastDayOfMonth();
        expect(null, expected);
      });
    });
    
    group('Returns the left side of the `String` starting from [char].', () {
      test('remove left off', () {
        const mockData = 'Gredu Asiahuhu';
        final expected = mockData.leftOf('huhu');
        expect('Gredu Asia', expected);
      });
      test('empty string', () {
        const mockData = '';
        final expected = mockData.leftOf('huhu');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.leftOf('huhu');
        expect(null, expected);
      });
    });
    
    group('Returns the right side of the `String` starting from [char].', () {
      test('remove right off', () {
        const mockData = 'huhuGredu Asia';
        final expected = mockData.rightOf(' huhu');
        expect('Gredu Asia', expected);
      });
      test('empty string', () {
        const mockData = '';
        final expected = mockData.rightOf('huhu');
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.rightOf('huhu');
        expect(null, expected);
      });
    });

    group('Truncates a `String` with more than `length` characters.', () {
      test('2 words', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.truncate(5);
        expect('Gredu...', expected);
      });
      test('empty string', () {
        const mockData = '';
        final expected = mockData.truncate(5);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.truncate(5);
        expect(null, expected);
      });
    });

    group('Truncates a long `String` in the middle while retaining the beginning and the end.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.truncateMiddle(5);
        expect('Gre...ia', expected);
      });
      test('empty', () {
        const mockData = '';
        final expected = mockData.truncateMiddle(5);
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.truncateMiddle(5);
        expect(null, expected);
      });
    });

    group('Quotes the `String` adding "" at the start & at the end.', () {
      test('a string', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.quote;
        expect('"Gredu Asia"', expected);
      });
      test('empty string', () {
        const mockData = '';
        final expected = mockData.quote;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.quote;
        expect(null, expected);
      });
    });

    group('Trims leading and trailing spaces, so as extra spaces in between words.', () {
      test('words with many whitespace', () {
        const mockData = 'Gredu        Asia   Gredu     Asia';
        final expected = mockData.trimAll;
        expect('Gredu Asia Gredu Asia', expected);
      });
      test('empty string', () {
        const mockData = '';
        final expected = mockData.trimAll;
        expect('', expected);
      });
      test('null', () {
        const String? mockData = null;
        final expected = mockData.trimAll;
        expect(null, expected);
      });
    });
    
    group('Searches the string for the first occurrence of a [pattern] and returns.', () {
      test('2 words.', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.allAfter('Gredu ');
        expect('Asia', expected);
      });
      test('1 word.', () {
        const mockData = 'Gredu';
        final expected = mockData.allAfter('');
        expect('Gredu', expected);
      });
      test('no words.', () {
        const mockData = '';
        final expected = mockData.allAfter('');
        expect('', expected);
      });
    });
    
    group('Searches the string for the last occurrence of a [pattern] and returns.', () {
      test('2 words.', () {
        const mockData = 'Gredu Asia';
        final expected = mockData.allBefore(' Asia');
        expect('Gredu', expected);
      });
      test('1 word.', () {
        const mockData = 'Gredu';
        final expected = mockData.allBefore('');
        expect('Gredu', expected);
      });
      test('no words.', () {
        const mockData = '';
        final expected = mockData.allBefore('');
        expect('', expected);
      });
    });
    
    group('Searches the string for the first occurrence of [startPattern] and the last occurrence of [endPattern]. It returns the string between that occurrences.', () {
      test('between 4 words.', () {
        const mockData = 'hehe Gredu huhu hiya';
        final expected = mockData.allBetween('hehe ', ' hiya');
        expect('Gredu huhu', expected);
      });
      test('between 3 words.', () {
        const mockData = 'hehe Gredu huhu';
        final expected = mockData.allBetween('hehe ', ' huhu');
        expect('Gredu', expected);
      });
      test('between 2 words.', () {
        const mockData = 'hehe Gredu';
        final expected = mockData.allBetween('hehe ', '');
        expect('Gredu', expected);
      });
    });
    
    group('Get document extention.', () {
      test('type pdf.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how.pdf';
        final expected = mockData.typeDocumentUrl;
        expect(DocumentType.pdf, expected);
      });
      test('other type.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how.rar';
        final expected = mockData.typeDocumentUrl;
        expect(DocumentType.file, expected);
      });
      test('no type.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how';
        final expected = mockData.typeDocumentUrl;
        expect(DocumentType.file, expected);
      });
    });
    
    group('Get document icon.', () {
      test('type pdf.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how.pdf';
        final expected = mockData.iconDocument;
        expect('assets/images/ic_pdf.svg', expected);
      });
      test('other type.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how.rar';
        final expected = mockData.iconDocument;
        expect('assets/images/ic_file.svg', expected);
      });
      test('no type.', () {
        const mockData = 'gredu_files/one_plus_one_equal_to_three_but_how';
        final expected = mockData.iconDocument;
        expect('assets/images/ic_file.svg', expected);
      });
    });


    group('Convert Currency.', () {
      test('with all number.', () {
        const mockData = '1200000';
        final expected = mockData.convertCurrency();
        expect('Rp. 1.200.000', expected);
      });

      test('with invalid format, symbol (,) and function onlyNumbers.', () {
        const mockData = '1,200,000';
        final expected = mockData.onlyNumbers.convertCurrency();
        expect('Rp. 1.200.000', expected);
      });

      test('with invalid format, symbol (.) and function onlyNumbers.', () {
        const mockData = '1.200.000';
        final expected = mockData.onlyNumbers.convertCurrency();
        expect('Rp. 1.200.000', expected);
      });

      test('with invalid format & symbol (,).', () {
        const mockData = '1,200,000';
        final expected = mockData.convertCurrency();
        expect('Rp. 1.200.000', expected);
      });
    });


    group('Parse JSON.', () {
    test('with valid json convert to string.', () {
      final mockData = { 'a': 'a' }.toString();
      final expected = mockData.parseJSON();
      // ignore: avoid_escaping_inner_quotes
      expect('{ \'a\': \'a\' }', expected);
    });

    test('with valid json in string.', () {
      const mockData = '''{ 'a': 'a' }''';
      final expected = jsonEncode(mockData).parseJSON();
      // ignore: avoid_escaping_inner_quotes
      expect('{ \'a\': \'a\' }', expected);
    });

    test('with empty string.', () {
      const mockData = '''''';
      final expected = jsonEncode(mockData).parseJSON();
      // ignore: avoid_escaping_inner_quotes
      expect('', expected);
    });

    test('with null value.', () {
      const String? mockData = null;
      final expected = jsonEncode(mockData).parseJSON();
      // ignore: avoid_escaping_inner_quotes
      expect(null, expected);
    });
  });

  });

  group('Nullable String is null or empty Extention.', () {
    test('Check String is null or empty (have value) .', () {
      const mockData = 'not null';
      final expected = mockData.isNullOrEmpty;
      expect(false, expected);
    });

    test('Check String is null or empty (empty String).', () {
      const mockData = '';
      final expected = mockData.isNullOrEmpty;
      expect(true, expected);
    });

    test('Check String is null or empty (value null).', () {
      const mockData = null;
      final expected = mockData.isNullOrEmpty;
      expect(true, expected);
    });

    test('Check Nullable String is null or empty (have value) .', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? mockData = 'not null';
      final expected = mockData.isNullOrEmpty;
      expect(false, expected);
    });

    test('Check Nullable String is null or empty (empty String).', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? mockData = '';
      final expected = mockData.isNullOrEmpty;
      expect(true, expected);
    });

    test('Check Nullable String is null or empty (value null).', () {
      const String? mockData = null;
      final expected = mockData.isNullOrEmpty;
      expect(true, expected);
    });
  });

  group('Nullable String is not null or empty Extention.', () {
    test('Check String is not null or empty (have value) .', () {
      const mockData = 'not null';
      final expected = mockData.isNotNullOrEmpty;
      expect(true, expected);
    });

    test('Check String is not null or empty (empty String).', () {
      const mockData = '';
      final expected = mockData.isNotNullOrEmpty;
      expect(false, expected);
    });

    test('Check String is not null or empty (value null).', () {
      const mockData = null;
      final expected = mockData.isNotNullOrEmpty;
      expect(false, expected);
    });

    test('Check Nullable String is not null or empty (have value) .', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? mockData = 'not null';
      final expected = mockData.isNotNullOrEmpty;
      expect(true, expected);
    });

    test('Check Nullable String is not null or empty (empty String).', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? mockData = '';
      final expected = mockData.isNotNullOrEmpty;
      expect(false, expected);
    });

    test('Check Nullable String is not null or empty (value null).', () {
      const String? mockData = null;
      final expected = mockData.isNotNullOrEmpty;
      expect(false, expected);
    });
  });

}
