class UserData {
  String Id;
  String imageUrl;
  String name;
  String emailId;
  UserData({
    required this.Id,
    required this.emailId,
    required this.name,
    this.imageUrl = '',
  });
}

// class Users {
final user = UserData(
    Id: DateTime.now().toString(),
    emailId: 'touseef.iitjmu@gmail.com',
    name: 'Mohammad Touseef',
    imageUrl:
        'https://media.licdn.com/dms/image/C4E03AQF8Pbj9Gfsy2A/profile-displayphoto-shrink_800_800/0/1617222232099?e=2147483647&v=beta&t=apswtbfi0g4Pvn4x0QIg8a2kGlJ5RQsOiMs7s4fDjI8');
// }
