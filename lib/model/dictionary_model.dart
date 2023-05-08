class Dictionary {
  Dictionary({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  final String? word;
  final String? phonetic;
  final List<Phonetic> phonetics;
  final String? origin;
  final List<Meaning> meanings;

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return Dictionary(
      word: json["word"],
      phonetic: json["phonetic"],
      phonetics: json["phonetics"] == null
          ? []
          : List<Phonetic>.from(
              json["phonetics"]!.map((x) => Phonetic.fromJson(x))),
      origin: json["origin"],
      meanings: json["meanings"] == null
          ? []
          : List<Meaning>.from(
              json["meanings"]!.map((x) => Meaning.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": phonetics.map((x) => x?.toJson()).toList(),
        "origin": origin,
        "meanings": meanings.map((x) => x?.toJson()).toList(),
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String? partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json["partOfSpeech"],
      definitions: json["definitions"] == null
          ? []
          : List<Definition>.from(
              json["definitions"]!.map((x) => Definition.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": definitions.map((x) => x?.toJson()).toList(),
      };
}

class Definition {
  Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  final String? definition;
  final String? example;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json["definition"],
      example: json["example"],
      synonyms: json["synonyms"] == null
          ? []
          : List<dynamic>.from(json["synonyms"]!.map((x) => x)),
      antonyms: json["antonyms"] == null
          ? []
          : List<dynamic>.from(json["antonyms"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": synonyms.map((x) => x).toList(),
        "antonyms": antonyms.map((x) => x).toList(),
      };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  final String? text;
  final String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json["text"],
      audio: json["audio"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
