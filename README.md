# youtube-music

A simple vala & webkit2gtk wrapper for Youtube music.

## NOTES

`<ytmusic-player-bar>…</ytmusic-player-bar>` contains the following data that we can use;
```js
const player = document.querySelector('ytmusic-player-bar');
const data = player.__data;
The following data structure;
/**
advertisementMetadata_: {bylineText: Array, title: Object, thumbnailUrl: ""}
bufferedSeconds_: 0
currentItem_: {title: Object, longBylineText: Object, thumbnail: Object, lengthText: Object, selected: true, …}
currentSeconds_: 31
dir_: "ltr"
displayedMetadata_: {bylineText: Array, thumbnailUrl: "https://lh3.googleusercontent.com/MCh2LyaTgzerPtiZ…spPjsI-s_7iSlQmc4re8jeGtdv-vTIkF7G=w60-h60-l90-rj", title:
Object}
doubleDeckerEnabled_: false
formattedHoveredTime_: "0:00"
formattedTime_: "0:31 / 2:28"
hideLikeButtonRenderer_: false
isAdvertisement_: false
isAtLiveHead_: false
isLiveDvrEnabled_: null
isLive_: null
isMobileWeb_: false
isMuted_: false
isPreLive_: null
isVideo_: false
likeButtonRenderer_: {target: {videoId: "IBy7TCSY2wk"}, likeStatus: "INDIFFERENT", likeCount: 29721, likeCountText: Object, likeCountWithLikeText: Object, …}
menuRenderer: {items: Array, trackingParams: "CHwQyCAYASITCPSM4qv1juUCFe8FtwAdlXAFFQ=="}
nerdStatsVisible: false
playerFullscreened_: false
playerInactive_: false
playerPageOpen_: false
playerPageWatchMetadata_: {title: Object, byline: Object, secondaryByline: Object, secondaryTitle: Object, viewCountText: Object, …}
playing_: true
repeatMode_: "NONE"
seekToSeconds_: 0
seekableEndSeconds_: 148
seekableStartSeconds_: 0
showBufferingSpinner: false
viewportSize_: 3
volume_: 100
**/
```


## What does it do?

it loads, so there's that.