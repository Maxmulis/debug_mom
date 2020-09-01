// url: "https://api.cloudinary.com/v1_1/ddam4wprg/video/upload"
import Rails from "@rails/ujs";

const initRecordVideo = () => {

  const start = document.getElementById("start");
  const stop = document.getElementById("stop");
  const live = document.getElementById("live");
  const form = document.querySelector("form");

  const stopVideo = () => {
    live.srcObject.getTracks().forEach(track => track.stop());
  }

  // stop.addEventListener("click", stopVideo);

  const stopRecording = () => {
    return new Promise(resolve => stop.addEventListener("click", resolve));
  }

  const startRecording = (stream) => {
    start.style.display = "none";
    stop.style.display = "inline"
    const recorder = new MediaRecorder(stream);
    let data = [];

    recorder.ondataavailable = event => data.push(event.data);
    recorder.start();

    const stopped = new Promise((resolve, reject) => {
      recorder.onstop = resolve;
      recorder.onerror = event => reject(event.name);
    });

    const recorded = stopRecording().then(
      () => {
        stopVideo();
        recorder.state == "recording" && recorder.stop();
      }
    );

    return Promise.all([
      stopped,
      recorded
    ])
    .then(() => data);
  }

  const uploadToCloudinary  = (video) => {
    const formData = new FormData(form);
    formData.append('ticket[video]', audio, 'my_audio.mp3');
    Rails.ajax({
      url: "/tickets",
      type: "post",
      data: formData
    })
  }

  start.addEventListener("click", () => {
    navigator.mediaDevices.getUserMedia({
      audio: true,
      video: false
    })
    .then(stream => {
      live.srcObject = stream;
      live.captureStream = live.captureStream || live.mozCaptureStream;
      return new Promise(resolve => live.onplaying = resolve);
    })
    .then(() => startRecording(live.captureStream()))
    .then (recordedChunks => {
      const recordedBlob = new Blob(recordedChunks, { type: "audio/mp3" });
      console.log(recordedBlob);
      uploadToCloudinary(recordedBlob);
    })
  });
}

export { initRecordVideo };
