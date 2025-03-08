function LoadUserData(username) {
  //Updates the player data's html
  let ret;
  $.ajax({
    type: "GET",
    url: "get_user_statistics.php",
    data: { username: username },
    success: function (data, textStatus, xhr) {
      let json = $.parseJSON(data);
      //The new data is placed inside these divs
      $("#stat-points").text(json[0].points);
      $("#stat-winrate").text(json[0].winrate);
      $("#stat-gamesplayed").text(json[0].all_games_played);
      $("#stat-kills").text(json[0].kills);
      $("#stat-deaths").text(json[0].deaths);
      $("#stat-music").text(
        json[0].music_pack == null ? "No Music" : json[0].music_pack
      );
    },
  });
  return ret;
}
$(document).ready(function () {
  //Load the profile page data
  GetUsername()
    .then(function (username) {
      LoadUserData(username);
    })
    .catch(function (error) {
      console.error("Error:", error);
    });
});
