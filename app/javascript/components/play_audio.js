const playAudio = () => {
  const playButtons = document.querySelectorAll('.dashboard-play-img');
  playButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      const playerId = event.target.id;
      const video = document.getElementById(`player-${playerId}`);
      video.play();
    });
  });


};

export { playAudio }

