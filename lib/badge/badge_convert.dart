class Badge{
 static String badgeSiteAdmin (bool? siteAdmin){
    if(siteAdmin==true) {
      return "ADMIN";
    }
    else {
      return "STAFF";
    }
  }
}