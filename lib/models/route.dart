import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oostende_explorer_app/utilities/route_status.dart';

class TravelRoute {
  final String title;
  final String description;
  RouteStatus status;
  final List<String> relatedTopics;
  final List<RouteStop> stops;

  TravelRoute({
    required this.title,
    required this.status,
    required this.relatedTopics,
    required this.stops,
    required this.description,
  });
}

class RouteStop {
  final String title;
  final String description;
  final String locationUrl;
  final LatLng location;

  RouteStop({
    required this.title,
    required this.description,
    required this.locationUrl,
    required this.location,
  });
}

final List<TravelRoute> travelRoutes = [
  TravelRoute(
    title: 'Historical route: "In the footsteps of kings and sailors"',
    status: RouteStatus.notBought,
    relatedTopics: ["art", "music", "history"],
    stops: [
      RouteStop(
        title: "Fort Napoleon (Fort Napoleon)",
        location: const LatLng(51.2389235, 2.934336),
        description:
            "Start by visiting the fort, built at the beginning of the 19th century. Here you can learn about the military history of the city.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Vuurtorenweg+13%2C+8400+Oostende%2C+Belgium&auid=2885652298532900965&ll=51.2389235%2C2.934336&lsp=9902&q=Fort+Napoleon",
      ),
      RouteStop(
        location: const LatLng(51.2221356, 2.9281397),
        title: "Royal Gallery (Koninginnehof)",
        description:
            "Stroll through this beautiful arcade that was built for the royal family.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Platanendreef+1%2C+8400+Oostende%2C+Belgium&auid=8745898112701436260&ll=51.2221356%2C2.9281397&lsp=9902&q=Koninginnehof",
      ),
      RouteStop(
        location: const LatLng(51.2296165, 2.9210834),
        title: "Church of Saints Peter and Paul (Sint-Petrus-en-Pauluskerk)",
        description:
            "A fascinating example of neo-Gothic architecture with impressive stained glass windows.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Prins+Boudewijnstraat%2C+Oostende%2C+Belgium&auid=10078183280545013134&ll=51.2296165%2C2.9210834&lsp=9902&q=Sint-Petrus-en-Pauluskerk",
      ),
      RouteStop(
        location: const LatLng(51.23241820857492, 2.9223870876904265),
        title: "Fishing Harbor (Visserskaai)",
        description:
            "Visit the old fishing harbor where you can see fishing boats and taste fresh seafood.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Visserskaai%2C+Oostende%2C+Belgium&ll=51.23241820857492%2C2.9223870876904265&q=Visserskaai",
      ),
      RouteStop(
        location: const LatLng(51.2294748, 2.9239262),
        title: "Museum on board the fishing vessel Amandine",
        description:
            "Complete the itinerary at the museum on board the vessel, which tells the story of the life and work of the fishermen.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Vindictivelaan+35%2C+8400+Oostende%2C+Belgium&auid=15282602793870256876&ll=51.2294748%2C2.9239262&lsp=9902&q=Museumschip+Amandine",
      ),
    ],
    description:
        "This route takes you through Ostend's historic sites, where you can feel the atmosphere of past centuries and learn more about the city's maritime heritage.",
  ),
  TravelRoute(
    title: 'Art route: "Art and beauty of Ostend"',
    status: RouteStatus.notBought, // Adjust the status as needed
    relatedTopics: ["art", "culture", "museums"],
    description:
        "For art lovers, this route covers galleries, museums, and art locations where you can enjoy contemporary and classic art.",
    stops: [
      RouteStop(
        location: const LatLng(51.2255323, 2.9145732),
        title: "Museum of Contemporary Art (Mu.ZEE)",
        description:
            "The main contemporary art museum with works by Belgian artists.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Romestraat+11%2C+8400+Oostende%2C+Belgium&auid=12867616316520142426&ll=51.2255323%2C2.9145732&lsp=9902&q=Mu.ZEE",
      ),
      RouteStop(
        location: const LatLng(51.2363229, 2.9305083),
        title: "Ostend Lighthouse (Lange Nelle)",
        description:
            "Climb the lighthouse to see the city from above and take memorable photos.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Hendrik+Baelskaai+1%2C+8400+Oostende%2C+Belgium&auid=10028196136997415420&ll=51.2363229%2C2.9305083&lsp=9902&q=Lange+Nelle", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2166162, 2.9154765),
        title: "Professor Jean Bourgainpark",
        description:
            "Stroll around the city to see the many outdoor murals and sculptures, including works by Street Art.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Ooievaarslaan%2C+Oostende%2C+Belgium&auid=13212981460941209743&ll=51.2166162%2C2.9154765&lsp=9902&q=Professor+Jean+Bourgainpark", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.233334, 2.916067),
        title: "James Ensor House Gallery",
        description:
            "House-museum of the famous Belgian artist James Ensor with his works and personal belongings.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Vlaanderenstraat+29%2C+8400+Oostende%2C+Belgium&auid=17288874084696047410&ll=51.233334%2C2.916067&lsp=9902&q=Ensor", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2284095, 2.9144145),
        title: "Leopoldpark",
        description:
            "End the day in the park, where you can see sculptures and enjoy nature.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Leopold+Park+1%2C+8400+Oostende%2C+Belgium&auid=4118569090870551678&ll=51.2284095%2C2.9144145&lsp=9902&q=Leopoldpark", // Add URL manually
      ),
    ],
  ),
  TravelRoute(
    title: 'Gastronomic route: "Tastes of Ostend"',
    status: RouteStatus.notBought, // Update status as needed
    relatedTopics: ["food", "cuisine", "drinks"],
    description:
        "For foodies who want to experience the authentic taste of the city through its cuisine and drinks.",
    stops: [
      RouteStop(
        location: const LatLng(51.2292613, 2.9087055),
        title: "Savarin Modern European Cuisine",
        description:
            "A popular restaurant offering modern European cuisine with a focus on fresh, local ingredients.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Albert+I-promenade+75%2C+8400+Oostende%2C+Belgium&auid=17055693997421682294&ll=51.2292613%2C2.9087055&lsp=9902&q=Savarin", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2345165, 2.9232179),
        title: "Royal North Sea Yacht Club - Yacht Club",
        description:
            "A charming location where you can enjoy fresh seafood with a stunning view of the harbor.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Montgomerykaai+1%2C+8400+Oostende%2C+Belgium&auid=16248140903453065766&ll=51.2345165%2C2.9232179&lsp=9902&q=Royal+North+Sea+Yacht+Club", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2325485, 2.9155655),
        title: "Cafe Koekoek",
        description:
            "A famous cafe where you can taste fried chicken with signature sauces, a local favorite.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Langestraat+38%2C+8400+Oostende%2C+Belgium&auid=7340202035739758666&ll=51.2325485%2C2.9155655&lsp=9902&q=Koekoek", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2326967, 2.916579),
        title: "Restaurant Benny Oostende",
        description:
            "Taste authentic Belgian waffles with a variety of delicious toppings at this cozy spot.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Vlaanderenstraat+13%2C+8400+Oostende%2C+Belgium&auid=16369531105999098454&ll=51.2326967%2C2.916579&lsp=9902&q=Restaurant+Benny+Oostende", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2316906, 2.9143372),
        title: "Manuscript Pub",
        description:
            "End the evening in this cozy pub, known for its great selection of Belgian beers and inviting atmosphere.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Langestraat+23%2C+8400+Oostende%2C+Belgium&auid=13773253215922358267&ll=51.2316906%2C2.9143372&lsp=9902&q=Manuscript", // Add URL manually
      ),
    ],
  ),
  TravelRoute(
    title: 'Family route: "Oostende for everyone"',
    status: RouteStatus.notBought, // Update status as needed
    relatedTopics: ["family", "entertainment", "kids"],
    description:
        "An ideal route for families with children, combining activities, entertainment and interesting places.",
    stops: [
      RouteStop(
        location: const LatLng(51.2310752, 2.9092312),
        title: "Oostende Beach",
        description:
            "Start the day on the beach where children can play in the sand and adults can enjoy the sea view.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Albert+I-promenade%2C+Belgium&auid=9599851981036817705&ll=51.2310752%2C2.9092312&lsp=9902&q=Plage+d%27Ostende", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2040203, 2.907586),
        title: "Villa Aqua",
        description:
            "Visit the water park with slides, pools, and interactive areas for children.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Pensjagersstraat+28%2C+8400+Oostende%2C+Belgium&auid=13957468215521795402&ll=51.2040203%2C2.907586&lsp=9902&q=Villa+Aqua", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.232642, 2.9219996),
        title: "North Sea Aquarium",
        description:
            "Learn about the region's marine life, including fish, jellyfish, and other sea creatures.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Visserskaai+25%2C+8400+Oostende%2C+Belgium&auid=818213628949724794&ll=51.232642%2C2.9219996&lsp=9902&q=North+Sea+Aquarium+%28Noordzeeaquarium%29", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2284095, 2.9144145),
        title: "Leopoldpark",
        description:
            "Relax in the park, where you can ride boats or just take a walk among the beautiful green areas.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Leopold+Park+1%2C+8400+Oostende%2C+Belgium&auid=4118569090870551678&ll=51.2284095%2C2.9144145&lsp=9902&q=Leopoldpark", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2382422, 2.9391342),
        title: "Hangtime Play Center",
        description:
            "End the day at the center with trampolines, playrooms, and other attractions for kids.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Fortstraat+128B%2C+8400+Oostende%2C+Belgium&auid=3450881299923388297&ll=51.2382422%2C2.9391342&lsp=9902&q=Hangtime", // Add URL manually
      ),
    ],
  ),
  TravelRoute(
    title: 'Romantic route: "Sunset in Ostend"',
    status: RouteStatus.notBought, // Update status as needed
    relatedTopics: ["romance", "scenic", "couples"],
    description:
        "Romantic route for couples, covering the most beautiful places for walks and rest.",
    stops: [
      RouteStop(
        location: const LatLng(51.2350388, 2.9200351),
        title: "Promenade (Albert I Promenade)",
        description:
            "Start your walk along the sea, enjoying the view of the waves and the fresh sea air.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Koningspark+79%2C+8400+Oostende%2C+Belgium&auid=9168770726475671033&ll=51.2350388%2C2.9200351&lsp=9902&q=Albert+I+Promenade", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2363229, 2.9305083),
        title: "Ostend Lighthouse (Lange Nelle)",
        description:
            "Climb the lighthouse to see the city from above and take memorable photos.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Hendrik+Baelskaai+1%2C+8400+Oostende%2C+Belgium&auid=10028196136997415420&ll=51.2363229%2C2.9305083&lsp=9902&q=Lange+Nelle", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.220453, 2.9256023),
        title: "Royal Maria Henrietta Park",
        description:
            "Stroll through this romantic park with a lake, swans, and cozy benches.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Iepen+Dreef+1%2C+8400+Oostende%2C+Belgium&auid=5293810774798342594&ll=51.220453%2C2.9256023&lsp=9902&q=Maria+Hendrika+Park", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2371493, 2.9157248),
        title: "De Nieuwe Oostende Pier",
        description:
            "Take a peaceful walk on the pier and enjoy the panoramic views of the North Sea.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Albert+I-promenade+51A%2C+8400+Oostende%2C+Belgium&auid=7241635302195986083&ll=51.2371493%2C2.9157248&lsp=9902&q=De+Nieuwe+Oostende+Pier", // Add URL manually
      ),
      RouteStop(
        location: const LatLng(51.2340661, 2.9153255),
        title: "Polé Polé Beach",
        description:
            "Finish the route at this restaurant with a terrace, where you can enjoy dinner with a view of the sunset over the North Sea.",
        locationUrl:
            "https://beta.maps.apple.com/?address=Vlaanderenstraat+43%2C+8400+Oostende%2C+Belgium&auid=9073291373160765352&ll=51.2340661%2C2.9153255&lsp=9902&q=Pol%C3%A9+Pol%C3%A9+Beach", // Add URL manually
      ),
    ],
  ),
];
