const refresh_position = () => {
  const queuePositionNumber = document.querySelector("#counter");
  console.log('test');
  let refresh;
  function reloadWindow() {
    window.location.reload();
  }
  if (queuePositionNumber) {
    refresh = setInterval(reloadWindow, 10000);
  }
  if (!queuePositionNumber) {
    clearInterval(refresh);
  }
};

export { refresh_position };
