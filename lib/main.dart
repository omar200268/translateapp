import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String translated = 'Metin Giriniz';
  String? selectedFromLanguage;
  String? selectedToLanguage;

  final languageCodes = {
    'Afrikaans': 'af',
    'Albanian': 'sq',
    'Amharic': 'am',
    'Arabic': 'ar',
    'Armenian': 'hy',
    'Assamese': 'as',
    'Aymara': 'ay',
    'Azerbaijani': 'az',
    'Bambara': 'bm',
    'Basque': 'eu',
    'Belarusian': 'be',
    'Bengali': 'bn',
    'Bhojpuri': 'bho',
    'Bosnian': 'bs',
    'Bulgarian': 'bg',
    'Catalan': 'ca',
    'Cebuano': 'ceb',
    'Corsican': 'co',
    'Croatian': 'hr',
    'Czech': 'cs',
    'Danish': 'da',
    'Dhivehi': 'dv',
    'Dogri': 'doi',
    'Dutch': 'nl',
    'English': 'en',
    'Esperanto': 'eo',
    'Estonian': 'et',
    'Ewe': 'ee',
    'Filipino (Tagalog)': 'fil',
    'Finnish': 'fi',
    'French': 'fr',
    'Frisian': 'fy',
    'Galician': 'gl',
    'Georgian': 'ka',
    'German': 'de',
    'Greek': 'el',
    'Guarani': 'gn',
    'Gujarati': 'gu',
    'Haitian Creole': 'ht',
    'Hausa': 'ha',
    'Hawaiian': 'haw',
    'Hebrew': 'he or iw',
    'Hindi': 'hi',
    'Hmong': 'hmn',
    'Hungarian': 'hu',
    'Icelandic': 'is',
    'Igbo': 'ig',
    'Ilocano': 'ilo',
    'Indonesian': 'id',
    'Irish': 'ga',
    'Italian': 'it',
    'Japanese': 'ja',
    'Javanese': 'jv or jw',
    'Kannada': 'kn',
    'Kazakh': 'kk',
    'Khmer': 'km',
    'Kinyarwanda': 'rw',
    'Konkani': 'gom',
    'Korean': 'ko',
    'Krio': 'kri',
    'Kurdish': 'ku',
    'Kurdish (Sorani)': 'ckb',
    'Kyrgyz': 'ky',
    'Lao': 'lo',
    'Latin': 'la',
    'Latvian': 'lv',
    'Lingala': 'ln',
    'Lithuanian': 'lt',
    'Luganda': 'lg',
    'Luxembourgish': 'lb',
    'Macedonian': 'mk',
    'Maithili': 'mai',
    'Malagasy': 'mg',
    'Malay': 'ms',
    'Malayalam': 'ml',
    'Maltese': 'mt',
    'Maori': 'mi',
    'Marathi': 'mr',
    'Meiteilon (Manipuri)': 'mni-Mtei',
    'Mizo': 'lus',
    'Mongolian': 'mn',
    'Myanmar (Burmese)': 'my',
    'Nepali': 'ne',
    'Norwegian': 'no',
    'Nyanja (Chichewa)': 'ny',
    'Odia (Oriya)': 'or',
    'Oromo': 'om',
    'Pashto': 'ps',
    'Persian': 'fa',
    'Polish': 'pl',
    'Portuguese (Portugal, Brazil)': 'pt',
    'Punjabi': 'pa',
    'Quechua': 'qu',
    'Romanian': 'ro',
    'Russian': 'ru',
    'Samoan': 'sm',
    'Sanskrit': 'sa',
    'Scots Gaelic': 'gd',
    'Sepedi': 'nso',
    'Serbian': 'sr',
    'Sesotho': 'st',
    'Shona': 'sn',
    'Sindhi': 'sd',
    'Sinhala (Sinhalese)': 'si',
    'Slovak': 'sk',
    'Slovenian': 'sl',
    'Somali': 'so',
    'Spanish': 'es',
    'Sundanese': 'su',
    'Swahili': 'sw',
    'Swedish': 'sv',
    'Tagalog (Filipino)': 'tl',
    'Tajik': 'tg',
    'Tamil': 'ta',
    'Tatar': 'tt',
    'Telugu': 'te',
    'Thai': 'th',
    'Tigrinya': 'ti',
    'Tsonga': 'ts',
    'Turkish': 'tr',
    'Turkmen': 'tk',
    'Twi (Akan)': 'ak',
    'Ukrainian': 'uk',
    'Urdu': 'ur',
    'Uyghur': 'ug',
    'Uzbek': 'uz',
    'Vietnamese': 'vi',
    'Welsh': 'cy',
    'Xhosa': 'xh',
    'Yiddish': 'yi',
    'Yoruba': 'yo',
    'Zulu': 'zu',
  };

  @override
  void initState() {
    super.initState();
    selectedFromLanguage = 'Turkish';
    selectedToLanguage = 'English';
    translateText();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.translate),
          title: const Text('Çeviri'),
        ),
        body: Card(
          margin: const EdgeInsets.all(12),
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('Metin Giriniz'),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: 'Metin Girin',
                    ),
                    onChanged: (text) {
                      setState(() {
                        translated = text;
                      });
                      translateText();
                    },
                  ),
                ),
                const Text('Çevrilen Metin'),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  translated,
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  height: 32,
                  thickness: 2,
                ),
                const Text('Çeviri Yapılacak Diller'),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildLanguageDropdown(selectedFromLanguage, true),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          final String? temp = selectedFromLanguage;
                          selectedFromLanguage = selectedToLanguage;
                          selectedToLanguage = temp;
                        });
                        translateText();
                      },
                      child: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    buildLanguageDropdown(selectedToLanguage, false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButton<String> buildLanguageDropdown(
      String? selectedLanguage, bool isFromLanguage) {
    final List<String> languageList = languageCodes.keys.toList();

    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (String? newLanguage) {
        setState(() {
          if (isFromLanguage) {
            selectedFromLanguage = newLanguage;
          } else {
            selectedToLanguage = newLanguage;
          }
          translateText();
        });
      },
      items: languageList.map((String language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language),
        );
      }).toList(),
    );
  }

  void translateText() async {
    if (selectedFromLanguage != null && selectedToLanguage != null) {
      final translator = GoogleTranslator();
      final translation = await translator.translate(
        translated,
        from: languageCodes[selectedFromLanguage!]!,
        to: languageCodes[selectedToLanguage!]!,
      );
      setState(() {
        translated = translation.text;
      });
    }
  }
}
