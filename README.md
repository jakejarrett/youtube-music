# youtube-music

A simple vala & webkit2gtk wrapper for Youtube music.

## NOTES

`<ytmusic-player-bar>…</ytmusic-player-bar>` contains the following data that we can use;
```js
const player = document.querySelector('ytmusic-player-bar');
const playerApi = player.playerApi_;
const play = playerApi.playVideo; // function(){}
const pause = playerApi.pauseVideo; // function(){}

// Handling play/pause
playerApi.addEventListener('onStateChange', state => console.log('onStateChange', state));
const states = {
    playing: 1,
    paused: 2,
    stopped: 3, // ? Either stopped or paused, but this only happens when you skip tracks (regardless of direction).
}

// Other events
const playerApiEvents = ["onAdEnd", "onDompaused", "onStateChange", "onDetailedError", "videodatachange"];

// Some other data that may be needed (unlikely).
const data = player.__data;
```


## What does it do?

it loads, so there's that.