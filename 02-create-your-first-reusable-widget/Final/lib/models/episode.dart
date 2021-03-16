class Episode {
  final int id;
  final String title;
  final String host;
  final String audioUrl;
  final String description;

  Episode({this.title, this.id, this.host, this.audioUrl, this.description});
}

List<Episode> episodes = [
  Episode(
    id: 3,
    title: "A Beginners Guide to Meditation",
    host: "Sanjay Agarwal",
    audioUrl: "audio/ep_3.m4a",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  ),
  Episode(
    id: 2,
    title: "10 ways to improve your flexibility with Lupita Samirez",
    host: "James Gordon",
    audioUrl: "audio/ep_2.m4a",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  ),
  Episode(
    id: 1,
    title: "How Yoga can heal your soul",
    audioUrl: "audio/ep_1.m4a",
    host: "Pete Derrick",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  ),
];
