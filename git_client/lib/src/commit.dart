class Commit {
  const Commit({
    required this.description,
    required this.hash,
    required this.author,
    required this.committer,
  });

  final String description;
  final String hash;
  final Committer author;
  final Committer committer;
}

class Committer {
  const Committer({
    required this.name,
    required this.email,
    required this.date,
  });

  final String name;
  final String email;
  final DateTime date;
}
