/* stream.js - logic for player + chat */
function initStream(container) {
  container.innerHTML = `
    <div class="stream-header">
      <h1 id="streamTitle">stream.niko.horse</h1>
      <div id="streamViewers"></div>
    </div>
    <div class="stream-layout">
      <div class="video-wrap">
        <video id="player" controls autoplay playsinline></video>
        <img id="offlineImage" src="https://niko.horse/files/images/stream/streamofff.png" alt="Stream offline">
      </div>
      <iframe id="chat" title="Twitch Chat"></iframe>
    </div>
  `;

  const video = container.querySelector('#player');
  const offlineImage = container.querySelector('#offlineImage');
  const streamTitle = container.querySelector('#streamTitle');
  const streamViewers = container.querySelector('#streamViewers');
  const chat = container.querySelector('#chat');

  chat.src = `https://www.twitch.tv/embed/donkeyniko/chat?parent=${window.location.hostname}`;

  const streamUrl = 'https://stream.niko.horse/live.m3u8';
  const infoUrl   = 'https://stream.niko.horse/info.txt';
  const pingUrl   = 'https://stream.niko.horse/ping';
  const defaultTitle = 'Stream Offline';

  let retryCount = 0, titleInterval = null, pingInterval = null;
  let currentTitle = "", currentViewers = "", streamIsLive = false;
  const maxRetries = 5, retryDelay = 300, recheckInterval = 500, titleRefreshInterval = 500;

  function pingServer(){ fetch(pingUrl,{cache:'no-store'}).catch(()=>{}); }

  function fetchTitle(){
    fetch(infoUrl,{cache:'no-store'}).then(r=>r.ok?r.text():null)
      .then(text=>{
        if(!text) return;
        let title="", viewers="";
        for(const line of text.split('\n')){
          if(line.startsWith("title:")) title=line.substring(6).trim();
          if(line.startsWith("viewers:")) viewers=line.substring(8).trim();
        }
        if(title && title!==currentTitle){
          currentTitle=title;
          streamTitle.textContent=title;
          document.title=title;
        }
        const viewersDisplay = viewers ? `${viewers} watching` : "";
        if(viewersDisplay !== currentViewers){
          currentViewers=viewersDisplay;
          streamViewers.textContent=viewersDisplay;
        }
      }).catch(()=>{});
  }

  function startTitleWatcher(){
    if(streamIsLive) return;
    streamIsLive = true;
    fetchTitle();
    titleInterval = setInterval(fetchTitle, titleRefreshInterval);
    pingServer();
    pingInterval = setInterval(pingServer, 500);
  }

  function stopTitleWatcher(){
    streamIsLive = false;
    if(titleInterval){ clearInterval(titleInterval); titleInterval=null; }
    if(pingInterval){ clearInterval(pingInterval); pingInterval=null; }
    currentTitle=""; currentViewers="";
  }

  function showOffline(){
    video.style.display="none";
    offlineImage.style.display="block";
    stopTitleWatcher();
    streamTitle.textContent = defaultTitle;
    streamViewers.textContent = "";
    setTimeout(checkStream, recheckInterval);
  }

  function showPlayer(){
    video.style.display="block";
    offlineImage.style.display="none";
    startTitleWatcher();
  }

  function handleError(){
    retryCount++;
    if(retryCount>=maxRetries) showOffline();
    else setTimeout(checkStream, retryDelay);
  }

  function startStream(){
    if(video.canPlayType('application/vnd.apple.mpegurl')){
      video.src = streamUrl;
      video.addEventListener('error', handleError);
      showPlayer();
    } else if(Hls.isSupported()){
      const hls = new Hls({liveSyncDurationCount:3, lowLatencyMode:true});
      hls.loadSource(streamUrl);
      hls.attachMedia(video);
      hls.on(Hls.Events.MANIFEST_PARSED, ()=>{ retryCount=0; showPlayer(); });
      hls.on(Hls.Events.ERROR, (_,data)=>{ if(data.fatal) handleError(); });
    } else showOffline();
  }

  function checkStream(){
    fetch(streamUrl, {method:'HEAD', cache:'no-store'})
      .then(r=>{ if(r.ok){ retryCount=0; startStream(); } else handleError(); })
      .catch(()=>handleError());
  }

  function syncChatHeight(){
    const videoWrap = container.querySelector('.video-wrap');
    if(window.innerWidth >= 900) chat.style.height = videoWrap.offsetHeight + 'px';
    else chat.style.height = '420px';
  }

  window.addEventListener('resize', syncChatHeight);
  new ResizeObserver(syncChatHeight).observe(container.querySelector('.video-wrap'));

  checkStream();
  syncChatHeight();
}
