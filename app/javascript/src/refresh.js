const refresh_position = () => {
  const queuePositionNumber = document.querySelector("#counter");
  let refresh, updateCount;
  function reloadWindow() {
    window.location.reload();
  }
  function updateCounter() {
    const counter = document.getElementById("countdown");
    const currentCounter = parseInt(counter.innerText, 10);
    counter.innerText = currentCounter - 1;
  }
  if (queuePositionNumber) {
    updateCount = setInterval(updateCounter, 1000);
    refresh = setInterval(reloadWindow, 10000);
  }
  if (!queuePositionNumber) {
    clearInterval(refresh);
    clearInterval(updateCount);
  }
};

export { refresh_position };
