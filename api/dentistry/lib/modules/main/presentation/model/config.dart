class Config {

  const Config( {
    this.dropDatabase,
    this.createDatabase,
    this.isPopulateData,
  });

  final bool dropDatabase;
  final bool createDatabase;
  final bool isPopulateData;

}
