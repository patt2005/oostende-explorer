class Location {
  final String mapLocationUrl;
  final String informationUrl;
  final String imageAssetPath;
  final String title;

  Location({
    required this.mapLocationUrl,
    required this.informationUrl,
    required this.imageAssetPath,
    required this.title,
  });
}

List<Location> locations = [
  Location(
    mapLocationUrl:
        "https://beta.maps.apple.com/?ll=51.23107520940561%2C2.909231199999965&spn=0.008983199999995861%2C0.019344762699489593",
    informationUrl: "https://oostende.org/nl/strand/1065/kursaal.html",
    imageAssetPath: "assets/images/image.png",
    title: "Strand Oostende",
  ),
  Location(
    mapLocationUrl:
        "https://beta.maps.apple.com/?address=Prins+Boudewijnstraat%2C+Oostende%2C+Belgium&auid=2160785929789423830&ll=51.2296644%2C2.9213796&lsp=9902&q=Church+of+Saint+Peter+and+Saint+Paul",
    informationUrl: "https://en.wikipedia.org/wiki/Sint-Petrus-en-Pauluskerk",
    imageAssetPath: "assets/images/image (1).png",
    title: "Church of Saint Peter and Saint Paul",
  ),
  Location(
    mapLocationUrl:
        "https://beta.maps.apple.com/?address=Jan+Piers+Plein+2%2C+8400+Oostende%2C+Belgium&auid=14311580706707793554&ll=51.2268552%2C2.9199409&lsp=9902&q=Zeilschip+Mercator",
    informationUrl: "https://www.zeilschipmercator.be/nl",
    imageAssetPath: "assets/images/image (2).png",
    title: "Mercator",
  ),
  Location(
    mapLocationUrl:
        "https://beta.maps.apple.com/?address=Leopold+Park+1%2C+8400+Oostende%2C+Belgium&auid=4118569090870551678&ll=51.2284095%2C2.9144145&lsp=9902&q=Leopoldpark",
    informationUrl: "https://g.co/kgs/sZhAFf3",
    imageAssetPath: "assets/images/image (3).png",
    title: "Leopoldpark",
  ),
  Location(
    mapLocationUrl:
        "https://beta.maps.apple.com/?address=Vuurtorenweg+13%2C+8400+Oostende%2C+Belgium&auid=2885652298532900965&ll=51.2389235%2C2.934336&lsp=9902&q=Fort+Napoleon",
    informationUrl: "https://www.fort-napoleon.be/en",
    imageAssetPath: "assets/images/image (4).png",
    title: "Fort Napoleon",
  ),
];
